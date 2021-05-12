#!/bin/bash

# Usage : 
#	1>	Change the path of the ANNOVAR's CLINVAR Database on "Line 8".
#	2>	After Downloading data from NCBI Variation Viewer, name the files with the correct name of the GENES [named in "GENENAME.tsv" format].
#	3>	Change directory [cd] to the folder on the terminal where all the .tsv files are present and run this script!

CLINVAR=/home/sols/Documents/anil/PIPELINE_NEW_ABI_files/working/geneDB/DB/hg19_clinvar_20150330.txt

# CONVERTS all filenames to Uppercase and keeping extensions the same!
perl -e 's/\.[^\.]*$/rename $_, uc($`) . $&/e for @ARGV' *.tsv

read -p "Enter the name of the Gene: " gene_name
if [ ! -z $gene_name ] 
    then
	echo "The entered gene name is '$gene_name'. "
    else
until [ -d "$dir" ] && [ "$dir" != " " ]
    do
        echo "The Gene name cannot be empty and is required by the MANIPAL System to integrate new Genes."
        echo "Please provide the Name of the Gene : " 
        read gene_name
done
fi

cat $gene_name.tsv | sed '/^#/d' |  awk '{print $2}' | uniq  > clinvar_$gene_name.txt

mkdir LGdb

grep -w -F -f clinvar_$gene_name.txt $CLINVAR > LGdb/hg19_clinvar_20150330$gene_name.txt

perl compileAnnnovarIndex.pl LGdb/hg19_clinvar_20150330$gene_name.txt 1000 > LGdb/hg19_clinvar_20150330$gene_name.txt.idx

rm -rf clinvar_$gene_name.txt

echo " Add the files in the LGdb folder to the following path : /home/sols/Documents/anil/PIPELINE_NEW_ABI_files/working/geneDB "

# mv clinvar/hg19_clinvar_20150330$gene_name.txt /home/sols/Documents/anil/PIPELINE_NEW_ABI_files/working/gene_humanDB/

while true; do
    read -p "Do you want to extract any more genes features from ClinVar database, please enter with 'Yes' or else 'No' : " yn
    case $yn in
        [Yy]* ) bash clinvar_adding_MANIPAL.sh; break;;
        [Nn]* ) echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Thank You for adding new Genes to the the MANIPAL system. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"; exit;;
        * ) echo "Please answer with 'Y' or 'N'. ";;
    esac
done

#!/bin/bash

# Usage : 
#	1>	Change the path of the ANNOVAR's dbSNP Database on "Line 8".
#	2>	After Downloading data from UCSC Table Browser, name the files with the correct name of the GENES [named in "GENENAME.txt" format].
#	3>	Change directory [cd] to the folder on the terminal where all the .txt files are present and run this script!

DBSNP=/home/sols/Documents/anil/PIPELINE_NEW_ABI_files/working/geneDB/DB/hg19_avsnp142.txt

# CONVERTS all filenames to Uppercase and keeping extensions the same!
perl -e 's/\.[^\.]*$/rename $_, uc($`) . $&/e for @ARGV' *.txt

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

cat $gene_name.txt | awk '{print $4}' > snpids_$gene_name.txt

mkdir LGdb

grep -w -F -f snpids_$gene_name.txt $DBSNP > LGdb/hg19_avsnp142$gene_name.txt

rm -rf snpids_$gene_name.txt

echo " Add the files in the LGdb folder to the following path : /home/sols/Documents/anil/PIPELINE_NEW_ABI_files/working/geneDB "

while true; do
    read -p "Do you want to extract any more genes features from dbSNP database, please enter with 'Yes' or else 'No' : " yn
    case $yn in
        [Yy]* ) bash dbSNP_adding_MANIPAL.sh; break;;
        [Nn]* ) echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Thank You for adding new Genes to the the MANIPAL system. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"; exit;;
        * ) echo "Please answer with 'Y' or 'N'. ";;
    esac
done

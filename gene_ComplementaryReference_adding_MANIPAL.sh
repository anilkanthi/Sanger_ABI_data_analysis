#!/bin/bash

# Usage : 
#	1>	Change the path of the ANNOVAR's REFGENE Database on "Line 8".
#	2>	After Downloading data from UCSC Table Browser, name the files with the correct name of the GENES [named in "COMP_GENENAME.fasta" format].
#	3>	Change directory [cd] to the folder on the terminal where all the gene reference sequence [.fasta] files are present and run this script!
			
REFGENE=/home/sols/Documents/anil/PIPELINE_NEW_ABI_files/working/geneDB/DB/hg19_refGene.txt

# CONVERTS all filenames to Uppercase and keeping extensions the same!
perl -e 's/\.[^\.]*$/rename $_, uc($`) . $&/e for @ARGV' *.fasta

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

cat $REFGENE | grep -w "$gene_name" | awk '{print $3}' > gene_chr.txt

chr=$(cat gene_chr.txt | sed -n 1p)

mkdir LGdb

cat $REFGENE | grep -w "$gene_name" | awk '{print $5}' > gene_position.txt

position=$(cat gene_position.txt | sed -n 1p)

sed -i.bak '1 s/^.*$/>'$chr':'$position'/' COMP_$gene_name.fasta

mv COMP_$gene_name.fasta LGdb/

echo " Add the files in the LGdb folder to the following path : /home/sols/Documents/anil/PIPELINE_NEW_ABI_files/working/geneDB "

rm gene_chr.txt gene_position.txt
find -maxdepth 1 -type f -name "*.bak" -delete
find -maxdepth 1 -type f -name "*.fasta~" -delete
find -maxdepth 1 -type f -name "*.sh~" -delete

while true; do
    read -p "Do you want to add any other genes reference sequence to the LGdb database, please enter with 'Yes' or else 'No' : " yn
    case $yn in
        [Yy]* ) bash gene_ComplementaryReference_adding_MANIPAL.sh; break;;
        [Nn]* ) echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Thank You for adding new Genes to the the MANIPAL system. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"; exit;;
        * ) echo "Please answer with 'Y' or 'N'. ";;
    esac
done

#!/bin/bash

# Usage : 
#	1>	Change the path of the ANNOVAR's REFGENE Databases on "Line 7" and "Line 9".
#	2>	Change directory [cd] to any folder of your wish on the terminal and run this script!

REFGENE=/home/sols/Documents/anil/PIPELINE_NEW_ABI_files/working/geneDB/DB/hg19_refGene.txt

REFGENEMRNA=/home/sols/Documents/anil/PIPELINE_NEW_ABI_files/working/geneDB/DB/hg19_refGeneMrna.fa

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

#				 To create hg19_refgene.txt -->
cat $REFGENE  | grep -w "$gene_name" > hg19_refGene$gene_name.txt
                                                                                                                                                                                                                    
mkdir LGdb

mv hg19_refGene$gene_name.txt LGdb/

#				To create hg19_refgeneMrna.txt -->

mkdir refgenemrna

cat $REFGENE | grep -w "$gene_name" | awk '{print $2}' > gene_ids.txt

while IFS="" read -r line; do printf -v line$((++i)) "%s" "$line"; done < gene_ids.txt

if [ -z "$line1" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line1/,+1p" $REFGENEMRNA > refgenemrna/line1.txt ; fi

if [ -z "$line2" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line2/,+1p" $REFGENEMRNA > refgenemrna/line2.txt ; fi

if [ -z "$line3" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line3/,+1p" $REFGENEMRNA > refgenemrna/line3.txt ; fi

if [ -z "$line4" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line4/,+1p" $REFGENEMRNA > refgenemrna/line4.txt ; fi

if [ -z "$line5" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line5/,+1p" $REFGENEMRNA > refgenemrna/line5.txt ; fi

if [ -z "$line6" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line6/,+1p" $REFGENEMRNA > refgenemrna/line6.txt ; fi

if [ -z "$line7" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line7/,+1p" $REFGENEMRNA > refgenemrna/line7.txt ; fi

if [ -z "$line8" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line8/,+1p" $REFGENEMRNA > refgenemrna/line8.txt ; fi

if [ -z "$line9" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line9/,+1p" $REFGENEMRNA > refgenemrna/line9.txt ; fi

if [ -z "$line10" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line10/,+1p" $REFGENEMRNA > refgenemrna/line10.txt ; fi

if [ -z "$line11" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line11/,+1p" $REFGENEMRNA > refgenemrna/line11.txt ; fi

if [ -z "$line12" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line12/,+1p" $REFGENEMRNA > refgenemrna/line12.txt ; fi

if [ -z "$line13" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line13/,+1p" $REFGENEMRNA > refgenemrna/line13.txt ; fi

if [ -z "$line14" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line14/,+1p" $REFGENEMRNA > refgenemrna/line14.txt ; fi

if [ -z "$line15" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line15/,+1p" $REFGENEMRNA > refgenemrna/line15.txt ; fi

if [ -z "$line16" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line16/,+1p" $REFGENEMRNA > refgenemrna/line16.txt ; fi

if [ -z "$line17" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line17/,+1p" $REFGENEMRNA > refgenemrna/line17.txt ; fi

if [ -z "$line18" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line18/,+1p" $REFGENEMRNA > refgenemrna/line18.txt ; fi

if [ -z "$line19" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line19/,+1p" $REFGENEMRNA > refgenemrna/line19.txt ; fi

if [ -z "$line20" ]; then echo "There is no Transcript available for the $gene_name Gene "; else sed -n "/$line20/,+1p" $REFGENEMRNA > refgenemrna/line20.txt ; fi

cd refgenemrna

cat *.txt > hg19_refGeneMrna$gene_name.fa

cd ..

mv refgenemrna/hg19_refGeneMrna$gene_name.fa LGdb/

rm -rf refgenemrna

echo " Add the files in the LGdb folder to the following path : /home/sols/Documents/anil/PIPELINE_NEW_ABI_files/working/geneDB "

while true; do
    read -p "Do you want to extract any more genes features from refGene database, please enter with 'Yes' or else 'No' : " yn
    case $yn in
        [Yy]* ) bash refGene_adding_MANIPAL.sh; break;;
        [Nn]* ) echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Thank You for adding new Genes to the the MANIPAL system. ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"; exit;;
        * ) echo "Please answer with 'Y' or 'N'. ";;
    esac
done

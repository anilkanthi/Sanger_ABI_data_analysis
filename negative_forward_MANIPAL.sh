#!/bin/bash

echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: MANIPAL System ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"

#I -->
# TAKING INPUT FROM USER:


echo "	01. ABCB1		02. ADRB2		03. ATP7B		04. CTSC		05. GJB2 [alias CX26]
	06. GALNS		07. GLB1		08. HBB			09. KRAS		10. ATXN3 [alias MJD]
	11. TWIST2		12. UGT1A		13. WNT7A		14. WISP3		15. TP53 [alias p53]	
	16. HPV"

read -p "Enter any one of the displayed Gene Names: " gene_name
if [ ! -z $gene_name ] 
    then
	echo "The entered gene name is '$gene_name'. "
    else

until [ -d "$dir" ] && [ "$dir" != " " ]
    do
        echo "The Gene name cannot be empty and is required by the MANIPAL System."
        echo "Please provide the Name of the Gene : " 
        read gene_name
done
fi

cd geneDB/

if [ -e $gene_name.fasta ]
then
reference=$gene_name.fasta
else
echo "The entered Gene Reference Name is not correct."
until [ -e "$gene_name.fasta" ]
do
echo "	01. ABCB1		02. ADRB2		03. ATP7B		04. CTSC		05. GJB2 [alias CX26]
	06. GALNS		07. GLB1		08. HBB			09. KRAS		10. ATXN3 [alias MJD]
	11. TWIST2		12. UGT1A		13. WNT7A		14. WISP3		15. TP53 [alias p53]	
	16. HPV"
read -p "Please provide the correct Gene Name from the above list : " gene_name
reference=$gene_name.fasta
done
fi

position=$(sed  -n '/:/p' $reference | cut -d':' -f2 | sed -n 1p)
if [ ! -z "$position" ]
then
echo "The genomic start coordinate of the gene is '$position'."
else
until [ ! -z "$position" ]
do
echo "The genomic start coordinate of the Gene cannot the empty and is required by the MANIPAL System."
read -p "Please provide the edited Gene Reference file [with .fasta extension] : " reference
position=$(sed  -n '/:/p' $reference | cut -d':' -f2 | sed -n 1p)
done
fi

cd ..

read -p "Enter Name of the Forward .ab1 file relevant to the $reference Reference Gene file : " ABI
if [ -f "$ABI" ] && [ "$ABI" != " " ]
then
echo "The entered Forward ABI filename is $ABI."
else
until [ -f "$ABI" ] && [ "$ABI" != " " ]
do
echo "The ABI file cannot be empty and is required by the MANIPAL System."
echo "Please provide the correct Forward ABI file relevant to the $reference Reference Gene file : "
read ABI
done
fi

echo "									 Preparing FASTA file to use as reference ... 							"

sed 's/:.*//' geneDB/$reference > $gene_name.fa

#II -->

mkdir ABI_file fastq phd_dir seq_dir qual_dir

mv $ABI ABI_file/

echo "									 Base Calling ... 										"

#ttuner -id ABI_file -pd phd_dir -sd seq_dir

phred -id ABI_file/ -sd seq_dir -qd qual_dir -pd phd_dir -trim_fasta -trim_phd -trim ""

mv seq_dir/*.seq seq_dir/seqs_fasta.fasta

mv qual_dir/*.qual qual_dir/seqs_fasta.qual

revseq -sequence seq_dir/seqs_fasta.fasta -outseq seq_dir/seqs_fasta.fasta

echo "									 Building FASTQ ... 										"

perl fasta_qual2fastq.pl seq_dir/seqs_fasta.fasta qual_dir/seqs_fasta.qual > fastq/merged.fastq

#III -->

echo "									 Aligning the Reads ... 									"

bwa index -p ALL $gene_name.fa

bwa mem ALL fastq/merged.fastq > result.sam

echo "									 Alignment Post-Processing ...									"

samtools view -Sb result.sam > pipelineMINE.bam

samtools sort pipelineMINE.bam endMINE

samtools index endMINE.bam

samtools faidx $gene_name.fa

echo "									 Calling the Variants ... 									"

freebayes -f $gene_name.fa -C 1 endMINE.bam  > freebayes.vcf

#IV -->

echo "									 VCF file processing ... 									"

sed '/^##/d' freebayes.vcf > freebayes_GRCh37_tail.vcf

#For FORWARD strand

awk -v s=$position '{$2+=s}1' OFS='\t' freebayes_GRCh37_tail.vcf > freebayes_GRCh37_FINAL.vcf

#For reverse complementary strand

#awk -v s=$position '{$2-=s}1' OFS='\t' freebayes_GRCh37_tail.vcf | awk '{print $2}' | sed 's/^-//' > positions.txt

#cat freebayes_GRCh37_tail.vcf | sed 1d  > freebayes_without_header.vcf

#cat freebayes_GRCh37_tail.vcf | sed 1d | awk 'FNR==NR{a[NR]=$1;next}{$2=a[FNR]}1' positions_final.txt freebayes.vcf 

#cat freebayes_GRCh37_tail.vcf | sed 1d | awk 'FNR==NR{a[NR]=$1;next}{$2=a[FNR]}1' OFS='\t' positions.txt freebayes_without_header.vcf > freebayes_GRCh37_FINAL.vcf

bgzip freebayes_GRCh37_FINAL.vcf

#CREATE HEADER FILE for VCF Merging

tabix -r header.txt freebayes_GRCh37_FINAL.vcf.gz > freebayes_GRCh37_FINAL_header.vcf.gz

gunzip freebayes_GRCh37_FINAL_header.vcf.gz

echo "									 Annotating the Variants ... 									"

cd gene_humanDB

cp hg19_refGene$gene_name.txt ../humandb
#cp hg19_refGene$gene_name.txt.idx ../humandb

cp hg19_refGeneMrna$gene_name.fa ../humandb

#cp hg19_snp138$gene_name.txt ../humandb
#cp hg19_snp138$gene_name.txt.idx ../humandb

cp hg19_avsnp142$gene_name.txt ../humandb
cp hg19_avsnp142$gene_name.txt.idx ../humandb

cp hg19_clinvar_20150330$gene_name.txt ../humandb
cp hg19_clinvar_20150330$gene_name.txt.idx ../humandb

cd ..
cd humandb

mv hg19_refGene$gene_name.txt hg19_refGene.txt
#mv hg19_refGene$gene_name.txt.idx hg19_refGene.txt.idx

mv hg19_refGeneMrna$gene_name.fa hg19_refGeneMrna.fa

#mv hg19_snp138$gene_name.txt hg19_snp138.txt
#mv hg19_snp138$gene_name.txt.idx hg19_snp138.txt.idx

mv hg19_avsnp142$gene_name.txt hg19_avsnp142.txt
mv hg19_avsnp142$gene_name.txt.idx hg19_avsnp142.txt.idx

mv hg19_clinvar_20150330$gene_name.txt hg19_clinvar_20150330.txt
mv hg19_clinvar_20150330$gene_name.txt.idx hg19_clinvar_20150330.txt.idx

cd ..

perl convert2annovar.pl freebayes_GRCh37_FINAL_header.vcf -format vcf4 > annovar.human

perl table_annovar.pl -buildver hg19 annovar.human -protocol refGene,avsnp142,clinvar_20150330 -operation g,f,f humandb/

cd humandb

# rm hg19_snp138.txt hg19_snp138.txt.idx

rm hg19_clinvar_20150330.txt.idx hg19_clinvar_20150330.txt hg19_avsnp142.txt hg19_avsnp142.txt.idx hg19_refGeneMrna.fa hg19_refGene.txt

cd ..

mkdir Result
mv annovar.human.hg19_multianno.txt Annovar_Result
mv Annovar_Result Result

cd Result
mv Annovar_Result Annovar_Result_$ABI.txt

cd ..

# II) If gene is on NEGATIVE STRAND!

# A- BLAST for 'FORWARD ABI file'-->
makeblastdb -in geneDB/comp_$gene_name.fasta -dbtype nucl -out $gene_name
blastn -query seq_dir/seqs_fasta.fasta -db $gene_name | sed '1,30d' | sed -n '/Query/,/Sbjct/p' | sed '/Query/ i\ ' > Result/$ABI.blastn

sed 's/| |/|@|/g' Result/$ABI.blastn | sed 's/|  |/|@@|/g' | sed 's/|   |/|@@@|/g' | sed 's/|     |/|@@@@|/g' | sed 's/|      |/|@@@@@|/g' | sed 's/|       |/|@@@@@@|/g' | sed 's/|        |/|@@@@@@@|/g' > Result/$ABI.blastn

find . -name "annovar.human*" -exec rm {} \;
find -maxdepth 1 -type f -name "*.log" -delete

find -maxdepth 1 -type f -name "*.vcf" -delete
find -maxdepth 1 -type f -name "*.fa" -delete
find -maxdepth 1 -type f -name "*.fai" -delete
find -maxdepth 1 -type f -name "*.amb" -delete
find -maxdepth 1 -type f -name "*.ann" -delete
find -maxdepth 1 -type f -name "*.bwt" -delete
find -maxdepth 1 -type f -name "*.pac" -delete
find -maxdepth 1 -type f -name "*.sa" -delete
find -maxdepth 1 -type f -name "*.gz" -delete
find -maxdepth 1 -type f -name "*.sh~" -delete
find -maxdepth 1 -type f -name "*.nsq" -delete
find -maxdepth 1 -type f -name "*.nin" -delete
find -maxdepth 1 -type f -name "*.nhr" -delete

cd ABI_file
mv $ABI ../
cd ..

rm -rf ABI_file fastq  qual_dir

# V -->

echo "									 Result ... 											"

echo "The Annotated Result of the '$ABI' ABI file is present in the Result folder. "


while true; do
    read -p "								Do you wish to process any other ABI file? " yn
    case $yn in
        [Yy]* ) bash MANIPAL_Genes_diagnostic.sh; break;;
        [Nn]* ) echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Finished Forward ABI file processing! ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"; exit;;
        * ) echo "Please answer with 'yes' or 'no' ";;
    esac
done

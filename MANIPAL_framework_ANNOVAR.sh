#!/bin/bash

mkdir ABI_file fasta_qual fastq phd_dir

mv *.ab1 ABI_file/

ttuner -id ABI_file -pd phd_dir

phd2fasta -id phd_dir/ -os fasta_qual/seqs_fasta.fasta -oq fasta_qual/seqs_fasta.qual

perl /Users/Bioinformatician/Documents/SOLS_4th_Semester/ABI_MANIPAL_framework/fasta_qual2fastq.pl fasta_qual/seqs_fasta.fasta fasta_qual/seqs_fasta.qual > fastq/merged.fastq

#
awk -F "\t" '$1 ~ // {print $2"\t"$3}' refGeneSelected.txt
awk -F "\t" '$1 ~ /NM_007294/ {print $2"\t"$3}' refGeneSelected.txt
awk -F "\t" '$1 ~ /NM_007294/ {print $2"\t"$3}' refGeneSelected.txt

# for loop
perl split_fasta.pl GRCh37_p13_NC000005.9.fa

for i in *.fa;
do
position=$(sed  -n '/:/p' GRCh37_p13_NC000005.9.fasta | cut -d':' -f2)
header=$(sed  -n '/:/p' GRCh37_p13_NC000005.9.fasta | cut -d':' -f1)
sed "1s/.*/$header/" GRCh37_p13_NC000005.9.fasta  > reference.fa

bwa index -p ALL reference.fa

bwa mem ALL fastq/merged.fastq > result.sam

samtools view -Sb result.sam > pipelineMINE.bam

samtools sort pipelineMINE.bam endMINE

java -jar /Users/Bioinformatician/Desktop/picard-tools-1.125/picard.jar MarkDuplicates \
MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000\
METRICS_FILE=out.metrics \
REMOVE_DUPLICATES=true \
ASSUME_SORTED=true  \
VALIDATION_STRINGENCY=LENIENT \
INPUT=endMINE.bam \
OUTPUT=out.dedupeMINE.bam

samtools index out.dedupeMINE.bam

samtools faidx reference.fa

freebayes -f reference.fa -C 1 out.dedupeMINE.bam  > freebayes_GRCh37.vcf

sed '/^##/d' freebayes_GRCh37.vcf > freebayes_GRCh37_tail.vcf

awk -v s=$position '{$2+=s}1' OFS='\t' freebayes_GRCh37_tail.vcf > freebayes_GRCh37_FINAL.vcf


bgzip freebayes_GRCh37_FINAL.vcf

#CREATE HEADER FILE for VCF Merging

tabix -r header.txt freebayes_GRCh37_FINAL.vcf.gz > freebayes_GRCh37_FINAL_header.vcf.gz

gunzip freebayes_GRCh37_FINAL_header.vcf.gz

perl convert2annovar.pl freebayes_GRCh37_FINAL_header.vcf -format vcf4 > annovar.human

perl table_annovar.pl -buildver hg19 annovar.human -protocol snp138,clinvar_20140929,refGene,knownGene,ensGene,cosmic70,nci60,ljb26_all,snp138NonFlagged -operation f,f,g,g,g,f,f,f,f /Volumes/\!WALL-E\!/annovar/humandb/humandb/

mkdir Result
mv annovar.human.hg19_multianno.txt Annovar_Result
mv Annovar_Result Result

find . -name "annovar.human*" -exec rm {} \;
find -maxdepth 1 -type f -name "*.log" -delete
find -maxdepth 1 -type f -name "*.sam" -delete
find -maxdepth 1 -type f -name "*.bam" -delete
find -maxdepth 1 -type f -name "*.bai" -delete
find -maxdepth 1 -type f -name "*.metrics" -delete
find -maxdepth 1 -type f -name "*.vcf" -delete
find -maxdepth 1 -type f -name "*.amb" -delete
find -maxdepth 1 -type f -name "*.ann" -delete
find -maxdepth 1 -type f -name "*.bwt" -delete
find -maxdepth 1 -type f -name "*.pac" -delete
find -maxdepth 1 -type f -name "*.sa" -delete
find -maxdepth 1 -type f -name "*.gz" -delete
find -maxdepth 1 -type f -name "*.sh~" -delete
find -maxdepth 1 -type f -name "*.fai" -delete
find -maxdepth 1 -type f -name "*.fa" -delete

rm -rf fasta_qual fastq phd_dir

done

#IF ONE FASTA HEADER-->

position=$(sed  -n '/:/p' GRCh37_p13_NC000005.9.fasta | cut -d':' -f2)
header=$(sed  -n '/:/p' GRCh37_p13_NC000005.9.fasta | cut -d':' -f1)
sed "1s/.*/$header/" GRCh37_p13_NC000005.9.fasta  > reference.fa

#IF MULTIPLE FASTA HEADER-->

perl split_fasta.pl GRCh37_p13_NC000005.9.fasta

position=$(sed  -n '/:/p' GRCh37_p13_NC000005.9.fasta | cut -d':' -f2)
header=$(sed  -n '/:/p' GRCh37_p13_NC000005.9.fasta | cut -d':' -f1)
sed "1s/.*/$header/" GRCh37_p13_NC000005.9.fasta  > reference1.fa


# Extracting gene start position based on ID-->
# Take input from user, STORE in $gene_id

read gene_id

gene_position=$(grep -n "$gene_id" hg19_refGeneMrna.fa | cut -d ':' -f4 | awk '{print $1}' | cut -d ')' -f1)


#To get the FASTA sequence from GENE ID!!! -->

awk '/'$gene_id'/ { getline; print $0 }' hg19_refGeneMrna.fa

#Prints gene name and gene start position based on gene_id

read gene_id

grep -n "$gene_id" hg19_refGene.txt | awk '{print $13,$5}' | head -1


#To get gene_name and gene_ID from gene_start

read gene_start

grep -n "$gene_start" hg19_refGene.txt | awk '{print $13,$2}'


# To get start position from Gene Name-->
read gene_name

grep -n "$gene_name" hg19_refGene.txt | awk '{print $13,$5}'

# grep -n "NM_000024" hg19_refGene.txt | cut -d ',' -f3 | awk '{print $2}' 





bwa index -p ALL reference.fa

bwa mem ALL fastq/merged.fastq > result.sam

samtools view -Sb result.sam > pipelineMINE.bam

samtools sort pipelineMINE.bam endMINE

java -jar /Users/Bioinformatician/Desktop/picard-tools-1.125/picard.jar MarkDuplicates \
                            MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000\
                            METRICS_FILE=out.metrics \
                            REMOVE_DUPLICATES=true \
                            ASSUME_SORTED=true  \
                            VALIDATION_STRINGENCY=LENIENT \
                            INPUT=endMINE.bam \
                            OUTPUT=out.dedupeMINE.bam 

samtools index out.dedupeMINE.bam

samtools faidx reference.fa

freebayes -f reference.fa -C 1 out.dedupeMINE.bam  > freebayes_GRCh37.vcf

#makeblastdb -dbtype nucl -out ADRB2 -in /home/sols/Documents/anil/PIPELINE_ANNOVAR/all_human.fa

#blastall -p blastn -V T -F F -e 0.001 -b 10000 -v 10000 -d ADRB2 -i seqs_fasta.fasta -o BlastN.out

#tclsh tcl_blast_parser_123_V047.tcl BlastN.out BlastN.out.parsed 20 40 100 MATRIX

#name=( $(awk '{print $13}' ./BlastN.out.parsed.all_hits) )

#echo $name > POSITION.txt

#constant=$(echo $name | awk '{print $1 }')

sed '/^##/d' freebayes_GRCh37.vcf > freebayes_GRCh37_tail.vcf

awk -v s=$position '{$2+=s}1' OFS='\t' freebayes_GRCh37_tail.vcf > freebayes_GRCh37_FINAL.vcf


bgzip freebayes_GRCh37_FINAL.vcf

#CREATE HEADER FILE for VCF Merging

tabix -r header.txt freebayes_GRCh37_FINAL.vcf.gz > freebayes_GRCh37_FINAL_header.vcf.gz

gunzip freebayes_GRCh37_FINAL_header.vcf.gz

perl convert2annovar.pl freebayes_GRCh37_FINAL_header.vcf -format vcf4 > annovar.human

perl table_annovar.pl -buildver hg19 annovar.human -protocol snp138,clinvar_20140929,refGene,knownGene,ensGene,cosmic70,nci60,ljb26_all,snp138NonFlagged -operation f,f,g,g,g,f,f,f,f /Volumes/\!WALL-E\!/annovar/humandb/humandb/


#sed  -n '/^#/p' A04_FINAL.vcf | cut  -f2 | sed 's/^[0-9]*/POS/g'



# sed '/^##/!d' freebayes_GRCh38.vcf > freebayes_GRCh38_head.txt

# echo $name | awk '{print $1 }' POSITION.txt | awk '{$2+='$constant'}1' freebayes_GRCh38_tail.txt > result.vcf

# constant=$(cat SUBJECT_StartPosition.txt)

# constant= echo $name ($ awk '{print $1 }' POSITION.txt)

#awk '{print $1 }' POSITION.txt > SUBJECT_StartPosition.txt


mkdir Result
mv annovar.human.hg19_multianno.txt Annovar_Result
mv Annovar_Result Result 

find . -name "annovar.human*" -exec rm {} \;
find -maxdepth 1 -type f -name "*.log" -delete   
find -maxdepth 1 -type f -name "*.sam" -delete   
find -maxdepth 1 -type f -name "*.bam" -delete   
find -maxdepth 1 -type f -name "*.bai" -delete   
find -maxdepth 1 -type f -name "*.metrics" -delete
find -maxdepth 1 -type f -name "*.vcf" -delete
find -maxdepth 1 -type f -name "*.amb" -delete
find -maxdepth 1 -type f -name "*.ann" -delete
find -maxdepth 1 -type f -name "*.bwt" -delete
find -maxdepth 1 -type f -name "*.pac" -delete
find -maxdepth 1 -type f -name "*.sa" -delete
find -maxdepth 1 -type f -name "*.gz" -delete
find -maxdepth 1 -type f -name "*.sh~" -delete
find -maxdepth 1 -type f -name "*.fai" -delete
find -maxdepth 1 -type f -name "*.fa" -delete

rm -rf fasta_qual fastq phd_dir

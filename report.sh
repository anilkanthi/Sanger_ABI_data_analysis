						#Genomic Report codes:
cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed 's/    /|/g' > ATP7B_Genomic_Report.txt

#for first 
chr=$(cat ATP7B_Genomic_Report.txt |sed '1,1d'| cut -d'|' -f1 |  sed '1d')
ref=$(cat ATP7B_Genomic_Report.txt |sed '1,1d'| cut -d'|' -f4 |  sed '2d')
alt=$(cat ATP7B_Genomic_Report.txt |sed '1,1d'| cut -d'|' -f4 |  sed '1d')

awk -v n=2 -v s="$chr" 'NR == n {print s} {print}' template.txt
OR
sed '/chr:/a '$chr'' template.txt





#To get only the First variation line.
cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p'

#To get only the First variation line.
cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '3p'

#To get only the First variation line.
cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '4p'

#chr

rsID=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed '2q;d' | cut -d'        ' -f11)

gDNA_end=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed '2q;d' | cut -d'    ' -f3)

variant_location=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'   ' -f6)
gene_name_1=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'	' -f7)
variant_type=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'      ' -f9 | sed -e 's/./\U&/' | sed 's/ /-/g')

# 						!!!To get the GENOMIC LOCATION OF VARIANT_1 !!!
[I]
chr_1=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed '2q;d' | cut -d'       ' -f1)
gDNA_start=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed '2q;d' | cut -d'  ' -f2)
ref=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'        ' -f4)
alt=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'        ' -f5)

cat chr_1.txt gDNA_start_1.txt > chr_1_gDNA_start.txt
awk 'ORS=NR%2?FS:RS' chr_1_gDNA_start.txt | sed 's/ /:/g' > chr_1_gDNA_start_COMBINED.txt
cat ref_1.txt alt_1.txt > ref_alt.txt
awk 'ORS=NR%2?FS:RS' ref_alt.txt |  sed 's/ />/g' > ref_alt_COMBINED.txt
cat chr_1_gDNA_start_COMBINED.txt ref_alt_COMBINED.txt > chr_gDNA_ref_alt_FINAL.txt
awk 'ORS=NR%2?FS:RS' chr_gDNA_ref_alt_FINAL.txt | sed 's/ //g' > GENOMIC_LOCATION_of_variant_1.txt

[II]
variant_hgvs=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed '2q;d' | cut -d'        ' -f10 | cut -d':' -f4)

#AAchange.transcript.exon,hgvs
transcript_count=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed '2q;d' |  uniq -c | grep -o NM  | wc -l)
transcript_id=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed '2q;d' | cut -d'       ' -f10 | cut -d':' -f 2)
exon_number=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed '2q;d' | cut -d' ' -f10 | cut -d':' -f3 | perl -p -e 's/^(.{4})/$1 /')

aa_change=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed '2q;d' | cut -d'   ' -f10 | cut -d':' -f5 | cut -d',' -f1)

#CLINVAR
disease=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'=' -f3 | cut -d '|' -f1 |perl -p -e 's/_/ /g')
classification=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'      ' -f12 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/') 	:(
clinvar_ids=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'        ' -f12 | cut -d'=' -f 5 | cut -d';' -f1 | sed 's/|/, /g')
gene_reviews_id=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'    ' -f12 |cut -d'=' -f 7 | cut -d':' -f1)
medgen_id=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'  ' -f12 |cut -d'=' -f 7 | cut -d':' -f2)
omim_id=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'    ' -f12 |cut -d'=' -f 7 | cut -d':' -f3)

SIFT_score=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d' ' -f13)
SIFT_prediction=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'    ' -f14)
all_1000g=$(cat Annovar_Result_Seq_E04_W93_EX12_F_010.ab1.txt | sed -n '2p' | cut -d'  ' -f39)									:(

#Get all variables and make a new file.
cat template.txt | sed $'1i'$chr'\t'$gene'\t'$ref'\t'$alt'' > template_1.txt
bgzip template_1.txt
tabix -r header_template.txt template_1.txt.gz > template_1_FINAL.txt.gz
gunzip template_1_FINAL.txt.gz 

# To HTML-->
# A] Creates an html table of all fields from ANNOVAR result.
cat Annovar_Result_A03_PF187_BAR1AF_001.ab1.txt| awk 'BEGIN{print "<table>"} {print "<tr>";for(i=1;i<=NF;i++)print "<td>" $i"</td>";print "</tr>"} END{print "</table>"}' > AO3_AWK.html


# 1/6/15 Using sed to pass shell variable to html!
cat a.html |  sed -e "s/{{title}}/Recent Stats/g" -e "s/{{date1}}/$(date)/g" -e "s/{{[^}]*}}/UNKNOWN/g"

#	EXTRACT EACH FIELD INTO A FILE AND COMBINE using
paste -d'\t' *.txt > fields_combined.txt
# 					AWK Working [USE fields_combines.txt to create HTML using AWK]:

awk 'BEGIN { print "<table border="1">" }
     { print "<td width="750" align="center"><b>Gene Name</b></td> <td width="750" align="center"><b>Condition diagnosed</b></td></tr> <tr> <td>" $7 "</td><td>" $4 "</td> </tr> "  }
     END   { print "</table>" }' fields_combined.txt > MANIPAL_working.html





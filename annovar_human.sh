#!/bin/bash

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# MAIN --> To pass the value of the number of significant variants to a variable.

clinsig=$(cat annovar.human.hg19_clinvar_20150330_dropped | wc -l)

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# To generate POSITIVE or NEGATIVE result.

if [ $clinsig == 0 ]
then
echo "<table bgcolor="LightGreen " border="1" cellpadding="10">
<tr>
    <td width=1500 align="center"><strong>RESULT: Negative - No variants were identified in the $gene_name gene for causing the diagnosed condition.</strong></td>
</tr></table>" >  new/Result.html

elif [ $clinsig == 1 ]
then
echo "<table bgcolor="IndianRed" border="1" cellpadding="10">
<tr>
    <td width=1500 align="center"><strong>RESULT: Positive - A known variant causing the diagnosed condition was identified in the $gene_name gene.</strong></td>
</tr></table>" >  new/Result.html

elif [ $clinsig > 1 ]
then
echo "<table bgcolor="IndianRed" border="1" cellpadding="10">
<tr>
    <td width=1500 align="center"><strong>RESULT: Positive - Known variants causing the diagnosed condition were identified in the $gene_name gene.</strong></td>
</tr></table>" >  new/Result.html

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#To get clinvar disease name

clinvar_diseases=$(cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | wc -l)

if [ $clinvar_diseases == 0 ]
	then 
	echo "No clinically relevant diseases were identified for the diagnosed condition." > new/clinvar_diseases.txt
	elif [ $clinvar_diseases == 1 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '1p' | sed 's/_/ /g' > new/clinvar_diseases_1_1.txt
	clinvar_diseases_1_1=$(cat new/clinvar_diseases_1_1.txt)

elif [ $clinvar_diseases == 2 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '1p' | sed 's/_/ /g' > new/clinvar_diseases_1_2.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '2p' | sed 's/_/ /g' > new/clinvar_diseases_2_2.txt
	clinvar_diseases_1_2=$(cat new/clinvar_diseases_1_2.txt)
	clinvar_diseases_2_2=$(cat new/clinvar_diseases_2_2.txt)

elif [ $clinvar_diseases == 3 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '1p' | sed 's/_/ /g' > new/clinvar_diseases_1_3.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '2p' | sed 's/_/ /g' > new/clinvar_diseases_2_3.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '3p' | sed 's/_/ /g' > new/clinvar_diseases_3_3.txt
	clinvar_diseases_1_3=$(cat new/clinvar_diseases_1_3.txt)
	clinvar_diseases_2_3=$(cat new/clinvar_diseases_2_3.txt)
	clinvar_diseases_3_3=$(cat new/clinvar_diseases_3_3.txt)

elif [ $clinvar_diseases == 4 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '1p' | sed 's/_/ /g' > new/clinvar_diseases_1_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '2p' | sed 's/_/ /g' > new/clinvar_diseases_2_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '3p' | sed 's/_/ /g' > new/clinvar_diseases_3_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '4p' | sed 's/_/ /g' > new/clinvar_diseases_4_4.txt
	clinvar_diseases_1_4=$(cat new/clinvar_diseases_1_4.txt)
	clinvar_diseases_2_4=$(cat new/clinvar_diseases_2_4.txt)
	clinvar_diseases_3_4=$(cat new/clinvar_diseases_3_4.txt)
	clinvar_diseases_4_4=$(cat new/clinvar_diseases_4_4.txt)

elif [ $clinvar_diseases == 5 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '1p' | sed 's/_/ /g' > new/clinvar_diseases_1_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '2p' | sed 's/_/ /g' > new/clinvar_diseases_2_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '3p' | sed 's/_/ /g' > new/clinvar_diseases_3_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '4p' | sed 's/_/ /g' > new/clinvar_diseases_4_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'=' -f3 | cut -d '|' -f1 | cut -d';' -f1 | sed -n '5p' | sed 's/_/ /g' > new/clinvar_diseases_5_5.txt
	clinvar_diseases_1_5=$(cat new/clinvar_diseases_1_5.txt)
	clinvar_diseases_2_5=$(cat new/clinvar_diseases_2_5.txt)
	clinvar_diseases_3_5=$(cat new/clinvar_diseases_3_5.txt)
	clinvar_diseases_4_5=$(cat new/clinvar_diseases_4_5.txt)
	clinvar_diseases_5_5=$(cat new/clinvar_diseases_5_5.txt)

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# to get clinvar classification. Whether pathogenic or non-pathogenic.

clinvar_classification=$(cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | wc -l)

if [ $clinvar_classification == 0 ]
	then
	echo "No clinically significant classification was found for the diagnosed condition." > new/clinvar_classification.txt

elif [ $clinvar_classification == 1 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '1p' > new/clinvar_classification_1_1.txt
	clinvar_classification_1_1=$(cat new/clinvar_classification_1_1.txt)

elif [ $clinvar_classification == 2 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '1p' > new/clinvar_classification_1_2.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '2p' > new/clinvar_classification_2_2.txt
	clinvar_classification_1_2=$(cat new/clinvar_classification_1_2.txt)
	clinvar_classification_2_2=$(cat new/clinvar_classification_2_2.txt)

elif [ $clinvar_classification == 3 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '1p' > new/clinvar_classification_1_3.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '2p' > new/clinvar_classification_2_3.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '3p' > new/clinvar_classification_3_3.txt
	clinvar_classification_1_3=$(cat new/clinvar_classification_1_3.txt)
	clinvar_classification_2_3=$(cat new/clinvar_classification_2_3.txt)
	clinvar_classification_3_3=$(cat new/clinvar_classification_3_3.txt)

elif [ $clinvar_classification == 4 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '1p' > new/clinvar_classification_1_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '2p' > new/clinvar_classification_2_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '3p' > new/clinvar_classification_3_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '4p' > new/clinvar_classification_4_4.txt
	clinvar_classification_1_4=$(cat new/clinvar_classification_1_4.txt)
	clinvar_classification_2_4=$(cat new/clinvar_classification_2_4.txt)
	clinvar_classification_3_4=$(cat new/clinvar_classification_3_4.txt)
	clinvar_classification_4_4=$(cat new/clinvar_classification_4_4.txt)

elif [ $clinvar_classification == 5 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '1p' > new/clinvar_classification_1_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '2p' > new/clinvar_classification_2_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '3p' > new/clinvar_classification_3_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '4p' > new/clinvar_classification_4_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f2 | cut -d'=' -f 2 | cut -d"|" -f1 | sed -e 's/./\U&/' | cut -d';' -f1  | sed -n '5p' > new/clinvar_classification_5_5.txt
	clinvar_classification_1_5=$(cat new/clinvar_classification_1_5.txt)
	clinvar_classification_2_5=$(cat new/clinvar_classification_2_5.txt)
	clinvar_classification_3_5=$(cat new/clinvar_classification_3_5.txt)
	clinvar_classification_4_5=$(cat new/clinvar_classification_4_5.txt)
	clinvar_classification_5_5=$(cat new/clinvar_classification_5_5.txt)

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# To get chr

if [ $clinsig == 0 ]
	then
	echo "There are no Clinically significant mutations."

elif [ $clinsig == 1 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '1p' > new/chr_1_1.txt

elif [ $clinsig == 2 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '1p' > new/chr_1_2.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '2p' > new/chr_2_2.txt

elif [ $clinsig == 3 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '1p' > new/chr_1_2.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '2p' > new/chr_2_2.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '3p' > new/chr_3_2.txt

elif [ $clinsig == 4 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '1p' > new/chr_1_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '2p' > new/chr_2_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '3p' > new/chr_3_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '4p' > new/chr_4_4.txt

elif [ $clinsig == 5 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '1p' > new/chr_1_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '2p' > new/chr_2_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '3p' > new/chr_3_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '4p' > new/chr_4_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f3 | sed -n '5p' > new/chr_5_5.txt

fi

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# To get gDNA start

if [ $clinsig == 0 ]
	then
	echo "There are no Clinically significant mutations."

elif [ $clinsig == 1 ]
	then	
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '1p' > new/gDNA_start_1_1.txt

elif [ $clinsig == 2 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '1p' > new/gDNA_start_1_2.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '2p' > new/gDNA_start_2_2.txt

elif [ $clinsig == 3 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '1p' > new/gDNA_start_1_3.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '2p' > new/gDNA_start_2_3.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '3p' > new/gDNA_start_3_3.txt

elif [ $clinsig == 4 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '1p' > new/gDNA_start_1_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '2p' > new/gDNA_start_2_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '3p' > new/gDNA_start_3_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '4p' > new/gDNA_start_4_4.txt

elif [ $clinsig == 5 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '1p' > new/gDNA_start_1_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '2p' > new/gDNA_start_2_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '3p' > new/gDNA_start_3_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '4p' > new/gDNA_start_4_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f4 | sed -n '5p' > new/gDNA_start_5_5.txt

fi

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# To get ref

if [ $clinsig == 0 ]
	then
	echo "There are no Clinically significant mutations."

elif [ $clinsig == 1 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '1p' > new/ref_1_1.txt

elif [ $clinsig == 2 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '1p' > new/ref_1_2.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '2p' > new/ref_2_2.txt

elif [ $clinsig == 3 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '1p' > new/ref_1_3.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '2p' > new/ref_2_3.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '3p' > new/ref_3_3.txt

elif [ $clinsig == 4 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '1p' > new/ref_1_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '2p' > new/ref_2_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '3p' > new/ref_3_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '4p' > new/ref_4_4.txt

elif [ $clinsig == 5 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '1p' > new/ref_1_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '2p' > new/ref_2_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '3p' > new/ref_3_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '4p' > new/ref_4_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f6 | sed -n '5p' > new/ref_5_5.txt

fi

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# To get alt

if [ $clinsig == 0 ]
	then
	echo "There are no Clinically significant mutations."

elif [ $clinsig == 1 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '1p' > new/alt_1_1.txt

elif [ $clinsig == 2 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '1p' > new/alt_1_2.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '2p' > new/alt_2_2.txt

elif [ $clinsig == 3 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '1p' > new/alt_1_3.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '2p' > new/alt_2_3.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '3p' > new/alt_3_3.txt

elif [ $clinsig == 4 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '1p' > new/alt_1_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '2p' > new/alt_2_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '3p' > new/alt_3_4.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '4p' > new/alt_4_4.txt

elif [ $clinsig == 5 ]
	then
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '1p' > new/alt_1_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '2p' > new/alt_2_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '3p' > new/alt_3_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '4p' > new/alt_4_5.txt
	cat annovar.human.hg19_clinvar_20150330_dropped | cut -d'	' -f7 | sed -n '5p' > new/alt_5_5.txt

fi

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# To combine chr and gDNA start

if [ $clinsig == 0 ]
	then
	echo "There are no Clinically significant mutations."

elif [ $clinsig == 1 ]
	then
	cat new/chr_1_1.txt new/gDNA_start_1_1.txt > new/chr_1_1_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_1_1_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_1_1.txt

elif [ $clinsig == 2 ]
	then
	cat new/chr_1_2.txt new/gDNA_start_1_2.txt > new/chr_1_2_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_1_2_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_1_2.txt
	cat new/chr_2_2.txt new/gDNA_start_2_2.txt > new/chr_2_2_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_2_2_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_2_2.txt

elif [ $clinsig == 3 ]
	then
	cat new/chr_1_3.txt new/gDNA_start_1_3.txt > new/chr_1_3_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_1_3_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_1_3.txt
	cat new/chr_2_3.txt new/gDNA_start_2_3.txt > new/chr_2_3_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_2_3_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_2_3.txt
	cat new/chr_3_3.txt new/gDNA_start_3_3.txt > new/chr_3_3_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_3_3_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_3_3.txt

elif [ $clinsig == 4 ]
	then
	cat new/chr_1_4.txt new/gDNA_start_1_4.txt > new/chr_1_4_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_1_4_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_1_4.txt
	cat new/chr_2_4.txt new/gDNA_start_2_4.txt > new/chr_2_4_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_2_4_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_2_4.txt
	cat new/chr_3_4.txt new/gDNA_start_3_4.txt > new/chr_3_4_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_3_4_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_3_4.txt
	cat new/chr_4_4.txt new/gDNA_start_4_4.txt > new/chr_4_4_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_4_4_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_4_4.txt

elif [ $clinsig == 5 ]
	then
	cat new/chr_1_5.txt new/gDNA_start_1_5.txt > new/chr_1_5_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_1_5_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_1_5.txt
	cat new/chr_2_5.txt new/gDNA_start_2_5.txt > new/chr_2_5_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_2_5_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_2_5.txt
	cat new/chr_3_5.txt new/gDNA_start_3_5.txt > new/chr_3_5_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_3_5_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_3_5.txt
	cat new/chr_4_5.txt new/gDNA_start_4_5.txt > new/chr_4_5_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_4_5_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_4_5.txt
	cat new/chr_5_5.txt new/gDNA_start_5_5.txt > new/chr_5_5_gDNA_start.txt
	awk 'ORS=NR%2?FS:RS' new/chr_5_5_gDNA_start.txt | sed 's/ /:/g' > new/chr_gDNA_start_COMBINED_5_5.txt

fi

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# To get Genomic location of the mutation.

if [ $clinsig == 0 ]
	then
	echo "There are no Clinically significant mutations."

elif [ $clinsig == 1 ]
	then
	cat new/ref_1_1.txt new/alt_1_1.txt > new/ref_alt_1_1.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_1_1.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_1_1.txt
	cat new/chr_gDNA_start_COMBINED_1_1.txt new/ref_alt_COMBINED_1_1.txt > new/chr_gDNA_ref_alt_FINAL_1_1.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_1_1.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_1_1.txt
	GENOMIC_LOCATION_of_variant_1_1=$(cat new/GENOMIC_LOCATION_of_variant_1_1.txt)

elif [ $clinsig == 2 ]
	then
	cat new/ref_1_2.txt new/alt_1_2.txt > new/ref_alt_1_2.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_1_2.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_1_2.txt
	cat new/chr_gDNA_start_COMBINED_1_2.txt new/ref_alt_COMBINED_1_2.txt > new/chr_gDNA_ref_alt_FINAL_1_2.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_1_2.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_1_2.txt
	cat new/ref_2_2.txt new/alt_2_2.txt > new/ref_alt_2_2.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_2_2.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_2_2.txt
	cat new/chr_gDNA_start_COMBINED_2_2.txt new/ref_alt_COMBINED_2_2.txt > new/chr_gDNA_ref_alt_FINAL_2_2.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_2_2.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_2_2.txt
	GENOMIC_LOCATION_of_variant_1_2=$(cat new/GENOMIC_LOCATION_of_variant_1_2.txt)
	GENOMIC_LOCATION_of_variant_2_2=$(cat new/GENOMIC_LOCATION_of_variant_2_2.txt)

elif [ $clinsig == 3 ]
	then
	cat new/ref_1_3.txt new/alt_1_3.txt > new/ref_alt_1_3.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_1_3.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_1_3.txt
	cat new/chr_gDNA_start_COMBINED_1_3.txt new/ref_alt_COMBINED_1_3.txt > new/chr_gDNA_ref_alt_FINAL_1_3.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_1_3.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_1_3.txt
	cat new/ref_2_3.txt new/alt_2_3.txt > new/ref_alt_2_3.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_2_3.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_2_3.txt
	cat new/chr_gDNA_start_COMBINED_2_3.txt new/ref_alt_COMBINED_2_3.txt > new/chr_gDNA_ref_alt_FINAL_2_3.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_2_3.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_2_3.txt
	cat new/ref_3_3.txt new/alt_3_3.txt > new/ref_alt_3_3.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_3_3.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_3_3.txt
	cat new/chr_gDNA_start_COMBINED_3_3.txt new/ref_alt_COMBINED_3_3.txt > new/chr_gDNA_ref_alt_FINAL_3_3.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_3_3.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_3_3.txt
	GENOMIC_LOCATION_of_variant_1_3=$(cat new/GENOMIC_LOCATION_of_variant_1_3.txt)
	GENOMIC_LOCATION_of_variant_2_3=$(cat new/GENOMIC_LOCATION_of_variant_2_3.txt)
	GENOMIC_LOCATION_of_variant_3_3=$(cat new/GENOMIC_LOCATION_of_variant_3_3.txt)

elif [ $clinsig == 4 ]
	then
	cat new/ref_1_4.txt new/alt_1_4.txt > new/ref_alt_1_4.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_1_4.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_1_4.txt
	cat new/chr_gDNA_start_COMBINED_1_4.txt new/ref_alt_COMBINED_1_4.txt > new/chr_gDNA_ref_alt_FINAL_1_4.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_1_4.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_1_4.txt
	cat new/ref_2_4.txt new/alt_2_4.txt > new/ref_alt_2_4.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_2_4.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_2_4.txt
	cat new/chr_gDNA_start_COMBINED_2_4.txt new/ref_alt_COMBINED_2_4.txt > new/chr_gDNA_ref_alt_FINAL_2_4.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_2_4.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_2_4.txt
	cat new/ref_3_4.txt new/alt_3_4.txt > new/ref_alt_3_4.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_3_4.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_3_4.txt
	cat new/chr_gDNA_start_COMBINED_3_4.txt new/ref_alt_COMBINED_3_4.txt > new/chr_gDNA_ref_alt_FINAL_3_4.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_3_4.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_3_4.txt
	cat new/ref_4_4.txt new/alt_4_4.txt > new/ref_alt_4_4.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_4_4.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_4_4.txt
	cat new/chr_gDNA_start_COMBINED_4_4.txt new/ref_alt_COMBINED_4_4.txt > new/chr_gDNA_ref_alt_FINAL_4_4.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_4_4.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_4_4.txt
	GENOMIC_LOCATION_of_variant_1_4=$(cat new/GENOMIC_LOCATION_of_variant_1_4.txt)
	GENOMIC_LOCATION_of_variant_2_4=$(cat new/GENOMIC_LOCATION_of_variant_2_4.txt)
	GENOMIC_LOCATION_of_variant_3_4=$(cat new/GENOMIC_LOCATION_of_variant_3_4.txt)
	GENOMIC_LOCATION_of_variant_4_4=$(cat new/GENOMIC_LOCATION_of_variant_4_4.txt)

elif [ $clinsig == 5 ]
	then
	cat new/ref_1_5.txt new/alt_1_5.txt > new/ref_alt_1_5.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_1_5.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_1_5.txt
	cat new/chr_gDNA_start_COMBINED_1_5.txt new/ref_alt_COMBINED_1_5.txt > new/chr_gDNA_ref_alt_FINAL_1_5.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_1_5.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_1_5.txt
	cat new/ref_2_5.txt new/alt_2_5.txt > new/ref_alt_2_5.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_2_5.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_2_5.txt
	cat new/chr_gDNA_start_COMBINED_2_5.txt new/ref_alt_COMBINED_2_5.txt > new/chr_gDNA_ref_alt_FINAL_2_5.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_2_5.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_2_5.txt
	cat new/ref_3_5.txt new/alt_3_5.txt > new/ref_alt_3_5.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_3_5.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_3_5.txt
	cat new/chr_gDNA_start_COMBINED_3_5.txt new/ref_alt_COMBINED_3_5.txt > new/chr_gDNA_ref_alt_FINAL_3_5.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_3_5.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_3_5.txt
	cat new/ref_4_5.txt new/alt_4_5.txt > new/ref_alt_4_5.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_4_5.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_4_5.txt
	cat new/chr_gDNA_start_COMBINED_4_5.txt new/ref_alt_COMBINED_4_5.txt > new/chr_gDNA_ref_alt_FINAL_4_5.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_4_5.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_4_5.txt
	cat new/ref_5_5.txt new/alt_5_5.txt > new/ref_alt_5_5.txt
	awk 'ORS=NR%2?FS:RS' new/ref_alt_5_5.txt |  sed 's/ />/g' > new/ref_alt_COMBINED_5_5.txt
	cat new/chr_gDNA_start_COMBINED_5_5.txt new/ref_alt_COMBINED_5_5.txt > new/chr_gDNA_ref_alt_FINAL_5_5.txt
	awk 'ORS=NR%2?FS:RS' new/chr_gDNA_ref_alt_FINAL_5_5.txt | sed 's/ //g' > new/GENOMIC_LOCATION_of_variant_5_5.txt
	GENOMIC_LOCATION_of_variant_1_5=$(cat new/GENOMIC_LOCATION_of_variant_1_5.txt)
	GENOMIC_LOCATION_of_variant_2_5=$(cat new/GENOMIC_LOCATION_of_variant_2_5.txt)
	GENOMIC_LOCATION_of_variant_3_5=$(cat new/GENOMIC_LOCATION_of_variant_3_5.txt)
	GENOMIC_LOCATION_of_variant_4_5=$(cat new/GENOMIC_LOCATION_of_variant_4_5.txt)
	GENOMIC_LOCATION_of_variant_5_5=$(cat new/GENOMIC_LOCATION_of_variant_5_5.txt)

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# To compare the start position of the clinically significant mutation from clinvar.dropped and the start position from the refGene.exonic file
#exonic_variant_position_1=$(cut -d'	' -f5 annovar.human.refGene.exonic_variant_function | sed -n '1p')

clinsig_position_1=$(cut -d'	' -f4 annovar.human.hg19_clinvar_20150330_dropped | sed -n '1p')
clinsig_position_2=$(cut -d'	' -f4 annovar.human.hg19_clinvar_20150330_dropped | sed -n '2p')
clinsig_position_3=$(cut -d'	' -f4 annovar.human.hg19_clinvar_20150330_dropped | sed -n '3p')
clinsig_position_4=$(cut -d'	' -f4 annovar.human.hg19_clinvar_20150330_dropped | sed -n '4p')
clinsig_position_5=$(cut -d'	' -f4 annovar.human.hg19_clinvar_20150330_dropped | sed -n '5p')

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# For extracting GENE NAME from annovar.human.refGene.variant_function file.

if [[ $clinsig == 1 ]]
	then
	 cat annovar.human.refGene.variant_function | grep "$clinsig_position_1" | cut -d'	' -f2 > gene_name_1.txt
	gene_name_1=$(cat gene_name_1.txt)

elif [[ $clinsig == 2 ]]
	then
	cat annovar.human.refGene.variant_function | grep $clinsig_position_1 | cut -d'	' -f2 > gene_name_1.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_2 | cut -d'	' -f2 > gene_name_2.txt
	gene_name_1=$(cat gene_name_1.txt)
	gene_name_2=$(cat gene_name_2.txt)

elif [[ $clinsig == 3 ]]
	then
	cat annovar.human.refGene.variant_function | grep $clinsig_position_1 | cut -d'	' -f2 > gene_name_1.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_2 | cut -d'	' -f2 > gene_name_2.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_3 | cut -d'	' -f2 > gene_name_3.txt
	gene_name_1=$(cat gene_name_1.txt)
	gene_name_2=$(cat gene_name_2.txt)
	gene_name_3=$(cat gene_name_3.txt)

elif [[ $clinsig == 4 ]]
	then
	cat annovar.human.refGene.variant_function | grep $clinsig_position_1 | cut -d'	' -f2 > gene_name_1.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_2 | cut -d'	' -f2 > gene_name_2.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_3 | cut -d'	' -f2 > gene_name_3.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_4 | cut -d'	' -f2 > gene_name_4.txt
	gene_name_1=$(cat gene_name_1.txt)
	gene_name_2=$(cat gene_name_2.txt)
	gene_name_3=$(cat gene_name_3.txt)
	gene_name_4=$(cat gene_name_4.txt)

elif [[ $clinsig == 5 ]]
	then
	cat annovar.human.refGene.variant_function | grep $clinsig_position_1 | cut -d'	' -f2 > gene_name_1.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_2 | cut -d'	' -f2 > gene_name_2.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_3 | cut -d'	' -f2 > gene_name_3.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_4 | cut -d'	' -f2 > gene_name_4.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_5 | cut -d'	' -f2 > gene_name_5.txt
	gene_name_1=$(cat gene_name_1.txt)
	gene_name_2=$(cat gene_name_2.txt)
	gene_name_3=$(cat gene_name_3.txt)
	gene_name_4=$(cat gene_name_4.txt)
	gene_name_5=$(cat gene_name_5.txt)

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# For extracting VARIANT LOCATION from annovar.human.refGene.variant_function file.

if [[ $clinsig == 1 ]]
	then
	 cat annovar.human.refGene.variant_function | grep "$clinsig_position_1" | cut -d'	' -f1 > variant_location_1.txt
	variant_location_1=$(cat variant_location_1.txt)

elif [[ $clinsig == 2 ]]
	then
	cat annovar.human.refGene.variant_function | grep $clinsig_position_1 | cut -d'	' -f1 > variant_location_1.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_2 | cut -d'	' -f1 > variant_location_2.txt
	variant_location_1=$(cat variant_location_1.txt)
	variant_location_2=$(cat variant_location_2.txt)

elif [[ $clinsig == 3 ]]
	then
	cat annovar.human.refGene.variant_function | grep $clinsig_position_1 | cut -d'	' -f1 > variant_location_1.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_2 | cut -d'	' -f1 > variant_location_2.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_3 | cut -d'	' -f1 > variant_location_3.txt
	variant_location_1=$(cat variant_location_1.txt)
	variant_location_2=$(cat variant_location_2.txt)
	variant_location_3=$(cat variant_location_3.txt)

elif [[ $clinsig == 4 ]]
	then
	cat annovar.human.refGene.variant_function | grep $clinsig_position_1 | cut -d'	' -f1 > variant_location_1.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_2 | cut -d'	' -f1 > variant_location_2.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_3 | cut -d'	' -f1 > variant_location_3.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_4 | cut -d'	' -f1 > variant_location_4.txt
	variant_location_1=$(cat variant_location_1.txt)
	variant_location_2=$(cat variant_location_2.txt)
	variant_location_3=$(cat variant_location_3.txt)
	variant_location_4=$(cat variant_location_4.txt)

elif [[ $clinsig == 5 ]]
	then
	cat annovar.human.refGene.variant_function | grep $clinsig_position_1 | cut -d'	' -f1 > variant_location_1.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_2 | cut -d'	' -f1 > variant_location_2.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_3 | cut -d'	' -f1 > variant_location_3.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_4 | cut -d'	' -f1 > variant_location_4.txt
	cat annovar.human.refGene.variant_function | grep $clinsig_position_5 | cut -d'	' -f1 > variant_location_5.txt
	variant_location_1=$(cat variant_location_1.txt)
	variant_location_2=$(cat variant_location_2.txt)
	variant_location_3=$(cat variant_location_3.txt)
	variant_location_4=$(cat variant_location_4.txt)
	variant_location_5=$(cat variant_location_5.txt)

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# To get VARIANT TYPE from annovar.human.refGene.exonic_variant_function file.

if [[ $clinsig == 1 ]]
	then
	 cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f2 > variant_type_1.txt
	variant_type_1=$(cat variant_type_1.txt)

elif [[ $clinsig == 2 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f2 > variant_type_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f2 > variant_type_2.txt
	variant_type_1=$(cat variant_type_1.txt)
	variant_type_2=$(cat variant_type_2.txt)

elif [[ $clinsig == 3 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f2 > variant_type_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f2 > variant_type_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f2 > variant_type_3.txt
	variant_type_1=$(cat variant_type_1.txt)
	variant_type_2=$(cat variant_type_2.txt)
	variant_type_3=$(cat variant_type_3.txt)

elif [[ $clinsig == 4 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f2 > variant_type_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f2 > variant_type_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f2 > variant_type_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_4 | cut -d'	' -f2 > variant_type_4.txt
	variant_type_1=$(cat variant_type_1.txt)
	variant_type_2=$(cat variant_type_2.txt)
	variant_type_3=$(cat variant_type_3.txt)
	variant_type_4=$(cat variant_type_4.txt)

elif [[ $clinsig == 5 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f2 > variant_type_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f2 > variant_type_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f2 > variant_type_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_4 | cut -d'	' -f2 > variant_type_4.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_5 | cut -d'	' -f2 > variant_type_5.txt
	variant_type_1=$(cat variant_type_1.txt)
	variant_type_2=$(cat variant_type_2.txt)
	variant_type_3=$(cat variant_type_3.txt)
	variant_type_4=$(cat variant_type_4.txt)
	variant_type_5=$(cat variant_type_5.txt)

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# To get dbSNP Identifier from annovar.human.hg19_avsnp142_dropped file.

if [[ $clinsig == 1 ]]
	then
	 cat annovar.human.hg19_avsnp142_dropped | grep "$clinsig_position_1" | cut -d'	' -f2 > rsID_1.txt
	rsID_1=$(cat rsID_1.txt)

elif [[ $clinsig == 2 ]]
	then
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_1 | cut -d'	' -f2 > rsID_1.txt
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_2 | cut -d'	' -f2 > rsID_2.txt
	rsID_1=$(cat rsID_1.txt)
	rsID_2=$(cat rsID_2.txt)

elif [[ $clinsig == 3 ]]
	then
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_1 | cut -d'	' -f2 > rsID_1.txt
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_2 | cut -d'	' -f2 > rsID_2.txt
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_3 | cut -d'	' -f2 > rsID_3.txt
	rsID_1=$(cat rsID_1.txt)
	rsID_2=$(cat rsID_2.txt)
	rsID_3=$(cat rsID_3.txt)

elif [[ $clinsig == 4 ]]
	then
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_1 | cut -d'	' -f2 > rsID_1.txt
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_2 | cut -d'	' -f2 > rsID_2.txt
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_3 | cut -d'	' -f2 > rsID_3.txt
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_4 | cut -d'	' -f2 > rsID_4.txt
	rsID_1=$(cat rsID_1.txt)
	rsID_2=$(cat rsID_2.txt)
	rsID_3=$(cat rsID_3.txt)
	rsID_4=$(cat rsID_4.txt)

elif [[ $clinsig == 5 ]]
	then
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_1 | cut -d'	' -f2 > rsID_1.txt
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_2 | cut -d'	' -f2 > rsID_2.txt
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_3 | cut -d'	' -f2 > rsID_3.txt
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_4 | cut -d'	' -f2 > rsID_4.txt
	cat annovar.human.hg19_avsnp142_dropped | grep $clinsig_position_5 | cut -d'	' -f2 > rsID_5.txt
	rsID_1=$(cat rsID_1.txt)
	rsID_2=$(cat rsID_2.txt)
	rsID_3=$(cat rsID_3.txt)
	rsID_4=$(cat rsID_4.txt)
	rsID_5=$(cat rsID_5.txt)

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#To get the MAF score from annovar.human.hg19_popfreq_all_20150413_dropped file for the clinically significant variants.

if [[ $clinsig == 1 ]]
	then
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f2 > maf_1.txt
	maf_1=$(cat maf_1.txt)

elif [[ $clinsig == 2 ]]
	then
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f2 > maf_1.txt
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f2 > maf_2.txt
	maf_1=$(cat maf_1.txt)
	maf_2=$(cat maf_2.txt)

elif [[ $clinsig == 3 ]]
	then
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f2 > maf_1.txt
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f2 > maf_2.txt
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f2 > maf_3.txt
	maf_1=$(cat maf_1.txt)
	maf_2=$(cat maf_2.txt)
	maf_3=$(cat maf_3.txt)

elif [[ $clinsig == 4 ]]
	then
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f2 > maf_1.txt
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f2 > maf_2.txt
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f2 > maf_3.txt
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_4"| cut -d'	' -f2 | cut -d',' -f2 > maf_4.txt
	maf_1=$(cat maf_1.txt)
	maf_2=$(cat maf_2.txt)
	maf_3=$(cat maf_3.txt)
	maf_4=$(cat maf_4.txt)		

elif [[ $clinsig == 5 ]]
	then
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f2 > maf_1.txt
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f2 > maf_2.txt
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f2 > maf_3.txt
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_4"| cut -d'	' -f2 | cut -d',' -f2 > maf_4.txt
	cat annovar.human.hg19_popfreq_all_20150413_dropped |grep "$clinsig_position_5"| cut -d'	' -f2 | cut -d',' -f2 > maf_5.txt
	maf_1=$(cat maf_1.txt)
	maf_2=$(cat maf_2.txt)
	maf_3=$(cat maf_3.txt)
	maf_4=$(cat maf_4.txt)
	maf_5=$(cat maf_5.txt)

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#To get the SIFT score from annovar.human.hg19_ljb26_all_dropped file for the clinically significant variants.

if [[ $clinsig == 1 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_1.txt
	sift_score_1=$(cat sift_score_1.txt)

elif [[ $clinsig == 2 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_2.txt
	sift_score_1=$(cat sift_score_1.txt)
	sift_score_2=$(cat sift_score_2.txt)

elif [[ $clinsig == 3 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_2.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_3.txt
	sift_score_1=$(cat sift_score_1.txt)
	sift_score_2=$(cat sift_score_2.txt)
	sift_score_3=$(cat sift_score_3.txt)

elif [[ $clinsig == 4 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_2.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_3.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_4"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_4.txt
	sift_score_1=$(cat sift_score_1.txt)
	sift_score_2=$(cat sift_score_2.txt)
	sift_score_3=$(cat sift_score_3.txt)
	sift_score_4=$(cat sift_score_4.txt)		

elif [[ $clinsig == 5 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_2.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_3.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_4"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_4.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_5"| cut -d'	' -f2 | cut -d',' -f1 > sift_score_5.txt
	sift_score_1=$(cat sift_score_1.txt)
	sift_score_2=$(cat sift_score_2.txt)
	sift_score_3=$(cat sift_score_3.txt)
	sift_score_4=$(cat sift_score_4.txt)
	sift_score_5=$(cat sift_score_5.txt)

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#To get the SIFT predication from annovar.human.hg19_ljb26_all_dropped file for the clinically significant variants.

if [[ $clinsig == 1 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_1.txt
	sift_pred_1=$(cat sift_pred_1.txt)
	sift_pred_1=$(
	if [[ $sift_pred_1 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_1.txt
	elif [[ $sift_pred_1 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_1.txt
	fi)

	#sift_final_pred_1=$(if [[ $sift_pred_1 == "T" ]]; then sed 's/T/Tolerated/g' sift_pred_1.txt; fi)

elif [[ $clinsig == 2 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_2.txt
	sift_pred_1=$(cat sift_pred_1.txt)
	sift_pred_1=$(
	if [[ $sift_pred_1 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_1.txt
	elif [[ $sift_pred_1 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_1.txt
	fi)

	sift_pred_2=$(cat sift_pred_2.txt)
	sift_pred_2=$(
	if [[ $sift_pred_2 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_2.txt
	elif [[ $sift_pred_2 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_2.txt
	fi)

elif [[ $clinsig == 3 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_2.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_3.txt
	sift_pred_1=$(cat sift_pred_1.txt)
	sift_pred_1=$(
	if [[ $sift_pred_1 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_1.txt
	elif [[ $sift_pred_1 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_1.txt
	fi)

	sift_pred_2=$(cat sift_pred_2.txt)
	sift_pred_2=$(
	if [[ $sift_pred_2 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_2.txt
	elif [[ $sift_pred_2 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_2.txt
	fi)

	sift_pred_3=$(cat sift_pred_3.txt)
	sift_pred_3=$(
	if [[ $sift_pred_3 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_3.txt
	elif [[ $sift_pred_3 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_3.txt
	fi)

elif [[ $clinsig == 4 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_2.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_3.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_4"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_4.txt
	sift_pred_1=$(cat sift_pred_1.txt)
	sift_pred_1=$(
	if [[ $sift_pred_1 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_1.txt
	elif [[ $sift_pred_1 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_1.txt
	fi)

	sift_pred_2=$(cat sift_pred_2.txt)
	sift_pred_2=$(
	if [[ $sift_pred_2 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_2.txt
	elif [[ $sift_pred_2 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_2.txt
	fi)

	sift_pred_3=$(cat sift_pred_3.txt)
	sift_pred_3=$(
	if [[ $sift_pred_3 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_3.txt
	elif [[ $sift_pred_3 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_3.txt
	fi)

	sift_pred_4=$(cat sift_pred_4.txt)
	sift_pred_4=$(
	if [[ $sift_pred_4 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_4.txt
	elif [[ $sift_pred_4 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_4.txt
	fi)

elif [[ $clinsig == 5 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_2.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_3.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_4"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_4.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_5"| cut -d'	' -f2 | cut -d',' -f2 > sift_pred_5.txt
	sift_pred_1=$(cat sift_pred_1.txt)
	sift_pred_1=$(
	if [[ $sift_pred_1 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_1.txt
	elif [[ $sift_pred_1 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_1.txt
	fi)

	sift_pred_2=$(cat sift_pred_2.txt)
	sift_pred_2=$(
	if [[ $sift_pred_2 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_2.txt
	elif [[ $sift_pred_2 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_2.txt
	fi)

	sift_pred_3=$(cat sift_pred_3.txt)
	sift_pred_3=$(
	if [[ $sift_pred_3 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_3.txt
	elif [[ $sift_pred_3 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_3.txt
	fi)

	sift_pred_4=$(cat sift_pred_4.txt)
	sift_pred_4=$(
	if [[ $sift_pred_4 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_4.txt
	elif [[ $sift_pred_4 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_4.txt
	fi)

	sift_pred_5=$(cat sift_pred_5.txt)
	sift_pred_5=$(
	if [[ $sift_pred_5 == "T" ]]
	then
	sed 's/T/Tolerated/g' sift_pred_5.txt
	elif [[ $sift_pred_5 == "D" ]]
	then
	sed 's/D/Deleterious/g' sift_pred_5.txt
	fi)

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#To get the Polyphen prediction from annovar.human.hg19_ljb26_all_dropped file for the clinically significant variants.

if [[ $clinsig == 1 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_1.txt
	polyphen_pred_1=$(cat polyphen_pred_1.txt)
	polyphen_pred_1=$(
	if [[ $polyphen_pred_1 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_1.txt
	elif [[ $polyphen_pred_1 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_1.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

elif [[ $clinsig == 2 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_2.txt
	polyphen_pred_1=$(cat polyphen_pred_1.txt)
	polyphen_pred_1=$(
	if [[ $polyphen_pred_1 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_1.txt
	elif [[ $polyphen_pred_1 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_1.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

	polyphen_pred_2=$(cat polyphen_pred_2.txt)
	polyphen_pred_2=$(
	if [[ $polyphen_pred_2 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_2.txt
	elif [[ $polyphen_pred_2 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_2.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

elif [[ $clinsig == 3 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_2.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_3.txt
	polyphen_pred_1=$(cat polyphen_pred_1.txt)
	polyphen_pred_1=$(
	if [[ $polyphen_pred_1 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_1.txt
	elif [[ $polyphen_pred_1 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_1.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

	polyphen_pred_2=$(cat polyphen_pred_2.txt)
	polyphen_pred_2=$(
	if [[ $polyphen_pred_2 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_2.txt
	elif [[ $polyphen_pred_2 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_2.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

	polyphen_pred_3=$(cat polyphen_pred_3.txt)
	polyphen_pred_3=$(
	if [[ $polyphen_pred_3 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_3.txt
	elif [[ $polyphen_pred_3 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_3.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

elif [[ $clinsig == 4 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_2.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_3.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_4"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_4.txt
	polyphen_pred_1=$(cat polyphen_pred_1.txt)
	polyphen_pred_1=$(
	if [[ $polyphen_pred_1 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_1.txt
	elif [[ $polyphen_pred_1 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_1.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

	polyphen_pred_2=$(cat polyphen_pred_2.txt)
	polyphen_pred_2=$(
	if [[ $polyphen_pred_2 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_2.txt
	elif [[ $polyphen_pred_2 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_2.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

	polyphen_pred_3=$(cat polyphen_pred_3.txt)
	polyphen_pred_3=$(
	if [[ $polyphen_pred_3 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_3.txt
	elif [[ $polyphen_pred_3 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_3.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

	polyphen_pred_4=$(cat polyphen_pred_4.txt)
	polyphen_pred_4=$(
	if [[ $polyphen_pred_4 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_4.txt
	elif [[ $polyphen_pred_4 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_4.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)		

elif [[ $clinsig == 5 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_2.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_3.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_4"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_4.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_5"| cut -d'	' -f2 | cut -d',' -f6 > polyphen_pred_5.txt
	polyphen_pred_1=$(cat polyphen_pred_1.txt)
	polyphen_pred_1=$(
	if [[ $polyphen_pred_1 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_1.txt
	elif [[ $polyphen_pred_1 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_1.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

	polyphen_pred_2=$(cat polyphen_pred_2.txt)
	polyphen_pred_2=$(
	if [[ $polyphen_pred_2 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_2.txt
	elif [[ $polyphen_pred_2 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_2.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

	polyphen_pred_3=$(cat polyphen_pred_3.txt)
	polyphen_pred_3=$(
	if [[ $polyphen_pred_3 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_3.txt
	elif [[ $polyphen_pred_3 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_3.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

	polyphen_pred_4=$(cat polyphen_pred_4.txt)
	polyphen_pred_4=$(
	if [[ $polyphen_pred_4 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_4.txt
	elif [[ $polyphen_pred_4 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_4.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

	polyphen_pred_5=$(cat polyphen_pred_5.txt)
	polyphen_pred_5=$(
	if [[ $polyphen_pred_5 == "P" ]]
	then
	sed 's/P/Possibly damaging/g' polyphen_pred_5.txt
	elif [[ $polyphen_pred_5 == "D" ]]
	then
	sed 's/D/Probably damaging/g' polyphen_pred_5.txt
	elif [[ $polyphen_pred_1 == "B" ]]
	then
	sed 's/B/Benign/g' polyphen_pred_1.txt
	fi)

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#To get the Polyphen score from annovar.human.hg19_ljb26_all_dropped file for the clinically significant variants.

if [[ $clinsig == 1 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_1.txt
	polyphen_score_1=$(cat polyphen_score_1.txt)

elif [[ $clinsig == 2 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_2.txt
	polyphen_score_1=$(cat polyphen_score_1.txt)
	polyphen_score_2=$(cat polyphen_score_2.txt)

elif [[ $clinsig == 3 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_2.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_3.txt
	polyphen_score_1=$(cat polyphen_score_1.txt)
	polyphen_score_2=$(cat polyphen_score_2.txt)
	polyphen_score_3=$(cat polyphen_score_3.txt)

elif [[ $clinsig == 4 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_2.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_3.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_4"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_4.txt
	polyphen_score_1=$(cat polyphen_score_1.txt)
	polyphen_score_2=$(cat polyphen_score_2.txt)
	polyphen_score_3=$(cat polyphen_score_3.txt)
	polyphen_score_4=$(cat polyphen_score_4.txt)		

elif [[ $clinsig == 5 ]]
	then
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_1"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_1.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_2"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_2.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_3"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_3.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_4"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_4.txt
	cat annovar.human.hg19_ljb26_all_dropped |grep "$clinsig_position_5"| cut -d'	' -f2 | cut -d',' -f5 > polyphen_score_5.txt
	polyphen_score_1=$(cat polyphen_score_1.txt)
	polyphen_score_2=$(cat polyphen_score_2.txt)
	polyphen_score_3=$(cat polyphen_score_3.txt)
	polyphen_score_4=$(cat polyphen_score_4.txt)
	polyphen_score_5=$(cat polyphen_score_5.txt)

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#For extracting complementary variant co-ordinate

if [[ $clinsig == 1 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_1.txt
	comp_variant_firstT_1=$(cat comp_variant_firstT_1.txt)

	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_1.txt
	comp_variant_secondT_1=$(cat comp_variant_secondT_1.txt)

elif [[ $clinsig == 2 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_2" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_2.txt
	comp_variant_firstT_1=$(cat comp_variant_firstT_1.txt)
	comp_variant_firstT_2=$(cat comp_variant_firstT_2.txt)

	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_2" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_2.txt
	comp_variant_secondT_1=$(cat comp_variant_secondT_1.txt)
	comp_variant_secondT_2=$(cat comp_variant_secondT_2.txt)

elif [[ $clinsig == 3 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_2" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_3" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_3.txt
	comp_variant_firstT_1=$(cat comp_variant_firstT_1.txt)
	comp_variant_firstT_2=$(cat comp_variant_firstT_2.txt)
	comp_variant_firstT_3=$(cat comp_variant_firstT_3.txt)

	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_2" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_3" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_3.txt
	comp_variant_secondT_1=$(cat comp_variant_secondT_1.txt)
	comp_variant_secondT_2=$(cat comp_variant_secondT_2.txt)
	comp_variant_secondT_3=$(cat comp_variant_secondT_3.txt)

elif [[ $clinsig == 4 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_2" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_3" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_4" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_4.txt
	comp_variant_firstT_1=$(cat comp_variant_firstT_1.txt)
	comp_variant_firstT_2=$(cat comp_variant_firstT_2.txt)
	comp_variant_firstT_3=$(cat comp_variant_firstT_3.txt)
	comp_variant_firstT_4=$(cat comp_variant_firstT_4.txt)

	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_2" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_3" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_4" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_4.txt
	comp_variant_secondT_1=$(cat comp_variant_secondT_1.txt)
	comp_variant_secondT_2=$(cat comp_variant_secondT_2.txt)
	comp_variant_secondT_3=$(cat comp_variant_secondT_3.txt)
	comp_variant_secondT_4=$(cat comp_variant_secondT_4.txt)

elif [[ $clinsig == 5 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_2" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_3" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_4" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_4.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_5" | cut -d'	' -f3 | cut -d',' -f1 |cut -d':' -f4 > comp_variant_firstT_5.txt
	comp_variant_firstT_1=$(cat comp_variant_firstT_1.txt)
	comp_variant_firstT_2=$(cat comp_variant_firstT_2.txt)
	comp_variant_firstT_3=$(cat comp_variant_firstT_3.txt)
	comp_variant_firstT_4=$(cat comp_variant_firstT_4.txt)
	comp_variant_firstT_5=$(cat comp_variant_firstT_5.txt)

	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_2" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_3" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_4" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_4.txt
	cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_5" | cut -d'	' -f3 | cut -d',' -f2 |cut -d':' -f4 > comp_variant_secondT_5.txt
	comp_variant_secondT_1=$(cat comp_variant_secondT_1.txt)
	comp_variant_secondT_2=$(cat comp_variant_secondT_2.txt)
	comp_variant_secondT_3=$(cat comp_variant_secondT_3.txt)
	comp_variant_secondT_4=$(cat comp_variant_secondT_4.txt)
	comp_variant_secondT_5=$(cat comp_variant_secondT_5.txt)

fi
	
#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# For extracting transcript ID and AA change from annovar.human.refGene.exonic_variant_function file.

if [[ $clinsig == 1 ]]
	then
	 cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_1.txt
	 cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_1.txt

	 cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_1.txt
	 cat annovar.human.refGene.exonic_variant_function | grep "$clinsig_position_1" | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_1.txt

	transcript_id_firstT_1=$(cat transcript_id_firstT_1.txt)
	transcript_id_secondT_1=$(cat transcript_id_secondT_1.txt)
	
	aachange_firstT_1=$(cat aachange_firstT_1.txt)
	aachange_secondT_1=$(cat aachange_secondT_1.txt)

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
if [ ! -z $aachange_firstT_1 ]
	then 
	bash AA_expand_firstT_1.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_1 ]
	then 
	bash AA_expand_secondT_1.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_firstA_firstT_1.txt new/
	aachange_firstA_firstT_1=$(cat new/aachange_firstA_firstT_1.txt)
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_lastA_firstT_1.txt new/
	aachange_lastA_firstT_1=$(cat new/aachange_lastA_firstT_1.txt)
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_firstA_secondT_1.txt new/
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_lastA_secondT_1.txt new/
fi

if [ ! -z $transcript_id_firstT_1 ]
	then
	mv transcript_id_firstT_1.txt new/
fi

if [ ! -z $transcript_id_secondT_1 ]
	then
	mv transcript_id_secondT_1.txt new/
fi


if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_firstT_1.txt new/
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_secondT_1.txt new/
fi

fi

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

if [[ $clinsig == 2 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_2.txt

	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_2.txt

	transcript_id_firstT_1=$(cat transcript_id_firstT_1.txt)
	transcript_id_secondT_1=$(cat transcript_id_secondT_1.txt)
	transcript_id_firstT_2=$(cat transcript_id_firstT_2.txt)
	transcript_id_secondT_2=$(cat transcript_id_secondT_2.txt)
	
	aachange_firstT_1=$(cat aachange_firstT_1.txt)
	aachange_secondT_1=$(cat aachange_secondT_1.txt)
	aachange_firstT_2=$(cat aachange_firstT_2.txt)
	aachange_secondT_2=$(cat aachange_secondT_2.txt)

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_1 ]
	then 
	bash AA_expand_firstT_1.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_1 ]
	then 
	bash AA_expand_secondT_1.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_firstA_firstT_1.txt new/
	aachange_firstA_firstT_1=$(cat new/aachange_firstA_firstT_1.txt)
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_lastA_firstT_1.txt new/
	aachange_lastA_firstT_1=$(cat new/aachange_lastA_firstT_1.txt)
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_firstA_secondT_1.txt new/
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_lastA_secondT_1.txt new/
fi

if [ ! -z $transcript_id_firstT_1 ]
	then
	mv transcript_id_firstT_1.txt new/
fi

if [ ! -z $transcript_id_secondT_1 ]
	then
	mv transcript_id_secondT_1.txt new/
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_firstT_1.txt new/
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_secondT_1.txt new/
fi

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_2 ]
	then 
	bash AA_expand_firstT_2.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_2 ]
	then 
	bash AA_expand_secondT_2.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_2 ]
	then
	mv aachange_firstA_firstT_2.txt new/
fi

if [ ! -z $aachange_firstT_2 ]
	then
	mv aachange_lastA_firstT_2.txt new/
fi

if [ ! -z $aachange_secondT_2 ]
	then
	mv aachange_firstA_secondT_2.txt new/
fi

if [ ! -z $aachange_secondT_2 ]
	then
	mv aachange_lastA_secondT_2.txt new/
fi

if [ ! -z $transcript_id_firstT_2 ]
	then
	mv transcript_id_firstT_2.txt new/
fi

if [ ! -z $transcript_id_secondT_2 ]
	then
	mv transcript_id_secondT_2.txt new/
fi


if [ ! -z $aachange_firstT_2 ]
	then
	mv aachange_firstT_2.txt new/
fi

if [ ! -z $aachange_secondT_2 ]
	then
	mv aachange_secondT_2.txt new/
fi

fi

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

if [[ $clinsig == 3 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_3.txt

	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_3.txt

	transcript_id_firstT_1=$(cat transcript_id_firstT_1.txt)
	transcript_id_secondT_1=$(cat transcript_id_secondT_1.txt)
	transcript_id_firstT_2=$(cat transcript_id_firstT_2.txt)
	transcript_id_secondT_2=$(cat transcript_id_secondT_2.txt)
	transcript_id_firstT_3=$(cat transcript_id_firstT_3.txt)
	transcript_id_secondT_3=$(cat transcript_id_secondT_3.txt)
	
	aachange_firstT_1=$(cat aachange_firstT_1.txt)
	aachange_secondT_1=$(cat aachange_secondT_1.txt)
	aachange_firstT_2=$(cat aachange_firstT_2.txt)
	aachange_secondT_2=$(cat aachange_secondT_2.txt)
	aachange_firstT_3=$(cat aachange_firstT_3.txt)
	aachange_secondT_3=$(cat aachange_secondT_3.txt)

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_1 ]
	then 
	bash AA_expand_firstT_1.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_1 ]
	then 
	bash AA_expand_secondT_1.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_firstA_firstT_1.txt new/
	aachange_firstA_firstT_1=$(cat new/aachange_firstA_firstT_1.txt)
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_lastA_firstT_1.txt new/
	aachange_lastA_firstT_1=$(cat new/aachange_lastA_firstT_1.txt)
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_firstA_secondT_1.txt new/
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_lastA_secondT_1.txt new/
fi

if [ ! -z $transcript_id_firstT_1 ]
	then
	mv transcript_id_firstT_1.txt new/
fi

if [ ! -z $transcript_id_secondT_1 ]
	then
	mv transcript_id_secondT_1.txt new/
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_firstT_1.txt new/
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_secondT_1.txt new/
fi

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_2 ]
	then 
	bash AA_expand_firstT_2.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_2 ]
	then 
	bash AA_expand_secondT_2.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_2 ]
	then
	mv aachange_firstA_firstT_2.txt new/
fi

if [ ! -z $aachange_firstT_2 ]
	then
	mv aachange_lastA_firstT_2.txt new/
fi

if [ ! -z $aachange_secondT_2 ]
	then
	mv aachange_firstA_secondT_2.txt new/
fi

if [ ! -z $aachange_secondT_2 ]
	then
	mv aachange_lastA_secondT_2.txt new/
fi

if [ ! -z $transcript_id_firstT_2 ]
	then
	mv transcript_id_firstT_2.txt new/
fi

if [ ! -z $transcript_id_secondT_2 ]
	then
	mv transcript_id_secondT_2.txt new/
fi


if [ ! -z $aachange_firstT_2 ]
	then
	mv aachange_firstT_2.txt new/
fi

if [ ! -z $aachange_secondT_2 ]
	then
	mv aachange_secondT_2.txt new/
fi

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_3 ]
	then 
	bash AA_expand_firstT_3.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_3 ]
	then 
	bash AA_expand_secondT_3.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_3 ]
	then
	mv aachange_firstA_firstT_3.txt new/
fi

if [ ! -z $aachange_firstT_3 ]
	then
	mv aachange_lastA_firstT_3.txt new/
fi

if [ ! -z $aachange_secondT_3 ]
	then
	mv aachange_firstA_secondT_3.txt new/
fi

if [ ! -z $aachange_secondT_3 ]
	then
	mv aachange_lastA_secondT_3.txt new/
fi

if [ ! -z $transcript_id_firstT_3 ]
	then
	mv transcript_id_firstT_3.txt new/
fi

if [ ! -z $transcript_id_secondT_3 ]
	then
	mv transcript_id_secondT_3.txt new/
fi

if [ ! -z $aachange_firstT_3 ]
	then
	mv aachange_firstT_3.txt new/
fi

if [ ! -z $aachange_secondT_3 ]
	then
	mv aachange_secondT_3.txt new/
fi

fi

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

if [[ $clinsig == 4 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_4 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_4.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_4 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_4.txt

	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_4 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_4.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_4 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_4.txt

	transcript_id_firstT_1=$(cat transcript_id_firstT_1.txt)
	transcript_id_secondT_1=$(cat transcript_id_secondT_1.txt)
	transcript_id_firstT_2=$(cat transcript_id_firstT_2.txt)
	transcript_id_secondT_2=$(cat transcript_id_secondT_2.txt)
	transcript_id_firstT_3=$(cat transcript_id_firstT_3.txt)
	transcript_id_secondT_3=$(cat transcript_id_secondT_3.txt)
	transcript_id_firstT_4=$(cat transcript_id_firstT_4.txt)
	transcript_id_secondT_4=$(cat transcript_id_secondT_4.txt)
	
	aachange_firstT_1=$(cat aachange_firstT_1.txt)
	aachange_secondT_1=$(cat aachange_secondT_1.txt)
	aachange_firstT_2=$(cat aachange_firstT_2.txt)
	aachange_secondT_2=$(cat aachange_secondT_2.txt)
	aachange_firstT_3=$(cat aachange_firstT_3.txt)
	aachange_secondT_3=$(cat aachange_secondT_3.txt)
	aachange_firstT_4=$(cat aachange_firstT_4.txt)
	aachange_secondT_4=$(cat aachange_secondT_4.txt)

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_1 ]
	then 
	bash AA_expand_firstT_1.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_1 ]
	then 
	bash AA_expand_secondT_1.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_firstA_firstT_1.txt new/
	aachange_firstA_firstT_1=$(cat new/aachange_firstA_firstT_1.txt)
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_lastA_firstT_1.txt new/
	aachange_lastA_firstT_1=$(cat new/aachange_lastA_firstT_1.txt)
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_firstA_secondT_1.txt new/
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_lastA_secondT_1.txt new/
fi

if [ ! -z $transcript_id_firstT_1 ]
	then
	mv transcript_id_firstT_1.txt new/
fi

if [ ! -z $transcript_id_secondT_1 ]
	then
	mv transcript_id_secondT_1.txt new/
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_firstT_1.txt new/
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_secondT_1.txt new/
fi

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_2 ]
	then 
	bash AA_expand_firstT_2.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_2 ]
	then 
	bash AA_expand_secondT_2.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_2 ]
	then
	mv aachange_firstA_firstT_2.txt new/
fi

if [ ! -z $aachange_firstT_2 ]
	then
	mv aachange_lastA_firstT_2.txt new/
fi

if [ ! -z $aachange_secondT_2 ]
	then
	mv aachange_firstA_secondT_2.txt new/
fi

if [ ! -z $aachange_secondT_2 ]
	then
	mv aachange_lastA_secondT_2.txt new/
fi

if [ ! -z $transcript_id_firstT_2 ]
	then
	mv transcript_id_firstT_2.txt new/
fi

if [ ! -z $transcript_id_secondT_2 ]
	then
	mv transcript_id_secondT_2.txt new/
fi


if [ ! -z $aachange_firstT_2 ]
	then
	mv aachange_firstT_2.txt new/
fi

if [ ! -z $aachange_secondT_2 ]
	then
	mv aachange_secondT_2.txt new/
fi

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_3 ]
	then 
	bash AA_expand_firstT_3.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_3 ]
	then 
	bash AA_expand_secondT_3.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_3 ]
	then
	mv aachange_firstA_firstT_3.txt new/
fi

if [ ! -z $aachange_firstT_3 ]
	then
	mv aachange_lastA_firstT_3.txt new/
fi

if [ ! -z $aachange_secondT_3 ]
	then
	mv aachange_firstA_secondT_3.txt new/
fi

if [ ! -z $aachange_secondT_3 ]
	then
	mv aachange_lastA_secondT_3.txt new/
fi

if [ ! -z $transcript_id_firstT_3 ]
	then
	mv transcript_id_firstT_3.txt new/
fi

if [ ! -z $transcript_id_secondT_3 ]
	then
	mv transcript_id_secondT_3.txt new/
fi


if [ ! -z $aachange_firstT_3 ]
	then
	mv aachange_firstT_3.txt new/
fi

if [ ! -z $aachange_secondT_3 ]
	then
	mv aachange_secondT_3.txt new/
fi

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_4 ]
	then 
	bash AA_expand_firstT_4.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_4 ]
	then 
	bash AA_expand_secondT_4.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_4 ]
	then
	mv aachange_firstA_firstT_4.txt new/
fi

if [ ! -z $aachange_firstT_4 ]
	then
	mv aachange_lastA_firstT_4.txt new/
fi

if [ ! -z $aachange_secondT_4 ]
	then
	mv aachange_firstA_secondT_4.txt new/
fi

if [ ! -z $aachange_secondT_4 ]
	then
	mv aachange_lastA_secondT_4.txt new/
fi

if [ ! -z $transcript_id_firstT_4 ]
	then
	mv transcript_id_firstT_4.txt new/
fi

if [ ! -z $transcript_id_secondT_4 ]
	then
	mv transcript_id_secondT_4.txt new/
fi


if [ ! -z $aachange_firstT_4 ]
	then
	mv aachange_firstT_4.txt new/
fi

if [ ! -z $aachange_secondT_4 ]
	then
	mv aachange_secondT_4.txt new/
fi

fi
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

if [[ $clinsig == 5 ]]
	then
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_4 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_4.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_4 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_4.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_5 | cut -d'	' -f3 | cut -d':' -f 2  > transcript_id_firstT_5.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_5 | cut -d'	' -f3 | cut -d':' -f 6  > transcript_id_secondT_5.txt

	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_1 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_1.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_2 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_2.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_3 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_3.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_4 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_4.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_4 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_4.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_5 | cut -d'	' -f3 |cut -d':' -f5 | cut -d',' -f1  > aachange_firstT_5.txt
	cat annovar.human.refGene.exonic_variant_function | grep $clinsig_position_5 | cut -d'	' -f3 |cut -d':' -f9 | cut -d',' -f1  > aachange_secondT_5.txt

	transcript_id_firstT_1=$(cat transcript_id_firstT_1.txt)
	transcript_id_secondT_1=$(cat transcript_id_secondT_1.txt)
	transcript_id_firstT_2=$(cat transcript_id_firstT_2.txt)
	transcript_id_secondT_2=$(cat transcript_id_secondT_2.txt)
	transcript_id_firstT_3=$(cat transcript_id_firstT_3.txt)
	transcript_id_secondT_3=$(cat transcript_id_secondT_3.txt)
	transcript_id_firstT_4=$(cat transcript_id_firstT_4.txt)
	transcript_id_secondT_4=$(cat transcript_id_secondT_4.txt)
	transcript_id_firstT_5=$(cat transcript_id_firstT_5.txt)
	transcript_id_secondT_5=$(cat transcript_id_secondT_5.txt)
	
	aachange_firstT_1=$(cat aachange_firstT_1.txt)
	aachange_secondT_1=$(cat aachange_secondT_1.txt)
	aachange_firstT_2=$(cat aachange_firstT_2.txt)
	aachange_secondT_2=$(cat aachange_secondT_2.txt)
	aachange_firstT_3=$(cat aachange_firstT_3.txt)
	aachange_secondT_3=$(cat aachange_secondT_3.txt)
	aachange_firstT_4=$(cat aachange_firstT_4.txt)
	aachange_secondT_4=$(cat aachange_secondT_4.txt)
	aachange_firstT_5=$(cat aachange_firstT_5.txt)
	aachange_secondT_5=$(cat aachange_secondT_5.txt)
#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_1 ]
	then 
	bash AA_expand_firstT_1.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_1 ]
	then 
	bash AA_expand_secondT_1.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_firstA_firstT_1.txt new/
	aachange_firstA_firstT_1=$(cat new/aachange_firstA_firstT_1.txt)
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_lastA_firstT_1.txt new/
	aachange_lastA_firstT_1=$(cat new/aachange_lastA_firstT_1.txt)
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_firstA_secondT_1.txt new/
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_lastA_secondT_1.txt new/
fi

if [ ! -z $transcript_id_firstT_1 ]
	then
	mv transcript_id_firstT_1.txt new/
fi

if [ ! -z $transcript_id_secondT_1 ]
	then
	mv transcript_id_secondT_1.txt new/
fi

if [ ! -z $aachange_firstT_1 ]
	then
	mv aachange_firstT_1.txt new/
fi

if [ ! -z $aachange_secondT_1 ]
	then
	mv aachange_secondT_1.txt new/
fi

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_2 ]
	then 
	bash AA_expand_firstT_2.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_2 ]
	then 
	bash AA_expand_secondT_2.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_2 ]
	then
	mv aachange_firstA_firstT_2.txt new/
fi

if [ ! -z $aachange_firstT_2 ]
	then
	mv aachange_lastA_firstT_2.txt new/
fi

if [ ! -z $aachange_secondT_2 ]
	then
	mv aachange_firstA_secondT_2.txt new/
fi

if [ ! -z $aachange_secondT_2 ]
	then
	mv aachange_lastA_secondT_2.txt new/
fi

if [ ! -z $transcript_id_firstT_2 ]
	then
	mv transcript_id_firstT_2.txt new/
fi

if [ ! -z $transcript_id_secondT_2 ]
	then
	mv transcript_id_secondT_2.txt new/
fi


if [ ! -z $aachange_firstT_2 ]
	then
	mv aachange_firstT_2.txt new/
fi

if [ ! -z $aachange_secondT_2 ]
	then
	mv aachange_secondT_2.txt new/
fi

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_3 ]
	then 
	bash AA_expand_firstT_3.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_3 ]
	then 
	bash AA_expand_secondT_3.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_3 ]
	then
	mv aachange_firstA_firstT_3.txt new/
fi

if [ ! -z $aachange_firstT_3 ]
	then
	mv aachange_lastA_firstT_3.txt new/
fi

	if [ ! -z $aachange_secondT_3 ]
	then
	mv aachange_firstA_secondT_3.txt new/
fi

if [ ! -z $aachange_secondT_3 ]
	then
	mv aachange_lastA_secondT_3.txt new/
fi

if [ ! -z $transcript_id_firstT_3 ]
	then
	mv transcript_id_firstT_3.txt new/
fi

if [ ! -z $transcript_id_secondT_3 ]
	then
	mv transcript_id_secondT_3.txt new/
fi


if [ ! -z $aachange_firstT_3 ]
	then
	mv aachange_firstT_3.txt new/
fi

if [ ! -z $aachange_secondT_3 ]
	then
	mv aachange_secondT_3.txt new/
fi

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_4 ]
	then 
	bash AA_expand_firstT_4.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_4 ]
	then 
	bash AA_expand_secondT_4.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_4 ]
	then
	mv aachange_firstA_firstT_4.txt new/
fi

if [ ! -z $aachange_firstT_4 ]
	then
	mv aachange_lastA_firstT_4.txt new/
fi

if [ ! -z $aachange_secondT_4 ]
	then
	mv aachange_firstA_secondT_4.txt new/
fi

if [ ! -z $aachange_secondT_4 ]
	then
	mv aachange_lastA_secondT_4.txt new/
fi

if [ ! -z $transcript_id_firstT_4 ]
	then
	mv transcript_id_firstT_4.txt new/
fi

if [ ! -z $transcript_id_secondT_4 ]
	then
	mv transcript_id_secondT_4.txt new/
fi


if [ ! -z $aachange_firstT_4 ]
	then
	mv aachange_firstT_4.txt new/
fi

if [ ! -z $aachange_secondT_4 ]
	then
	mv aachange_secondT_4.txt new/
fi

#************************************************************************************************************************************************************************
if [ ! -z $aachange_firstT_5 ]
	then 
	bash AA_expand_firstT_5.sh
	else
	echo "There is no Amino Acid change in the first Transcript for this Variant."
fi

if [ ! -z $aachange_secondT_5 ]
	then 
	bash AA_expand_secondT_5.sh
	else
	echo "There is no Amino Acid change in the Second Transcript for this Variant."
fi

if [ ! -z $aachange_firstT_5 ]
	then
	mv aachange_firstA_firstT_5.txt new/
fi

if [ ! -z $aachange_firstT_5 ]
	then
	mv aachange_lastA_firstT_5.txt new/
fi

if [ ! -z $aachange_secondT_5 ]
	then
	mv aachange_firstA_secondT_5.txt new/
fi

if [ ! -z $aachange_secondT_5 ]
	then
	mv aachange_lastA_secondT_5.txt new/
fi

if [ ! -z $transcript_id_firstT_5 ]
	then
	mv transcript_id_firstT_5.txt new/
fi

if [ ! -z $transcript_id_secondT_5 ]
	then
	mv transcript_id_secondT_5.txt new/
fi

if [ ! -z $aachange_firstT_5 ]
	then
	mv aachange_firstT_5.txt new/
fi

if [ ! -z $aachange_secondT_5 ]
	then
	mv aachange_secondT_5.txt new/
fi

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# To get the observed and clinvar 1 line summary.

if [ $clinsig == 0 ]
	then
	echo "No clinically significant variants were observed for the diagnosed condition." > new/clinvar_observed.txt

elif [ $clinsig == 1 ]
	then
	echo "1 Clinically significant mutation has been identified for the diagnosed condition." > new/clinvar_observed.txt
	echo "
	<table border="1" >
	<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th bgcolor="LightGray" width=375 align="center">Gene Name</th>
		<th bgcolor="LightGray" width=375 align="center">Disease</th>
		<th bgcolor="LightGray" width=375 align="center">Location of the Variant</th>
		<th bgcolor="LightGray" width=375 align="center">Classification</th>
	</tr>
	<tr>
	<td align=center>1.</td>
	<td width=375 align="center">$gene_name_1</td>
	<td width=375 align="center">$clinvar_diseases_1_1</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_1_1 <br/>
$comp_variant_firstT_1 </td>
	<td width=375 align="center">$clinvar_classification_1_1</td>
	</tr>
	</table><br>&nbsp;<br>" > new/observed.html

elif [ $clinsig == 2 ]
	then
	echo "2 Clinically significant mutation has been identified for the diagnosed condition." > new/clinvar_observed.txt
	echo "
	<table border="1" >
	<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th bgcolor="LightGray" width=375 align="center">Gene Name</th>
		<th bgcolor="LightGray" width=375 align="center">Disease</th>
		<th bgcolor="LightGray" width=375 align="center">Location of the Variant</th>
		<th bgcolor="LightGray" width=375 align="center">Classification</th>
	</tr>
	<tr>
	<td align=center>1.</td>
	<td width=375 align="center">$gene_name_1</td>
	<td width=375 align="center">$clinvar_diseases_1_2</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_1_2 <br/>
$comp_variant_firstT_1 </td>
	<td width=375 align="center">$clinvar_classification_1_2</td>
	</tr>
	<tr>
	<td align=center>2.</td>
	<td width=375 align="center">$gene_name_2</td>
	<td width=375 align="center">$clinvar_diseases_2_2</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_2_2 <br/>
$comp_variant_firstT_2 </td>
	<td width=375 align="center">$clinvar_classification_2_2</td>
	</tr></table><br>&nbsp;<br>" > new/observed.html

elif [ $clinsig == 3 ]
	then
	echo "3 Clinically significant mutation has been identified for the diagnosed condition." > new/clinvar_observed.txt
	echo "
	<table border="1" >
	<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 align="center">Gene Name</th>
		<th width=375 align="center">Disease</th>
		<th width=375 align="center">Location of the Variant</th>
		<th width=375 align="center">Classification</th>
	</tr>
	<tr>
	<td align=center>1.</td>
	<td width=375 align="center">$gene_name_1</td>
	<td width=375 align="center">$clinvar_diseases_1_3</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_1_3 <br/>
$comp_variant_firstT_1 </td>
	<td width=375 align="center">$clinvar_classification_1_3</td>
	</tr>
	<tr>
	<td align=center>2.</td>
	<td width=375 align="center">$gene_name_2</td>
	<td width=375 align="center">$clinvar_diseases_2_3</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_2_3 <br/>
$comp_variant_firstT_2 </td>
	<td width=375 align="center">$clinvar_classification_2_3</td>
	</tr>
	<tr>
	<td align=center>3.</td>
	<td width=375 align="center">$gene_name_3</td>
	<td width=375 align="center">$clinvar_diseases_3_3</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_3_3 <br/>
$comp_variant_firstT_3 </td>
	<td width=375 align="center">$clinvar_classification_3_3</td>
	</tr></table><br>&nbsp;<br>" > new/observed.html

elif [ $clinsig == 4 ]
	then
	echo "4 Clinically significant mutation has been identified for the diagnosed condition." > new/clinvar_observed.txt
	echo "
	<table border="1" >
	<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 align="center">Gene Name</th>
		<th width=375 align="center">Disease</th>
		<th width=375 align="center">Location of the Variant</th>
		<th width=375 align="center">Classification</th>
	</tr>
	<tr>
	<td align=center>1.</td>
	<td width=375 align="center">$gene_name_1</td>
	<td width=375 align="center">$clinvar_diseases_1_4</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_1_4 <br/>
$comp_variant_firstT_1 </td>
	<td width=375 align="center">$clinvar_classification_1_4</td>
	</tr>
	<tr>
	<td align=center>2.</td>
	<td width=375 align="center">$gene_name_2</td>
	<td width=375 align="center">$clinvar_diseases_2_4</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_2_4 <br/>
$comp_variant_firstT_2 </td>
	<td width=375 align="center">$clinvar_classification_2_4</td>
	</tr>
	<tr>
	<td align=center>3.</td>
	<td width=375 align="center">$gene_name_3</td>
	<td width=375 align="center">$clinvar_diseases_3_4</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_3_4 <br/>
$comp_variant_firstT_3 </td>
	<td width=375 align="center">$clinvar_classification_3_4</td>
	</tr>
	<tr>
	<td align=center>4.</td>
	<td width=375 align="center">$gene_name_4</td>
	<td width=375 align="center">$clinvar_diseases_4_4</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_4_4 <br/>
$comp_variant_firstT_4 </td>
	<td width=375 align="center">$clinvar_classification_4_4</td>
	</tr></table><br>&nbsp;<br>" > new/observed.html

elif [ $clinsig == 5 ]
	then
	echo "5 Clinically significant mutation has been identified for the diagnosed condition." > new/clinvar_observed.txt
	echo "
	<table border="1" >
	<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 align="center">Gene Name</th>
		<th width=375 align="center">Disease</th>
		<th width=375 align="center">Location of the Variant</th>
		<th width=375 align="center">Classification</th>
	</tr>
	<tr>
	<td align=center>1.</td>
	<td width=375 align="center">$gene_name_1</td>
	<td width=375 align="center">$clinvar_diseases_1_5</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_1_5 <br/>
$comp_variant_firstT_1 </td>
	<td width=375 align="center">$clinvar_classification_1_5</td>
	</tr>
	<tr>
	<td align=center>2.</td>
	<td width=375 align="center">$gene_name_2</td>
	<td width=375 align="center">$clinvar_diseases_2_5</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_2_5 <br/>
$comp_variant_firstT_2 </td>
	<td width=375 align="center">$clinvar_classification_2_5</td>
	</tr>
	<tr>
	<td align=center>3.</td>
	<td width=375 align="center">$gene_name_3</td>
	<td width=375 align="center">$clinvar_diseases_3_5</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_3_5 <br/>
$comp_variant_firstT_3 </td>
	<td width=375 align="center">$clinvar_classification_3_5</td>
	</tr>
	<tr>
	<td align=center>4.</td>
	<td width=375 align="center">$gene_name_4</td>
	<td width=375 align="center">$clinvar_diseases_4_5</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_4_5 <br/>
$comp_variant_firstT_4 </td>
	<td width=375 align="center">$clinvar_classification_4_5</td>
	</tr>
	<tr>
	<td align=center>5.</td>
	<td width=375 align="center">$gene_name_5</td>
	<td width=375 align="center">$clinvar_diseases_5_5</td>
	<td width=375 align="center">$GENOMIC_LOCATION_of_variant_5_5 <br/>
$comp_variant_firstT_5 </td>
	<td width=375 align="center">$clinvar_classification_5_5</td>
	</tr></table><br>&nbsp;<br>" > new/observed.html

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# To get the DETAILED VARIANT INFORMATION:.

if [ $clinsig == 0 ]
	then
	echo "No Clinically significant mutation has been identified for the diagnosed condition." > new/clinvar_detailed.txt

elif [ $clinsig == 1 ]
	then
	echo "Annotations of the Clinically significant mutation." > new/clinvar_detailed.txt
	echo "
	<table border="1" >
	
	<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 bgcolor="LightGray" align="center">Gene Name</th>
		<th width=375 bgcolor="LightGray" align="center">Variant Type</th>
		<th width=375 bgcolor="LightGray" align="center">Variant Location</th>
		<th width=375 bgcolor="LightGray" align="center">Amino Acid Change</th>
		<th width=375 bgcolor="LightGray" align="center">dbSNP Identifier</th>

	</tr>
	<tr>
	<td align=center>1.</td>
		<td width=375 align="center">$gene_name_1 (RefSeq ID: $transcript_id_firstT_1)</td>
		<td width=375 align="center">$variant_type_1</td>
		<td width=375 align="center">$variant_location_1</td>
		<td width=375 align="center">$aachange_firstT_1</td>
		<td width=375 align="center">$rsID_1</td>

	</tr></table><br>&nbsp;<br>
	<table border=1 >
	<caption><strong>MINOR ALLELE FREQUENCY and PREDICTED IMPACT OF VARIANT:</strong></caption>
<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 bgcolor="LightGray" align="center">MAF from 1000 Genomes Project</th>
		<th width=375 bgcolor="LightGray" align="center">SIFT score and prediction</th>
		<th width=375 bgcolor="LightGray" align="center">Polyphen score and prediction</th>
</tr>

<tr>
	<td align=center>1.</td>
	<td width=375 align="center">$maf_1</td>
	<td width=375 align="center">$sift_score_1 and $sift_pred_1</td>
	<td width=375 align="center">$polyphen_score_1 and $polyphen_pred_1</td>
</tr> </table> <br>&nbsp;<br>" > new/detailed.html


elif [ $clinsig == 2 ]
	then
	echo "Annotations of the Clinically significant mutations." > new/clinvar_detailed.txt
	echo "
	<table border="1" >
	
<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 bgcolor="LightGray" align="center">Gene Name</th>
		<th width=375 bgcolor="LightGray" align="center">Variant Type</th>
		<th width=375 bgcolor="LightGray" align="center">Variant Location</th>
		<th width=375 bgcolor="LightGray" align="center">Amino Acid Change</th>
		<th width=375 bgcolor="LightGray" align="center">dbSNP Identifier</th>

</tr>
<tr>
	<td align=center>1.</td>
		<td width=375 align="center">$gene_name_1 (RefSeq ID: $transcript_id_firstT_1)</td>
		<td width=375 align="center">$variant_type_1</td>
		<td width=375 align="center">$variant_location_1</td>
		<td width=375 align="center">$aachange_firstT_1</td>
		<td width=375 align="center">$rsID_1</td>

</tr>
<tr>
	<td align=center>2.</td>
	<td width=375 align="center">$gene_name_2 (RefSeq ID: $transcript_id_firstT_2)</td>
	<td width=375 align="center">$variant_type_2</td>
	<td width=375 align="center">$variant_location_2</td>
	<td width=375 align="center">$aachange_firstT_2</td>
	<td width=375 align="center">$rsID_2</td>
</tr>
</table><br>&nbsp;<br>
	<table border="1" >
	<caption><strong>MINOR ALLELE FREQUENCY and PREDICTED IMPACT OF VARIANT:</strong></caption>
<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 bgcolor="LightGray" align="center">MAF from 1000 Genomes Project</th>
		<th width=375 bgcolor="LightGray" align="center">SIFT score and prediction</th>
		<th width=375 bgcolor="LightGray" align="center">Polyphen score and prediction</th>
</tr>

<tr>
	<td align=center>1.</td>
	<td width=375 align="center">$maf_1</td>
	<td width=375 align="center">$sift_score_1 and $sift_pred_1</td>
	<td width=375 align="center">$polyphen_score_1 and $polyphen_pred_1</td>
</tr> 

<tr>
	<td align=center>2.</td>
	<td width=375 align="center">$maf_2</td>
	<td width=375 align="center">$sift_score_2 and $sift_pred_2</td>
	<td width=375 align="center">$polyphen_score_2 and $polyphen_pred_2</td>
</tr>
</table> <br>&nbsp;<br>" > new/detailed.html


elif [ $clinsig == 3 ]
	then
	echo "Annotations of the Clinically significant mutations." > new/clinvar_detailed.txt
	echo "
	<table border="1" >
	
<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 bgcolor="LightGray" align="center">Gene Name</th>
		<th width=375 bgcolor="LightGray" align="center">Variant Type</th>
		<th width=375 bgcolor="LightGray" align="center">Variant Location</th>
		<th width=375 bgcolor="LightGray" align="center">Amino Acid Change</th>
		<th width=375 bgcolor="LightGray" align="center">dbSNP Identifier</th>

</tr>
<tr>
	<td align=center>1.</td>
		<td width=375 align="center">$gene_name_1 (RefSeq ID: $transcript_id_firstT_1)</td>
		<td width=375 align="center">$variant_type_1</td>
		<td width=375 align="center">$variant_location_1</td>
		<td width=375 align="center">$aachange_firstT_1</td>
		<td width=375 align="center">$rsID_1</td>

</tr>
<tr>
	<td align=center>2.</td>
	<td width=375 align="center">$gene_name_2 (RefSeq ID: $transcript_id_firstT_2)</td>
	<td width=375 align="center">$variant_type_2</td>
	<td width=375 align="center">$variant_location_2</td>
	<td width=375 align="center">$aachange_firstT_2</td>
	<td width=375 align="center">$rsID_2</td>
</tr>
<tr>
	<td align=center>3.</td>
	<td width=375 align="center">$gene_name_3 (RefSeq ID: $transcript_id_firstT_3)</td>
	<td width=375 align="center">$variant_type_3</td>
	<td width=375 align="center">$variant_location_3</td>
	<td width=375 align="center">$aachange_firstT_3</td>
	<td width=375 align="center">$rsID_3</td>
</tr>
</table><br>&nbsp;<br>

<table border="1" >
	<caption><strong>MINOR ALLELE FREQUENCY and PREDICTED IMPACT OF VARIANT:</strong></caption>
<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 bgcolor="LightGray" align="center">MAF from 1000 Genomes Project</th>
		<th width=375 bgcolor="LightGray" align="center">SIFT score and prediction</th>
		<th width=375 bgcolor="LightGray" align="center">Polyphen score and prediction</th>
</tr>

<tr>
	<td align=center>1.</td>
	<td width=375 align="center">$maf_1</td>
	<td width=375 align="center">$sift_score_1 and $sift_pred_1</td>
	<td width=375 align="center">$polyphen_score_1 and $polyphen_pred_1</td>
</tr> 

<tr>
	<td align=center>2.</td>
	<td width=375 align="center">$maf_2</td>
	<td width=375 align="center">$sift_score_2 and $sift_pred_2</td>
	<td width=375 align="center">$polyphen_score_2 and $polyphen_pred_2</td>
</tr>
<tr>
	<td align=center>3.</td>
	<td width=375 align="center">$maf_3</td>
	<td width=375 align="center">$sift_score_3 and $sift_pred_3</td>
	<td width=375 align="center">$polyphen_score_3 and $polyphen_pred_3</td>
</tr>
</table> <br>&nbsp;<br>" > new/detailed.html

elif [ $clinsig == 4 ]
	then
	echo "Annotations of the Clinically significant mutations." > new/clinvar_detailed.txt
	echo "
	<table border="1" >
	
<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 bgcolor="LightGray" align="center">Gene Name</th>
		<th width=375 bgcolor="LightGray" align="center">Variant Type</th>
		<th width=375 bgcolor="LightGray" align="center">Variant Location</th>
		<th width=375 bgcolor="LightGray" align="center">Amino Acid Change</th>
		<th width=375 bgcolor="LightGray" align="center">dbSNP Identifier</th>

</tr>
<tr>
	<td align=center>1.</td>
		<td width=375 align="center">$gene_name_1 (RefSeq ID: $transcript_id_firstT_1)</td>
		<td width=375 align="center">$variant_type_1</td>
		<td width=375 align="center">$variant_location_1</td>
		<td width=375 align="center">$aachange_firstT_1</td>
		<td width=375 align="center">$rsID_1</td>

</tr>
<tr>
	<td align=center>2.</td>
	<td width=375 align="center">$gene_name_2 (RefSeq ID: $transcript_id_firstT_2)</td>
	<td width=375 align="center">$variant_type_2</td>
	<td width=375 align="center">$variant_location_2</td>
	<td width=375 align="center">$aachange_firstT_2</td>
	<td width=375 align="center">$rsID_2</td>
</tr>
<tr>
	<td align=center>3.</td>
	<td width=375 align="center">$gene_name_3 (RefSeq ID: $transcript_id_firstT_3)</td>
	<td width=375 align="center">$variant_type_3</td>
	<td width=375 align="center">$variant_location_3</td>
	<td width=375 align="center">$aachange_firstT_3</td>
	<td width=375 align="center">$rsID_3</td>
</tr>
<tr>
	<td align=center>4.</td>
	<td width=375 align="center">$gene_name_4 (RefSeq ID: $transcript_id_firstT_4)</td>
	<td width=375 align="center">$variant_type_4</td>
	<td width=375 align="center">$variant_location_4</td>
	<td width=375 align="center">$aachange_firstT_4</td>
	<td width=375 align="center">$rsID_4</td>
</tr>
</table><br>&nbsp;<br>

<table border="1" >
	<caption><strong>MINOR ALLELE FREQUENCY and PREDICTED IMPACT OF VARIANT:</strong></caption>
<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 bgcolor="LightGray" align="center">MAF from 1000 Genomes Project</th>
		<th width=375 bgcolor="LightGray" align="center">SIFT score and prediction</th>
		<th width=375 bgcolor="LightGray" align="center">Polyphen score and prediction</th>
</tr>

<tr>
	<td align=center>1.</td>
	<td width=375 align="center">$maf_1</td>
	<td width=375 align="center">$sift_score_1 and $sift_pred_1</td>
	<td width=375 align="center">$polyphen_score_1 and $polyphen_pred_1</td>
</tr> 

<tr>
	<td align=center>2.</td>
	<td width=375 align="center">$maf_2</td>
	<td width=375 align="center">$sift_score_2 and $sift_pred_2</td>
	<td width=375 align="center">$polyphen_score_2 and $polyphen_pred_2</td>
</tr>
<tr>
	<td align=center>3.</td>
	<td width=375 align="center">$maf_3</td>
	<td width=375 align="center">$sift_score_3 and $sift_pred_3</td>
	<td width=375 align="center">$polyphen_score_3 and $polyphen_pred_3</td>
</tr>
<tr>
	<td align=center>4.</td>
	<td width=375 align="center">$maf_4</td>
	<td width=375 align="center">$sift_score_4 and $sift_pred_4</td>
	<td width=375 align="center">$polyphen_score_4 and $polyphen_pred_4</td>
</tr>
</table> <br>&nbsp;<br>" > new/detailed.html

elif [ $clinsig == 5 ]
	then
	echo "Annotations of the Clinically significant mutations." > new/clinvar_detailed.txt
	echo "
	<table border="1" >
	
<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 bgcolor="LightGray" align="center">Gene Name</th>
		<th width=375 bgcolor="LightGray" align="center">Variant Type</th>
		<th width=375 bgcolor="LightGray" align="center">Variant Location</th>
		<th width=375 bgcolor="LightGray" align="center">Amino Acid Change</th>
		<th width=375 bgcolor="LightGray" align="center">dbSNP Identifier</th>

</tr>
<tr>
	<td align=center>1.</td>
		<td width=375 align="center">$gene_name_1 (RefSeq ID: $transcript_id_firstT_1)</td>
		<td width=375 align="center">$variant_type_1</td>
		<td width=375 align="center">$variant_location_1</td>
		<td width=375 align="center">$aachange_firstT_1</td>
		<td width=375 align="center">$rsID_1</td>

</tr>
<tr>
	<td align=center>2.</td>
	<td width=375 align="center">$gene_name_2 (RefSeq ID: $transcript_id_firstT_2)</td>
	<td width=375 align="center">$variant_type_2</td>
	<td width=375 align="center">$variant_location_2</td>
	<td width=375 align="center">$aachange_firstT_2</td>
	<td width=375 align="center">$rsID_2</td>
</tr>
<tr>
	<td align=center>3.</td>
	<td width=375 align="center">$gene_name_3 (RefSeq ID: $transcript_id_firstT_3)</td>
	<td width=375 align="center">$variant_type_3</td>
	<td width=375 align="center">$variant_location_3</td>
	<td width=375 align="center">$aachange_firstT_3</td>
	<td width=375 align="center">$rsID_3</td>
</tr>
<tr>
	<td align=center>4.</td>
	<td width=375 align="center">$gene_name_4 (RefSeq ID: $transcript_id_firstT_4)</td>
	<td width=375 align="center">$variant_type_4</td>
	<td width=375 align="center">$variant_location_4</td>
	<td width=375 align="center">$aachange_firstT_4</td>
	<td width=375 align="center">$rsID_4</td>
</tr>
<tr>
	<td align=center>5.</td>
	<td width=375 align="center">$gene_name_5 (RefSeq ID: $transcript_id_firstT_5)</td>
	<td width=375 align="center">$variant_type_5</td>
	<td width=375 align="center">$variant_location_5</td>
	<td width=375 align="center">$aachange_firstT_5</td>
	<td width=375 align="center">$rsID_5</td>
</tr>
</table><br>&nbsp;<br>

<table border="1" >
	<caption><strong>MINOR ALLELE FREQUENCY and PREDICTED IMPACT OF VARIANT:</strong></caption>
<tr>
		<th bgcolor=LightGray>&nbsp;</th>
		<th width=375 bgcolor="LightGray" align="center">MAF from 1000 Genomes Project</th>
		<th width=375 bgcolor="LightGray" align="center">SIFT score and prediction</th>
		<th width=375 bgcolor="LightGray" align="center">Polyphen score and prediction</th>
</tr>

<tr>
	<td align=center>1.</td>
	<td width=375 align="center">$maf_1</td>
	<td width=375 align="center">$sift_score_1 and $sift_pred_1</td>
	<td width=375 align="center">$polyphen_score_1 and $polyphen_pred_1</td>
</tr> 

<tr>
	<td align=center>2.</td>
	<td width=375 align="center">$maf_2</td>
	<td width=375 align="center">$sift_score_2 and $sift_pred_2</td>
	<td width=375 align="center">$polyphen_score_2 and $polyphen_pred_2</td>
</tr>
<tr>
	<td align=center>3.</td>
	<td width=375 align="center">$maf_3</td>
	<td width=375 align="center">$sift_score_3 and $sift_pred_3</td>
	<td width=375 align="center">$polyphen_score_3 and $polyphen_pred_3</td>
</tr>
<tr>
	<td align=center>4.</td>
	<td width=375 align="center">$maf_4</td>
	<td width=375 align="center">$sift_score_4 and $sift_pred_4</td>
	<td width=375 align="center">$polyphen_score_4 and $polyphen_pred_4</td>
</tr>
<tr>
	<td align=center>5.</td>
	<td width=375 align="center">$maf_5</td>
	<td width=375 align="center">$sift_score_5 and $sift_pred_5</td>
	<td width=375 align="center">$polyphen_score_5 and $polyphen_pred_5</td>
</tr>
</table> <br>&nbsp;<br>" > new/detailed.html

fi

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# To get the VARIANT INTERPRETATION:

if [ $clinsig == 0 ]
	then
	echo "No Clinically significant mutation has been identified for the diagnosed condition." > new/variant_interpretation.txt

elif [ $clinsig == 1 ]
	then
	echo "<br>&nbsp;<br><table border="1" >
	<caption><strong>VARIANT INTERPRETATION:</strong></caption>
<tr>
	<td align=center>1.</td>
	<td> <p> The identified variant is located in the <strong> $variant_location_1 </strong> region and is a <strong> $variant_type_1 </strong> which causes an amino acid change from <strong> $aachange_firstA_firstT_1 </strong> to <strong> $aachange_lastA_firstT_1 </strong>. </p> </td> 
</tr>
</table>" > new/variant_interpretation.txt

elif [ $clinsig == 2 ]
	then
	echo "<br>&nbsp;<br><table border="1" >
	<caption><strong>VARIANT INTERPRETATION:</strong></caption>
<tr>
	<td align=center>1.</td>
<td> <p> The identified variant is located in the <strong> $variant_location_1 </strong> region and is a <strong> $variant_type_1 </strong> which causes an amino acid change from <strong> $aachange_firstA_firstT_1 </strong> to <strong>$aachange_lastA_firstT_1 </strong>. </p> </td>
</tr>
<tr>
	<td align=center>2.</td>
<td> <p> The identified variant is located in the <strong> $variant_location_2 </strong> region and is a <strong> $variant_type_2 </strong> which causes an amino acid change from <strong>$aachange_firstA_firstT_2 </strong> to <strong>$aachange_lastA_firstT_2 </strong>. </p> </td>
</tr>
</table> " > new/variant_interpretation.txt


elif [ $clinsig == 3 ]
	then
	echo "<br>&nbsp;<br><table border="1" >
	<caption><strong>VARIANT INTERPRETATION:</strong></caption>
<tr>
	<td align=center>1.</td>
	<td> <p> The identified variant is located in the <strong> $variant_location_1 </strong> region and is a <strong> $variant_type_1 </strong> which causes an amino acid change from <strong> $aachange_firstA_firstT_1 </strong> to <strong>$aachange_lastA_firstT_1 </strong>. </p> </td>
</tr>
<tr>
	<td align=center>2.</td>
<td> 
	<p> The identified variant is located in the <strong> $variant_location_2 </strong> region and is a <strong> $variant_type_2 </strong> which causes an amino acid change from <strong>$aachange_firstA_firstT_2 </strong> to <strong>$aachange_lastA_firstT_2 </strong>. </p> </td>
</tr>
<tr>
	<td align=center>3.</td>
<td>  
	<p> The identified variant is located in the <strong> $variant_location_3 </strong> region and is a <strong> $variant_type_3 </strong> which causes an amino acid change from <strong>$aachange_firstA_firstT_3 </strong> to <strong>$aachange_lastA_firstT_3 </strong>. </p> </td> 
</tr>
</table>" > new/variant_interpretation.txt

elif [ $clinsig == 4 ]
	then
	echo "<br>&nbsp;<br><table border="1" >
	<caption><strong>VARIANT INTERPRETATION:</strong></caption>
<tr>
	<td align=center>1.</td>
	<td> <p> The identified variant is located in the <strong> $variant_location_1 </strong> region and is a <strong> $variant_type_1 </strong> which causes an amino acid change from <strong> $aachange_firstA_firstT_1 </strong> to <strong>$aachange_lastA_firstT_1 </strong>. </p> </td>
</tr>
<tr>
	<td align=center>2.</td>
<td> 
	<p> The identified variant is located in the <strong> $variant_location_2 </strong> region and is a <strong> $variant_type_2 </strong> which causes an amino acid change from <strong>$aachange_firstA_firstT_2 </strong> to <strong>$aachange_lastA_firstT_2 </strong>. </p> </td>
</tr>
<tr>
	<td align=center>3.</td>
<td>  
	<p> The identified variant is located in the <strong> $variant_location_3 </strong> region and is a <strong> $variant_type_3 </strong> which causes an amino acid change from <strong>$aachange_firstA_firstT_3 </strong> to <strong>$aachange_lastA_firstT_3 </strong>. </p> </td>
</tr>
<tr>
	<td align=center>4.</td>
<td> 
	<p> The identified variant is located in the <strong> $variant_location_4 </strong> region and is a <strong> $variant_type_4 </strong> which causes an amino acid change from <strong>$aachange_firstA_firstT_4 </strong> to <strong>$aachange_lastA_firstT_4 </strong>. </p> </td> 
</tr>
</table>" > new/variant_interpretation.txt

elif [ $clinsig == 5 ]
	then
	echo "<br>&nbsp;<br><table border="1" >
	<caption><strong>VARIANT INTERPRETATION:</strong></caption>
<tr>
	<td align=center>1.</td>
	<td> <p> The identified variant is located in the <strong> $variant_location_1 </strong> region and is a <strong> $variant_type_1 </strong> which causes an amino acid change from <strong> $aachange_firstA_firstT_1 </strong> to <strong>$aachange_lastA_firstT_1 </strong>. </p> </td>
</tr>
<tr>
	<td align=center>2.</td>
<td> 
	<p> The identified variant is located in the <strong> $variant_location_2 </strong> region and is a <strong> $variant_type_2 </strong> which causes an amino acid change from <strong>$aachange_firstA_firstT_2 </strong> to <strong>$aachange_lastA_firstT_2 </strong>. </p> </td>
</tr>
<tr>
	<td align=center>3.</td>
<td>  
	<p> The identified variant is located in the <strong> $variant_location_3 </strong> region and is a <strong> $variant_type_3 </strong> which causes an amino acid change from <strong>$aachange_firstA_firstT_3 </strong> to <strong>$aachange_lastA_firstT_3 </strong>. </p> </td>
</tr>
<tr>
	<td align=center>4.</td>
<td> 
	<p> The identified variant is located in the <strong> $variant_location_4 </strong> region and is a <strong> $variant_type_4 </strong> which causes an amino acid change from <strong>$aachange_firstA_firstT_4 </strong> to <strong>$aachange_lastA_firstT_4 </strong>. </p> </td>
</tr>
<tr>
	<td align=center>5.</td>
<td> 
	<p> The identified variant is located in the <strong> $variant_location_5 </strong> region and is a <strong> $variant_type_5 </strong> which causes an amino acid change from <strong>$aachange_firstA_firstT_5 </strong> to <strong>$aachange_lastA_firstT_5 </strong>. </p> </td> 
</tr>
</table>" > new/variant_interpretation.txt

fi


#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# To create and combine html files into REPORT!
mv chromatogram_hetero.pdf new/

gene_name=$(cat new/gene_name.txt)

ABI=$(cat new/ABI.txt)

cd new

mkdir REPORT


awk -f clinvar_observed.awk  clinvar_observed.txt > clinvar_observed.html

awk -f clinvar_detailed.awk  clinvar_detailed.txt > clinvar_detailed.html

awk -f condition_name.awk condition_name.txt > condition_name.html

awk -f test_code.awk test_code.txt > test_code.html

#awk -f variant_interpretation.awk variant_interpretation.txt > variant_interpretation.html

awk -f gene_summary.awk /home/sols/Documents/anil/PIPELINE_NEW_ABI_files/working/gene_humanDB/summary_$gene_name.txt > gene_summary.html

pdftohtml -c chromatogram_hetero.pdf chromatogram_hetero.html

cat body_head.html test_code.html condition_name.html Result.html gene_summary.html clinvar_observed.html observed.html clinvar_detailed.html detailed.html variant_interpretation.txt body_tail.html chromatogram_title.html chromatogram_hetero-1.html chromatogram_summary.html  > REPORT/MANIPAL_report_$ABI.html

#rm -rf clinvar_observed.html condition_name.html test_code.html gene_summary.html observed.html detailed.html Result.html

cd REPORT

html2pdf MANIPAL_report_$ABI.html MANIPAL_report_$ABI.pdf

#------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# To merge chromatogram and manipal report!


#pdftk MANIPAL_report_$ABI.pdf chromatogram_hetero.pdf output MANIPAL_System_Report_$ABI.pdf

#exiftool -Title="MANIPAL System Diagnostic Report" MANIPAL_report_$ABI.pdf

#pdfunite MANIPAL_report_Seq_E04_W93_EX12_F_010.ab1.pdf chromatogram2_wisp3PPD1_f_final.pdf final.pdf


evince MANIPAL_report_$ABI.pdf

cd ..

cd ..


# Adds closing tags at the end of the html report file!
#cat body_tail.txt >> MANIPAL_cat.html

# Adds opening tags at the start of the html report file!
#cat body_head.html MANIPAL_cat.html > MANIPAL_report.html

 # make strucuralcohort

bblid=$(cat /data/jux/BBL/projects/fmriprepdico/script/structural/missingcohort.csv)

cohort=/data/jux/BBL/projects/fmriprepdico/script/structural/miisedstruccohort.csv
rm   $cohort
echo id0,img > $cohort 

for i in $bblid; do 
   b=$(ls -d  /data/jux/BBL/projects/fmriprepdico/data/nfieldmap/fmriprep/*${i}/anat/*_space-MNI152NLin2009cAsym_desc-preproc_T1w.nii.gz)
   echo sub-$i,$b >> $cohort 

done 

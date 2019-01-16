

dir1=/data/joy/BBL/studies/grmpy/BIDS/grmpy


for j in $dir1/sub*; do 

 ff=${j#*-*} 

   echo $ff >> /data/jux/BBL/projects/fmriprepdico/script/subjectid.csv
done
 



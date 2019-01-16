

subjectID=$(cat /data/jux/BBL/projects/fmriprepdico/script/subjectid.csv)


for idw in $subjectID; do 

echo /share/apps/singularity/2.5.1/bin/singularity run -B /data:/home/aadebimpe/data /data/joy/BBL/applications/bids_apps/fmriprep.simg /home/aadebimpe/data/jux/BBL/studies/grmpy/BIDS/grmpy /home/aadebimpe/data/jux/BBL/projects/fmriprepdico/data/nfieldmap participant  --participant_label ${idw} --no-freesurfer -w /home/aadebimpe/data/jux/BBL/projects/fmriprepdico/data/w1 --force-bbr --fs-license-file license.txt --low-mem --output-space template --ignore fieldmaps  > subjectrun${idw}.sh

qsub subjectrun${idw}.sh

done 

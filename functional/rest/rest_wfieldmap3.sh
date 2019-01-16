


FULL_COHORT=/data/jux/BBL/projects/fmriprepdico/script/functional/wfieldmapcohortrest.csv
NJOBS=$(wc -l <  ${FULL_COHORT})
num=$(expr $NJOBS - 1);

SNGL=/share/apps/singularity/2.5.1/bin/singularity
SIMG=/data/joy/BBL/applications/bids_apps/xcpEngine.simg
DESIGN=/data/jux/BBL/projects/fmriprepdico/script/functional/rest/restacompcor.dsn
OUTPUT=/data/jux/BBL/projects/fmriprepdico/data/wfieldmap/restacompcor



HEADER=$(head -n 1 ${FULL_COHORT})
bb=$(seq 1 $num)

for j in $bb; do  
    l=$(expr $j + 1)
    LINE=$(awk "NR==$l" ${FULL_COHORT})
    TEMP_COHORT=${FULL_COHORT}.${j}.csv

    echo $HEADER > ${TEMP_COHORT}
    echo $LINE>> ${TEMP_COHORT}
 
    echo ${SNGL} run -B /data:/home/aadebimpe/data ${SIMG}  -c /home/aadebimpe${TEMP_COHORT}  -d /home/aadebimpe$DESIGN -o /home/aadebimpe$OUTPUT  -r /home/aadebimpe > nbackwfielmap1_${j}.sh
  
    qsub nbackwfielmap1_${j}.sh

done 

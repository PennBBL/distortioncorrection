


subjid=$(cat /data/jux/BBL/projects/fmriprepdico/script/subjectid.csv)

customfie=/data/jux/BBL/projects/fmriprepdico/script/functional/nback/nback_activation_model_ts_231.1D

  rest1=/data/jux/BBL/projects/fmriprepdico/script/functional/nfieldmapcohortrest.csv
  rest2=/data/jux/BBL/projects/fmriprepdico/script/functional/syndmapcohortrest.csv
  rest3=/data/jux/BBL/projects/fmriprepdico/script/functional/wfieldmapcohortrest.csv
  task11=/data/jux/BBL/projects/fmriprepdico/script/functional/nfieldmapnbacktask.csv
  task12=/data/jux/BBL/projects/fmriprepdico/script/functional/nfieldmapnbacktask_regressed.csv
  task21=/data/jux/BBL/projects/fmriprepdico/script/functional/synnbacktask.csv
  task22=/data/jux/BBL/projects/fmriprepdico/script/functional/synnbacktask_regressed.csv
  task31=/data/jux/BBL/projects/fmriprepdico/script/functional/wfieldmapnbacktask.csv
  task32=/data/jux/BBL/projects/fmriprepdico/script/functional/wfieldmapnbacktask_regressed.csv

 rm $rest1 $rest2 $rest3 $task11 $task12 $task21 $task22 $task31 $task32

  echo id0,img,antsct > $rest1
  echo id0,img,antsct > $rest2
  echo id0,img,antsct  > $rest3
  echo id0,img,antsct  > $task11
  echo id0,img,antsct  > $task21
  echo id0,img,antsct  > $task31
  echo id0,img,antsct,confound2_custom  > $task12
  echo id0,img,antsct,confound2_custom  > $task22
  echo id0,img,antsct,confound2_custom  > $task32
 
  
  for i in $subjid; do 
  
  struct=$(ls -d  /data/jux/BBL/projects/fmriprepdico/data/structural/sub-${i}/struc )
 
  img1=$(ls -d /data/jux/BBL/projects/fmriprepdico/data/nfieldmap/fmriprep/sub-${i}/func/*task-fracback*_desc-preproc_bold.nii.gz) 
  img2=$(ls -d /data/jux/BBL/projects/fmriprepdico/data/nfieldmap/fmriprep/sub-${i}/func/*task-rest*_desc-preproc_bold.nii.gz)
  
  img3=$(ls -d  /data/jux/BBL/projects/fmriprepdico/data/syndc/fmriprep/sub-${i}/func/*task-fracback*_desc-preproc_bold.nii.gz) 
  img4=$(ls -d  /data/jux/BBL/projects/fmriprepdico/data/syndc/fmriprep/sub-${i}/func/*task-rest*_desc-preproc_bold.nii.gz)
  

  img5=$(ls -d /data/jux/BBL/projects/fmriprepdico/data/wfieldmap/fmriprep/sub-${i}/func/*task-fracback*_desc-preproc_bold.nii.gz) 
  img6=$(ls -d  /data/jux/BBL/projects/fmriprepdico/data/wfieldmap/fmriprep/sub-${i}/func/*task-rest*_desc-preproc_bold.nii.gz)
  
  echo sub-${i},$img2,$struct >> $rest1
  echo sub-${i},$img4,$struct >> $rest2
   echo sub-${i},$img6,$struct >> $rest3

   echo sub-${i},$img1,$struct >> $task11
   echo sub-${i},$img3,$struct >> $task21
   echo sub-${i},$img5,$struct >> $task31 
 
    echo sub-${i},$img1,$struct,$customfie >> $task12
   echo sub-${i},$img3,$struct,$customfie >> $task22
   echo sub-${i},$img5,$struct,$customfie >> $task32

  done  

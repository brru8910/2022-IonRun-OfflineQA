#!/bin/bash

#Transfer arguments.
inputFile=$1

#Temporary storage directory on EOS.
tmpDirectory=$2

if [ ! -f $tmpDirectory/$inputFile ]; then
    echo "[ERROR] No file found at path "$tmpDirectory/$inputFile". Exiting."
    exit 1
fi
echo '[INFO] File exists.'

#Move to submit directory and submit QA job.
cd /afs/cern.ch/user/n/na61qa/2022-IonRun-OfflineQA/submit
echo "Submitting file $inputFile in directory $tmpDirectory ."
./condor_submit.sh $inputFile $tmpDirectory

exit 0

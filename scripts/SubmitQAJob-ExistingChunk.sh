#!/bin/bash

#Transfer arguments.
inputFile=$1
inputDirectory=$2

#Temporary storage directory on EOS.
tmpDirectory=/eos/experiment/na61/data/OnlineProduction/2022-IonRun-OfflineQA/ChunkStorage

echo '[WARNING] File must exist in EOS Drop Directory!'

#Move to submit directory and submit QA job.
cd /afs/cern.ch/user/n/na61qa/2022-IonRun-OfflineQA/submit
echo "Submitting file $inputFile in directory $tmpDirectory ."
./condor_submit.sh $inputFile $tmpDirectory

exit 0

#!/bin/bash

#Transfer arguments.
matchString="run-*"
numberOfFiles=1000
inputDirectory=/eos/experiment/na61/data/OnlineProduction/2022-IonRun-OfflineQA/ChunkStorage

if [[ $# -gt 3 ]]
then
    echo "Incorrect usage! Usage: ./ReconstructExistingChunks.sh [numberOfFiles (default = 1000)] [matchPattern (default = \"run-*\"] [directory (default = EOS chunk storage]"
    exit 1
fi


if [[ $# -eq 1 ]]
then
    numberOfFiles=$1
    echo "[INFO] Number of files set to "$numberOfFiles"."
fi

if [[ $# -eq 2 ]]
then
    numberOfFiles=$1
    matchPattern=$2
    echo "[INFO] Number of files set to "$numberOfFiles"."
    echo "[INFO] Match pattern set to "$matchPattern"."
fi

if [[ $# -eq 3 ]]
then
    numberOfFiles=$1
    matchPattern=$2
    inputDirectory=$3
    echo "[INFO] Number of files set to "$numberOfFiles"."
    echo "[INFO] Match pattern set to "$matchPattern"."
    echo "[INFO] Input directory set to "$inputDirectory"."
fi

ls -1rt $inputDirectory'/'$matchString | sed -r 's/^.+\///' | tail -n $numberOfFiles | sort > filesToReconstruct.txt

echo "Reconstructing "`cat filesToReconstruct.txt | wc -l`" in directory "$inputDirectory"."

cat filesToReconstruct.txt | while read line 
do
   SubmitQAJob-ExistingChunk.sh $line $inputDirectory
done

rm filesToReconstruct.txt

exit 0

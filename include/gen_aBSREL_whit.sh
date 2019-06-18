#!/bin/bash
cat << EOF
fileToExe = "/home/santagata/lib/hyphy/TemplateBatchFiles/SelectionAnalyses/aBSREL.bf";
inputRedirect = {};
inputRedirect["01"]="Universal"; // genetic code
inputRedirect["02"]="$(readlink -f $1)"; // codon data
inputRedirect["03"]="$(readlink -f $2)"; // tree
inputRedirect["04"]="${5:-Foreground}"; // Test for selection on a branch
inputRedirect["05"]="$(readlink -f $1.aBSREL.json)"; // json file
inputRedirect["06"]=""; // complete selection
ExecuteAFile( fileToExe, inputRedirect);
EOF

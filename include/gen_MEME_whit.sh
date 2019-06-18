#!/bin/bash
cat << EOF
fileToExe = "/home/santagata/lib/hyphy/TemplateBatchFiles/SelectionAnalyses/MEME.bf";
inputRedirect = {};
inputRedirect["01"]="Universal"; // genetic code
inputRedirect["02"]="$(readlink -f $1)"; // codon data
inputRedirect["03"]="$(readlink -f $2)"; // tree
inputRedirect["04"]="${5:-Foreground}"; // Test for selection on a branch
inputRedirect["05"]=".1"; // significance level
inputRedirect["06"]= "$(readlink -f $1.Meme.json)";  // Add this so you have the output somewhere

ExecuteAFile( fileToExe, inputRedirect);
EOF

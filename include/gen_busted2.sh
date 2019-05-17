#!/bin/bash
cat << EOF
fileToExe = "/home/santagata/hyphy-2.3.14/res/TemplateBatchFiles/SelectionAnalyses/BUSTED.bf";
inputRedirect = {};
inputRedirect["01"]="Universal"; // genetic code
inputRedirect["02"]="$(readlink -f $1)"; // codon data
inputRedirect["03"]="$(readlink -f $2)"; // tree
inputRedirect["04"]="${3:-All}"; // Test for selection on a branch
inputRedirect["05"]=""; // complete selection

ExecuteAFile( fileToExe, inputRedirect);
EOF

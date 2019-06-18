#!/bin/bash
cat << EOF
fileToExe = "/home/santagata/lib/hyphy/TemplateBatchFiles/SelectionAnalyses/BUSTED.bf";
inputRedirect = {};
inputRedirect["01"]="Universal"; // genetic code
inputRedirect["02"]="$(readlink -f $1)"; // codon data
inputRedirect["03"]="$(readlink -f $2)"; // tree
inputRedirect["04"]="${5:-Foreground}"; // Test for selection on a branch
inputRedirect["05"]="Yes"; // Sites Vary
inputRedirect["06"]="3"; // 3 omega
inputRedirect["07"]="3"; // 3 omega
inputRedirect["08"]="250"; // 250 pints
inputRedirect["09"]="1"; // 1 seed
inputRedirect["10"]="$(readlink -f $1.Busted.json)"; // json file
inputRedirect["11"]="$(readlink -f $1.Busted.json)"; // json file
inputRedirect["12"]=""; // complete selection

ExecuteAFile( fileToExe, inputRedirect);
EOF

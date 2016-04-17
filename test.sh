#!/bin/bash

cd ./testdata/

#nucmer -maxmatch -c 100 -p abcd abcd.fa abcd.fa 
#nucmer -maxmatch -c 100 -p abcbd abcbd.fa abcbd.fa
#nucmer -maxmatch -c 100 -p abd_or_acd abd_or_acd.fa abd_or_acd.fa    

python3 ../olcAssembler -i abcd.delta -f abcd.fa -o assembly_abcd.fa -c ON
python3 ../olcAssembler -i abcbd.delta -f abcbd.fa -o assembly_abcbd.fa -c ON
python3 ../olcAssembler -i abd_or_acd.delta -f abd_or_acd.fa -o assembly_abd_or_acd.fa -c ON

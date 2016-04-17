#!/bin/bash

cd ./testdata/

#nucmer -maxmatch -c 100 -p abcd abcd.fa abcd.fa 
#nucmer -maxmatch -c 100 -p abcbd abcbd.fa abcbd.fa
#nucmer -maxmatch -c 100 -p abd_or_acd abd_or_acd.fa abd_or_acd.fa    

python3 ../olcAssembler -i contigs/abcd.delta -f contigs/abcd.fa -o assemblies/assembly_abcd.fa -c ON
python3 ../olcAssembler -i contigs/abcbd.delta -f contigs/abcbd.fa -o assemblies/assembly_abcbd.fa -c ON
python3 ../olcAssembler -i contigs/abd_or_acd.delta -f contigs/abd_or_acd.fa -o assemblies/assembly_abd_or_acd.fa -c ON

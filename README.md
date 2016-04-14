# OLC-based Assembler

## Usage
olcAssembler [options] -i 〈output_of_nucmer〉 -f 〈contigs_fasta_file〉 -o 〈outfile_prefix〉

  -h  --help   show help message
  -i  --input  input file. This is supposed to be the output file from nucmer (default: nucmer.delta)
  -o  --output the prefix of output filename (default: assemblies.fa)
  -f  --fasta  input fasta file which you used in nucmer to get overlap information (default: contigs.fa)
  -c  --cutoff cutoff overlaps whose second contig has a shorter tail (a part after the overlapping area) than its head (a part before the overlap). This has to be ON or OFF (default: ON)


# olcAssembler
**olcAssembler** is **an overlap layout consensus (OLC) assembler** which assemble contigs simply based on their overlap. The program uses a fasta file of contigs and its overlap information (nucmer.delta) gained from nucmer as input, and returns all possible assemblies by traversing a directed acyclic (DAG) graph which has contigs as its vertices and overlaps as edges. This program was made with an assumption that contigs length is much longer than overlapping parts so you can't use this for assembling reads whose most of the part normaly overlaps with others unlike overlaps between contigs. 

## Usage
**olcAssembler** [options] **-i** 〈output_of_nucmer〉 **-f** 〈contigs_fasta_file〉 **-o** 〈outfile_prefix〉
```
  -h  --help    show help message
  -i  --input   input file. This is supposed to be the output file from nucmer (default: nucmer.delta)
  -o  --output  the prefix of output filename (default: assemblies.fa)
  -f  --fasta   input fasta file which you used in nucmer to get overlap information (default: contigs.fa)
  -c  --cutoff  cutoff overlaps whose second contig has a shorter tail (a part after the overlapping area) than its head (a part before the overlap). This has to be ON or OFF (default: ON)
  ```

## Example
<div align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/f/ff/%E3%82%AD%E3%83%A3%E3%83%97%E3%83%81%E3%83%A3.PNG" width="500" height="200" />
</div>

<div align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/2/29/%E3%82%AD%E3%83%A3%E3%83%97%E3%83%81%E3%83%A32.PNG" width="475" height="220" />
</div>

<div align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/2/29/%E3%82%AD%E3%83%A3%E3%83%97%E3%83%81%E3%83%A33.PNG" width="600" height="240" />
</div>



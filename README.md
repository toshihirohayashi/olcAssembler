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
 I prepared three typical situations which is likely to happen in assembly to see this program’s capability to deal with them.
 
###1. straight
<div align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/f/ff/%E3%82%AD%E3%83%A3%E3%83%97%E3%83%81%E3%83%A3.PNG" width="450" height="180" />
</div>
<div align="center">
<b>Figure1. Assembly of four siquencially overlapping contigs.</b>   
</div>
<br>
Firstly, I applied this program to the simplest case, in which each contig overlaps another contig at the both ends except for two terminal contigs (fig1). There is an only one possible way to assembly these four contigs together (A-B-C-D), so I can say that this program successfully assembled contigs if it returns the assembly. Here are how I performed on command line, the input files and the output assembly file.   

**olcAssembler** **-i** [abcd.delta][2] **-f** [abcd.fa][1] **-o** [assembly_abcd.fa][3]

[1]: https://raw.githubusercontent.com/toshihirohayashi/olcAssembler/master/testdata/contigs/abcd.fa        "abcd.fa"
[2]: https://raw.githubusercontent.com/toshihirohayashi/olcAssembler/master/testdata/contigs/abcd.delta  "abcd.delta"
[3]: https://raw.githubusercontent.com/toshihirohayashi/olcAssembler/master/testdata/assemblies/assembly_abcd.fa   "assembly_abcd.fa"

As you can see, I could actually get the one assembly exactly as how I expected.





###2. diverge
<div align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/2/29/%E3%82%AD%E3%83%A3%E3%83%97%E3%83%81%E3%83%A32.PNG" width="400" height="240" />
</div>
<div align="center">
<b>Figure2. Assembly of contigs with two possible paths.</b>   
</div>
<br>

Next I considered the situation where contigs have two possible way of being assembled (A-B-D or A-C-D) (fig2).

**olcAssembler** **-i** [abd_or_acd.delta][4] **-f** [abd_or_acd.fa][5] **-o** [assembly_abd_or_acd.fa][6]

You can see that the program worked appropriately even with divergence as well.

[4]: https://raw.githubusercontent.com/toshihirohayashi/olcAssembler/master/testdata/contigs/abd_or_acd.delta     "abd_or_acd.delta"
[5]: https://raw.githubusercontent.com/toshihirohayashi/olcAssembler/master/testdata/contigs/abd_or_acd.fa  "abd_or_acd.fa"
[6]: https://raw.githubusercontent.com/toshihirohayashi/olcAssembler/master/testdata/assemblies/assembly_abd_or_acd.fa "assembly_abd_or_acd.fa"


###3. repeat
<div align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/2/29/%E3%82%AD%E3%83%A3%E3%83%97%E3%83%81%E3%83%A33.PNG" width="630" height="252" />
</div>
<div align="center">
<b>Figure3. Assembly of contigs with repeat.</b>   
</div>
<br>

This is the situation in which an overlap graph of a genome contain two-copy repeat (fig3). There are two possible paths to traverse this graph (A-B-D or A-B-C-B-D). Besides, assembling these contigs arouse one problem: the tail of C can have an overlap with that of A. If I let this happen, contig A and C start having an edge in the graph and it doesn’t make any sense in this context. Therefore I added “-c” feature to avoid the overlap between two tails (see explanation above). 

**olcAssembler** **-i** [abcbd.delta][7] **-f** [abcbd.fa][8] **-o** [assembly_abcbd.fa][9]  **-c** ON

You can find these two paths in the output file. Thus I concluded that this program is capable of assembling contigs in all possible situations.

[7]: https://raw.githubusercontent.com/toshihirohayashi/olcAssembler/master/testdata/contigs/abcbd.delta     "abcbd.delta"
[8]: https://raw.githubusercontent.com/toshihirohayashi/olcAssembler/master/testdata/contigs/abcbd.fa "abcbd.fa"
[9]: https://raw.githubusercontent.com/toshihirohayashi/olcAssembler/master/testdata/assemblies/assembly_abcbd.fa "assembly_abcbd.fa"

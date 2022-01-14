# synteny_plot_tutorial

This tutorial is meant for members of the Kimball Lab at the University of Minnesota (Northern Wild Rice Conservation and Breeding) to understand how I made synteny plots using MCscan. The original tutorial by the author (Haibao Tang) can be found [here](https://github.com/tanghaibao/jcvi/wiki/MCscan-%28Python-version%29). This is an excellent resource (and is where I learned how to use the program). The tutorial given here is more focused on the needs of our program.

## _Zizania palustris_ vs. _Oryza sativa_
The last line of the script called [run_jcvi.sh](run_jcvi.sh) is what ultimately generates the figure. Note that [`seqids`](helper_files/seqids) and [`layout`](helper_files/layout) refer to files that provide vital information for how the figure appears.
```bash
python -m jcvi.graphics.karyotype seqids layout --format png
```

## _Zizania palustris_ vs. _Zizania latifolia_
Pay special attention to the seqids file because it is different than the one used in the comparison with _O. sativa_ owing the the fact that _Z. latifolia_ genome has a different number of chromosomes than _O. sativa_ and the first version of the _Z. latifolia_ genome is more fragmented than the _Z. palustris_ genome. That is, there are more scaffolds than chromosomes/pseudochromosomes. Look at the [seqids_latifolia](helper_files/seqids_latifolia) file to see what I mean. This is why there are two tracks for _Z. latifolia_: one above the _Z. palustris_ track and the other below it. **Note:** When I ran this in my MSI account, the file was just called `seqids` but I renamed it here to avoid a file duplication conflict with the version used in the comparison with _O. sativa_.

## Microsynteny
In some cases, you may want to look at a specific region more closely, such as the one surrounding the _shattering4_ (_sh4_) gene.

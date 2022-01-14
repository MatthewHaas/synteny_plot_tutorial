# synteny_plot_tutorial

This tutorial is meant for members of the Kimball Lab at the University of Minnesota (Northern Wild Rice Conservation and Breeding) to understand how I made synteny plots using MCscan. The original tutorial by the author (Haibao Tang) can be found [here](https://github.com/tanghaibao/jcvi/wiki/MCscan-%28Python-version%29). This is an excellent resource (and is where I learned how to use the program). The tutorial given here is more focused on the needs of our program.

The last line of the script called [run_jcvi.sh](run_jcvi.sh) is what ultimately generates the figure. Note that [`seqids`](helper_files/seqids) and [`layout`](helper_files/layout) refer to files that provide vital information for how the figure appears.
```bash
python -m jcvi.graphics.karyotype seqids layout --format png
```

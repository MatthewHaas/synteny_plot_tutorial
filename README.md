# synteny plot tutorial

This tutorial is meant for members of the [Kimball Lab](https://wildricebreedingandgenetics.umn.edu/) at the University of Minnesota (Northern Wild Rice Conservation and Breeding) to understand how I made synteny plots using MCscan. The original tutorial by the author (Haibao Tang) can be found [here](https://github.com/tanghaibao/jcvi/wiki/MCscan-%28Python-version%29). This is an excellent resource (and is where I learned how to use the program). The tutorial given here is more focused on the needs of our program.

## _Zizania palustris_ vs. _Oryza sativa_
The last line of the script called [run_jcvi.sh](run_jcvi.sh) is what ultimately generates the figure. Note that [`seqids`](helper_files/seqids) and [`layout`](helper_files/layout) refer to files that provide vital information for how the figure appears.
```bash
python -m jcvi.graphics.karyotype seqids layout --format png
```
Here are some details about the [`layout`](helper_files/layout) file specifications:
- ![#4b0082](https://via.placeholder.com/15/4b0082/000000?text=+) `#4b0082` is for _Zizania palustris_
- ![#ff7f00](https://via.placeholder.com/15/ff7f00/000000?text=+) `#ff7f00` is for _Oryza sativa_

**Note:** As of this writing (14 January 2022), GitHub does not support colorizing text using HTML or other various methods that I found to insert color. The method that finally worked was to use [placeholder.com](https://placeholder.com). If previews of the color are unavaible, I apologize for that but the reason is likely a broken link. It's a minor thing, but feel free to report it to me if you encounter that issue.

When you're done, the finished figure should look like this:<br>
<img src="images/Figure_1C_whitespace_cropped.png" width=700>

## _Zizania palustris_ vs. _Zizania latifolia_
Pay special attention to the seqids file because it is different than the one used in the comparison with _O. sativa_ owing the the fact that _Z. latifolia_ genome has a different number of chromosomes than _O. sativa_ and the first version of the _Z. latifolia_ genome is more fragmented than the _Z. palustris_ genome. That is, there are more scaffolds than chromosomes/pseudochromosomes. Look at the [seqids_latifolia](helper_files/seqids_latifolia) file to see what I mean. This is why there are two tracks for _Z. latifolia_: one above the _Z. palustris_ track and the other below it. **Note:** When I ran this in my MSI account, the file was just called `seqids` but I renamed it here to avoid a file duplication conflict with the version used in the comparison with _O. sativa_. The same principle is true for the [layout_latifolia](helper_files/layout_latifolia) file.

Colors are specified in the `layout` file. We chose our color scheme after seeking consensus within the group on colors we liked and to be internally consistent. That means we use the same color for the same species across multiple figures within the same paper.<br>
- ![#235e39](https://via.placeholder.com/15/235e39/000000?text=+) `#235e39` is for _Zizania latifolia_
- ![#4b0082](https://via.placeholder.com/15/4b0082/000000?text=+) `#4b0082` is for _Zizania palustris_

When you're done, the finished figure should look like this:<br>
<img src="images/Figure_1F_whitespace_cropped.png" width=700>

## Microsynteny
In some cases, you may want to look at a specific region more closely, such as the one surrounding the _shattering4_ (_sh4_) gene.

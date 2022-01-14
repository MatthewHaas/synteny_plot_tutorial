#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --time=6:00:00
#SBATCH --mem=30g
#SBATCH --mail-type=ALL
#SBATCH --mail-user=haasx092@umn.edu
#SBATCH -p amdsmall
#SBATCH --account=jkimball
#SBATCH -o run_jcvi.out
#SBATCH -e run_jcvi.err

cd /home/jkimball/haasx092/synteny_figure

export PATH=$PATH:/home/jkimball/haasx092/synteny_figure/last-1060/src
export PATH=$PATH:/home/jkimball/haasx092/synteny_figure/install-tl-20200505/1/bin/x86_64-linux

module load python

python -m jcvi.formats.gff bed rice.gene_structures_post_PASA_updates.21917.gff3 -o wild_rice.bed
python -m jcvi.formats.gff bed Osativa_323_v7.0.gene.gff3.gz -o oryza.bed

python -m jcvi.formats.fasta format rice.gene_structures_post_PASA_updates.nucleotides.fsa wild_rice.cds
python -m jcvi.formats.fasta format Osativa_323_v7.0.cds.fa.gz oryza.cds

sed -i  's/\.MSUv7.0//g' oryza.bed
sed -i  's/\..*$//g' oryza.cds
sed -i 's/\-.*$//g' wild_rice.cds

python -m jcvi.compara.catalog ortholog wild_rice oryza --cscore=1.0 --no_strip_names

python -m jcvi.graphics.dotplot wild_rice.oryza.anchors

python -m jcvi.compara.synteny screen --minspan=30 --simple wild_rice.oryza.anchors wild_rice.oryza.anchors.new

python -m jcvi.graphics.karyotype seqids layout --format png

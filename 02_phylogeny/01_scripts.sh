
scp -r lh106@nots.rice.edu:/scratch/lh106/Dog_Selection/Relate/input_final_Apr29_dogs/scripts/samplelist_DOGS_final.txt ~/Desktop

/scratch/lh106/Dog_Selection/Relate/input_final_Apr29_dogs/scripts/samplelist_DOGS_final.txt


mamba create -n buscogeny -c bioconda -c conda-forge busco

conda activate buscogeny

mamba install -c bioconda -c conda-forge \
    biopython pandas numpy mafft iqtree clipkit \
    matplotlib plotly maskrc-svg clonalframeml
    
pip install alive-progress

cd /storage/hpc/work/lh106/BlackBackedJackals/Buscogeny
python buscogeny.py --help

# Works 

#!/bin/bash
#SBATCH --job-name=guamrail
#SBATCH --account=commons
#SBATCH --partition=long
#SBATCH --ntasks=1
#SBATCH --mem=50G
#SBATCH --time=2-23:00:00
#SBATCH --output=/home/lh106/Rice/Dog_Selection/slurmout/guamrailtree.out
#SBATCH --error=/home/lh106/Rice/Dog_Selection/slurmout/guamrailtree.err


# Activate environment
conda activate buscogeny

# Run Buscogeny
python /scratch/lh106/software/Buscogeny/buscogeny.py  -i /scratch/lh106/GuamRail/genomeassemblies/  -d /scratch/lh106/GuamRail/odb10_dataset_2/aves_odb10   -o /scratch/lh106/GuamRail/output 

/scratch/lh106/bin/iqtree-3.1.1-Linux-intel/bin/iqtree3 -s /scratch/lh106/GuamRail/output_Apr29_Buscogeny_out/supermatrix/superaln.degapped.fasta -B 1000 --prefix /scratch/lh106/GuamRail/output_Apr29_Buscogeny_out/iqtree/iqtree

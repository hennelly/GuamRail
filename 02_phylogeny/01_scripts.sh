

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
#SBATCH --partition=commons
#SBATCH --ntasks=1
#SBATCH --mem=30G
#SBATCH --time=14:00:00
#SBATCH --output=/home/lh106/Rice/Dog_Selection/slurmout/guamrail.out
#SBATCH --error=/home/lh106/Rice/Dog_Selection/slurmout/guamrail.err


# Activate environment
conda activate buscogeny

# Run Buscogeny
python /scratch/lh106/software/Buscogeny/buscogeny.py  -i /scratch/lh106/GuamRail/genomeassemblies/  -d /scratch/lh106/GuamRail/odb10_dataset_2/aves_odb10   -o /scratch/lh106/GuamRail/output 


#!/bin/bash
#SBATCH --job-name=bHypOws1_busco
#SBATCH --account=commons
#SBATCH --partition=long
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=120G
#SBATCH --time=12:00:00
#SBATCH --output=/home/lh106/Rice/Dog_Selection/slurmout/bHypOws1.out
#SBATCH --error=/home/lh106/Rice/Dog_Selection/slurmout/bHypOws1.err

source activate buscogeny
export _JAVA_OPTIONS="-Xmx60g"

busco \
  -i /scratch/lh106/GuamRail/genomeassemblies/bHypOws1_hifiasm.bp.p_ctg.fasta.gz \
  -l /scratch/lh106/GuamRail/odb10_dataset_2/aves_odb10 \
  -o bHypOws1_hifiasm.bp.p_ctg.fasta.gz_busco_out \
  --out_path /scratch/lh106/GuamRail/ \
  -m genome \
  --cpu 8 \
  -f

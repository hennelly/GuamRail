

mamba create -n buscogeny -c bioconda -c conda-forge busco

conda activate buscogeny

mamba install -c bioconda -c conda-forge \
    biopython pandas numpy mafft iqtree clipkit \
    matplotlib plotly maskrc-svg clonalframeml
pip install alive-progress



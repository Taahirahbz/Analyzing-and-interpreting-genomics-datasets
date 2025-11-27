#!/usr/bin/env bash
set -e

echo "==== Installing Nextflow ===="
curl -s https://get.nextflow.io | bash
sudo mv nextflow /usr/local/bin/

echo "==== Installing basic bioinformatics tools ===="
mamba install -y -c bioconda -c conda-forge \
  samtools fastqc seqkit

echo "==== DONE ===="

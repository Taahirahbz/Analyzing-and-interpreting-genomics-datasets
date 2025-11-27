#!/usr/bin/env bash
set -e

echo "🔧 Installing Nextflow..."
curl -s https://get.nextflow.io | bash
sudo mv nextflow /usr/local/bin/
nextflow -version

echo "🔧 Updating Mamba..."
mamba update -n base -c conda-forge mamba -y

echo "🔧 Installing common bioinformatics dependencies..."
mamba install -y -c bioconda -c conda-forge \
  samtools \
  bwa \
  fastqc \
  seqkit

echo "✔ Setup complete."

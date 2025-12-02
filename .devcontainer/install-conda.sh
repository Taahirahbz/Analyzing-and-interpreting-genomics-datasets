#!/usr/bin/env bash
set -e

echo ">>> Installing Miniconda..."

if [ ! -d "$HOME/miniconda3" ]; then
    curl -sLo ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash ~/miniconda.sh -b -p $HOME/miniconda3
    rm ~/miniconda.sh

    echo ". $HOME/miniconda3/etc/profile.d/conda.sh" >> ~/.bashrc
else
    echo "Miniconda already installed."
fi

# make conda available right now without reopening terminal
source $HOME/miniconda3/etc/profile.d/conda.sh

echo ">>> Creating environment: nf (Python 3.11)"
if ! conda env list | grep -q "nf"; then
    conda create -n nf python=3.11 -y
fi

echo ">>> Installing Nextflow..."
curl -s https://get.nextflow.io | bash
mv nextflow $HOME/.local/bin/

echo ">>> Environment ready!"

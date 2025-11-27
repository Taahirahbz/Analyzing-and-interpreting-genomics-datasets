# Base Ubuntu image used by Codespaces
FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget curl git-lfs unzip \
    openjdk-17-jre-headless \
    && git-lfs install

# Install Mambaforge (Conda)
RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh -O mamba.sh \
    && bash mamba.sh -b -p /opt/mambaforge \
    && rm mamba.sh \
    && ln -s /opt/mambaforge/bin/mamba /usr/local/bin/mamba \
    && ln -s /opt/mambaforge/bin/conda /usr/local/bin/conda

# Install Nextflow
RUN curl -s https://get.nextflow.io | bash \
    && mv nextflow /usr/local/bin/nextflow

# Install small bioinformatics utilities
RUN /opt/mambaforge/bin/mamba install -y -c bioconda -c conda-forge \
      samtools fastqc seqkit \
    && /opt/mambaforge/bin/conda clean -afy

# Set PATH for conda
ENV PATH="/opt/mambaforge/bin:${PATH}"

# Base image with Conda (Mambaforge)
FROM condaforge/mambaforge:latest

# Set working directory
WORKDIR /workspace

# Install required system packages including Java
RUN apt-get update && \
    apt-get install -y curl git openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

# Install Nextflow globally
RUN curl -s https://get.nextflow.io -o /tmp/nextflow && \
    chmod +x /tmp/nextflow && \
    mv /tmp/nextflow /usr/local/bin/nextflow

# Create Conda environment 'nf' with Python 3.11
RUN conda create -n nf python=3.11 -y && \
    conda clean --all -y

# Activate 'nf' environment by default
RUN echo "conda activate nf" >> ~/.bashrc

# Use bash as default shell
SHELL ["/bin/bash", "-c"]

# Install Java
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

# Install Nextflow
RUN curl -s https://get.nextflow.io -o /tmp/nextflow && \
    chmod +x /tmp/nextflow && \
    mv /tmp/nextflow /usr/local/bin/nextflow

# Base image with Mambaforge (full Conda environment)
FROM condaforge/mambaforge:latest

# Set working directory
WORKDIR /workspace

# Install required system packages
RUN apt-get update && \
    apt-get install -y curl git && \
    rm -rf /var/lib/apt/lists/*

# Install Nextflow globally
RUN curl -s https://get.nextflow.io -o /tmp/nextflow && \
    chmod +x /tmp/nextflow && \
    mv /tmp/nextflow /usr/local/bin/nextflow

# Create a Conda environment named 'nf' with Python 3.11
RUN conda create -n nf python=3.11 -y && \
    conda clean --all -y

# Make 'nf' environment available by default in new terminals
RUN echo "conda activate nf" >> ~/.bashrc

# Set default shell
SHELL ["/bin/bash", "-c"]

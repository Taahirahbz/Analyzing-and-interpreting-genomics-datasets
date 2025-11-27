# Base image with Conda (Mambaforge)
FROM condaforge/mambaforge:latest

# Set working directory
WORKDIR /workspace

# Install required packages first
RUN apt-get update && \
    apt-get install -y curl git && \
    rm -rf /var/lib/apt/lists/*

# Download and install Nextflow separately
RUN curl -s https://get.nextflow.io -o /tmp/nextflow && \
    chmod +x /tmp/nextflow && \
    mv /tmp/nextflow /usr/local/bin/nextflow

# Default shell
SHELL ["/bin/bash", "-c"]

# Activate Conda base environment automatically
RUN echo "conda activate base" >> ~/.bashrc

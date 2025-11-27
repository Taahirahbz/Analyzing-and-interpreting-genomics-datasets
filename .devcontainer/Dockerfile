# Base image with Conda (Mambaforge)
FROM condaforge/mambaforge:latest

# Set working directory in Codespaces
WORKDIR /workspace

# Install Nextflow globally
RUN apt-get update && \
    apt-get install -y curl git && \
    curl -s https://get.nextflow.io | bash && \
    mv nextflow /usr/local/bin/ && \
    chmod +x /usr/local/bin/nextflow && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Default shell
SHELL ["/bin/bash", "-c"]

# Optional: activate base environment by default
RUN echo "conda activate base" >> ~/.bashrc

FROM mambaorg/micromamba:latest

USER root
RUN apt-get update && apt-get install -y curl git openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

# Install Nextflow
RUN curl -s https://get.nextflow.io -o /tmp/nextflow && \
    chmod +x /tmp/nextflow && mv /tmp/nextflow /usr/local/bin/nextflow

# Create env
RUN micromamba create -n nf python=3.11 -y

# Set env as default
ENV MAMBA_DOCKERFILE_ACTIVATE=1
ENV CONDA_DEFAULT_ENV=nf

WORKDIR /workspace

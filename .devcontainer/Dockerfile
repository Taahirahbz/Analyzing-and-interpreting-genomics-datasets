# Use Ubuntu + micromamba (fast Conda replacement)
FROM mambaorg/micromamba:1.5.8-ubuntu22.04

# Set working directory
WORKDIR /workspace

# Add standard Codespaces user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

USER root

# Install system tools + Java 17
RUN apt-get update && \
    apt-get install -y curl git openjdk-17-jdk-headless && \
    rm -rf /var/lib/apt/lists/*

# Install Nextflow globally
RUN curl -s https://get.nextflow.io -o /usr/local/bin/nextflow && \
    chmod +x /usr/local/bin/nextflow

# Create Python 3.11 environment using micromamba
RUN micromamba create -n nf python=3.11 -y && \
    micromamba clean --all -y

# Activate environment for vscode user
RUN echo "source /opt/conda/etc/profile.d/conda.sh && conda activate nf" >> /home/vscode/.bashrc \
    && chown vscode:vscode /home/vscode/.bashrc

# Switch to vscode user
USER vscode

# Set default shell
SHELL ["/bin/bash", "-c"]

# Use official Ubuntu Dev Container base
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Set working directory
WORKDIR /workspace

# Add standard Codespaces user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

USER root

# Install system tools + Java 17 + curl/git
RUN apt-get update && \
    apt-get install -y curl git openjdk-17-jdk-headless && \
    rm -rf /var/lib/apt/lists/*

# Install Miniconda (faster than full Conda image)
RUN curl -sLo ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

# Ensure conda is on PATH
ENV PATH="/opt/conda/bin:$PATH"

# Create Python 3.11 environment
RUN conda create -n nf python=3.11 -y && conda clean --all -y

# Install Nextflow globally
RUN curl -s https://get.nextflow.io -o /usr/local/bin/nextflow && \
    chmod +x /usr/local/bin/nextflow

# Activate conda environment for vscode user
RUN echo "source /opt/conda/etc/profile.d/conda.sh && conda activate nf" >> /home/vscode/.bashrc \
    && chown vscode:vscode /home/vscode/.bashrc

USER vscode
SHELL ["/bin/bash", "-c"]

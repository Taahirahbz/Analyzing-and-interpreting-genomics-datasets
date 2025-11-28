# Base image with Conda (Mambaforge)
FROM condaforge/mambaforge:latest

# Add vscode user (Codespaces standard)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# Ensure Conda is on PATH
ENV PATH="/opt/conda/bin:${PATH}"

WORKDIR /workspace

# Install system tools + Java
RUN apt-get update && \
    apt-get install -y curl git openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

# Install Nextflow
RUN curl -s https://get.nextflow.io -o /tmp/nextflow && \
    chmod +x /tmp/nextflow && \
    mv /tmp/nextflow /usr/local/bin/nextflow

# Create conda environment
RUN conda create -n nf python=3.11 -y && \
    conda clean --all -y

# Activate environment for vscode user
RUN echo "source /opt/conda/etc/profile.d/conda.sh && conda activate nf" >> /home/vscode/.bashrc \
    && chown vscode:vscode /home/vscode/.bashrc

# Set default shell
SHELL ["/bin/bash", "-c"]

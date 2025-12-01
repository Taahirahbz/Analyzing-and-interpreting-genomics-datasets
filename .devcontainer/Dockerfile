# Install Miniconda
RUN curl -sLo ~/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

# Ensure conda is on PATH
ENV PATH="/opt/conda/bin:$PATH"

# >>> FIXED SECTION <<<
# Create Python 3.11 environment (must source conda.sh)
RUN bash -c "source /opt/conda/etc/profile.d/conda.sh && conda create -n nf python=3.11 -y" \
    && conda clean --all -y
# >>> END FIX <<<

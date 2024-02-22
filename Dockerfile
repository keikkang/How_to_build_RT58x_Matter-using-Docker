FROM ubuntu:22.04

# Install Essential for Matter package
# Target Vendor: Rafael Micro

RUN apt-get update && apt-get install -y \
    git \ 
    gcc \
    g++ \
    pkg-config \
    libssl-dev \
    libdbus-1-dev \
    libglib2.0-dev \
    libavahi-client-dev \
    ninja-build \
    python3-venv \
    python3-dev \
    python3-pip \
    unzip \
    libgirepository1.0-dev \
    libcairo2-dev \
    libreadline-dev && \
    git clone --recurse-submodules https://github.com/RafaelMicro/matter_sdk.git && \
    cd matter_sdk && \
    git submodule update --init && \
    bash -c "source scripts/activate.sh"

# Set environment variables
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

# Create user build1 and switch to it
RUN useradd -ms /bin/bash build1
USER build1
WORKDIR /home/build1

# Set the default command to execute
# when creating a new container
CMD ["/bin/bash"]

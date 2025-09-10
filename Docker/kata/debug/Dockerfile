# Start from Ubuntu 22.04 (slimmer than 20.04 but still common)
FROM ubuntu:22.04

# Prevent interactive prompts during apt operations
ENV DEBIAN_FRONTEND=noninteractive

# Update and install some common debug tools
RUN apt-get update && apt-get install -y \
    curl wget vim net-tools iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Set the default command to start an interactive bash shell
CMD ["/bin/bash"]


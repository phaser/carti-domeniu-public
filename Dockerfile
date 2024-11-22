# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    xz-utils \
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-latex-recommended \
    texlive-latex-extra \
    pandoc \
    calibre && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install additional Python packages if needed
RUN pip install --no-cache-dir ebook-convert
ADD generate.sh /

# Set the working directory
WORKDIR /data

# Command to keep the container running
CMD ["/generate.sh"]
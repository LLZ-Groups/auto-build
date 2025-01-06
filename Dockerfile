FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        wget \
        unzip \
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/lh3/bwa/archive/refs/tags/v0.7.17.zip -O bwa.zip && \
    unzip bwa.zip && \
    cd bwa-0.7.17 && \
    make && \
    mv bwa /usr/local/bin/ && \
    cd .. && \
    rm -rf bwa-0.7.17 bwa.zip
    
WORKDIR /data

CMD ["bwa"]
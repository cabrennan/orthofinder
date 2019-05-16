

####Orthofinder current version on ubuntu image

## Ubuntu cosmic
FROM ubuntu:18.10
ARG DEBIAN_FRONTEND=noninteractive
MAINTAINER christinebrennan@whitney.ufl.edu


## Updates

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y git build-essential libreadline-dev wget vim cpanminus python3 python3-pip git
RUN cpanm URI::Escape
RUN apt-get install -y hmmer
RUN apt-get install -y mcl
RUN apt-get install -y ncbi-blast+
ADD include/fastme-2.1.5-linux64 /usr/bin/fastme

RUN wget https://github.com/soedinglab/MMseqs2/releases/download/3-be8f6/MMseqs2-Linux-AVX2.tar.gz \ 
&& tar xzf MMseqs2-Linux-AVX2.tar.gz && cp mmseqs2/bin/mmseqs /usr/local/bin

RUN wget https://github.com/bbuchfink/diamond/releases/download/v0.9.22/diamond-linux64.tar.gz \
&& tar xzf diamond-linux64.tar.gz && cp diamond /usr/local/bin

RUN wget https://github.com/davidemms/OrthoFinder/releases/download/2.3.3/OrthoFinder-2.3.3.tar.gz \
&& tar xzf OrthoFinder-2.3.3.tar.gz  && ln -s /OrthoFinder-2.3.3/orthofinder /usr/local/bin

RUN wget https://mafft.cbrc.jp/alignment/software/mafft_7.427-1_amd64.deb \
&& dpkg -i mafft_7.427-1_amd64.deb

RUN wget https://github.com/TransDecoder/TransDecoder/archive/TransDecoder-v5.5.0.tar.gz \
&& tar xaf TransDecoder-v5.5.0.tar.gz 

### Add RAxML 
RUN git clone https://github.com/stamatak/standard-RAxML.git
WORKDIR standard-RAxML
RUN make -f Makefile.gcc
RUN rm -rf *.o Windows* 
RUN chmod 755 /standard-RAxML/usefulScripts/*.pl
RUN ln -s /standard-RAxML/usefulScripts/*.pl /usr/local/bin
RUN ln -s /standard-RAxML/raxmlHPC /usr/local/bin



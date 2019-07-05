

####Orthofinder current version on ubuntu image

## Ubuntu cosmic
FROM ubuntu:18.10
ARG DEBIAN_FRONTEND=noninteractive
MAINTAINER christinebrennan@whitney.ufl.edu

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y git build-essential libreadline-dev wget vim cpanminus \
python3 python3-pip git cmake
ENV PACKAGES make gcc g++ unzip python-pip python-dev libatlas-base-dev gfortran
RUN apt-get update -y
RUN apt-get install -y ${PACKAGES}

RUN cpanm URI::Escape
RUN apt-get install -y hmmer
RUN apt-get install -y mcl
RUN apt-get install -y ncbi-blast+
RUN pip install numpy
RUN pip install scipy
ADD include/fastme-2.1.5-linux64 /usr/local/bin/fastme
ADD include/*.pl /usr/local/bin/
ADD include/*sh /usr/local/bin/


WORKDIR /usr/local/src
RUN wget -P /usr/local/bin http://www.microbesonline.org/fasttree/FastTree && \
  chmod a+x /usr/local/bin/FastTree


RUN wget https://github.com/soedinglab/MMseqs2/releases/download/3-be8f6/MMseqs2-Linux-AVX2.tar.gz \ 
&& tar xzf MMseqs2-Linux-AVX2.tar.gz \
&& ln -s /usr/local/src/mmseqs2/bin/mmseqs /usr/local/bin

RUN mkdir diamond
WORKDIR diamond
RUN wget https://github.com/bbuchfink/diamond/releases/download/v0.9.22/diamond-linux64.tar.gz \
&& tar xzf diamond-linux64.tar.gz \
&& ln -s /usr/local/src/diamond/diamond /usr/local/bin

WORKDIR /usr/local/src
RUN wget https://github.com/davidemms/OrthoFinder/releases/download/2.3.3/OrthoFinder-2.3.3.tar.gz \
&& tar xzf OrthoFinder-2.3.3.tar.gz \
&& ln -s /usr/local/src/OrthoFinder-2.3.3/orthofinder /usr/local/bin

RUN wget https://mafft.cbrc.jp/alignment/software/mafft_7.427-1_amd64.deb \
&& dpkg -i mafft_7.427-1_amd64.deb

RUN wget https://github.com/TransDecoder/TransDecoder/archive/TransDecoder-v5.5.0.tar.gz \
&& tar xzf TransDecoder-v5.5.0.tar.gz \
&& ln -s /usr/local/src/TransDecoder-TransDecoder-v5.5.0/TransDecoder.LongOrfs /usr/local/bin \
&& ln -s /usr/local/src/TransDecoder-TransDecoder-v5.5.0/TransDecoder.Predict /usr/local/bin 

### Add RAxML 
RUN git clone https://github.com/stamatak/standard-RAxML.git
WORKDIR standard-RAxML
RUN make -f Makefile.gcc
RUN rm -rf *.o Windows* 
RUN chmod 755 /usr/local/src/standard-RAxML/usefulScripts/*.pl
RUN ln -s /usr/local/src/standard-RAxML/usefulScripts/*.pl /usr/local/bin
RUN ln -s /usr/local/src/standard-RAxML/raxmlHPC /usr/local/bin

### Add pal2nal.pl
WORKDIR /usr/local/src
RUN wget http://www.bork.embl.de/pal2nal/distribution/pal2nal.v14.tar.gz \
&& tar xzf pal2nal.v14.tar.gz && ln -s /usr/local/src/pal2nal.v14/pal2nal.pl /usr/local/bin

### Add HyPhy
RUN git clone https://github.com/veg/hyphy.git
WORKDIR hyphy
RUN cmake . && make && make install

WORKDIR /usr/local/src
### Clean up
RUN rm MMseqs2-Linux-AVX2.tar.gz  TransDecoder-v5.5.0.tar.gz  pal2nal.v14.tar.gz \
OrthoFinder-2.3.3.tar.gz mafft_7.427-1_amd64.deb diamond/diamond-linux64.tar.gz 

WORKDIR /root








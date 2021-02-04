FROM nfcore/base:1.12.1
LABEL authors="Barry Digby" \
      description="python 3 container for nf-core/circrna"

WORKDIR ./
COPY environment.yml ./
RUN conda env create -f week1.yml && conda clean -a
ENV PATH /opt/conda/envs/week1/bin:$PATH

#DCC
WORKDIR /usr/src/app
RUN wget --no-check-certificate https://github.com/dieterich-lab/DCC/archive/v0.4.8.tar.gz
RUN tar -xvf v0.4.8.tar.gz
WORKDIR /usr/src/app/DCC-0.4.8
# remove --user or else scripts installed to /root/
RUN python setup.py install

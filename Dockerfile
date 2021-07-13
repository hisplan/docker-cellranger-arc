FROM centos:7

LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)"

ENV CELLRANGER_ARC_VERSION 1.0.1

ENV PATH /opt/cellranger-arc-${CELLRANGER_ARC_VERSION}:$PATH

RUN yum update -y && yum groups install "Development Tools" -y \
    && yum install -y which

# https://support.10xgenomics.com/single-cell-multiome-atac-gex/software/downloads/1.0
# cell ranger arc binaries
RUN curl -o cellranger-arc-1.0.1.tar.gz "https://cf.10xgenomics.com/releases/cell-arc/cellranger-arc-1.0.1.tar.gz?Expires=1626187084&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1hcmMvY2VsbHJhbmdlci1hcmMtMS4wLjEudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNjI2MTg3MDg0fX19XX0_&Signature=OtILJaLKQ5dF3bbB9Scwpspv3yB0yUxpofMwnOqi1IJjXBa8WU56TXJhdhZSLY2sR0bx7~Oc4~6R2wBG0lvrmCho322-OOPQkzfFYcvUtrOMcN8TLt3IKTD868h6CySrf4BSBFvCL~-66Fb0ztMB3Z5EuwGcRBDRzvnxQH8aM8oh7GjyLll~AfeJMISwWUEWfoHMcXBQASSkWP4qp609zzmirecDKEtjuvZYp5HbJvOFObEDqi9Cabpz8A5VEenop0aEuv~OOCb3qk4bh1hqaN4nx6kfcZLHav83aJm4JVo3C39SAU-cl9YGn4ow-T8vW7wfiaAbX3swBk5QB~Qjaw__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA" \
    && tar xzf cellranger-arc-${CELLRANGER_ARC_VERSION}.tar.gz \
    && rm -rf cellranger-arc-${CELLRANGER_ARC_VERSION}.tar.gz \
    && mv cellranger-arc-${CELLRANGER_ARC_VERSION} /opt/

WORKDIR /opt

ENTRYPOINT [ "cellranger-arc" ]
CMD [ "--help"]

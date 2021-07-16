FROM centos:7

LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)"

ARG CELLRANGER_ARC_VERSION
ARG DOWNLOAD_URL
ENV PATH /opt/cellranger-arc-${CELLRANGER_ARC_VERSION}:$PATH

RUN yum update -y && yum groups install "Development Tools" -y \
    && yum install -y which

RUN curl -o cellranger-arc-${CELLRANGER_ARC_VERSION}.tar.gz ${DOWNLOAD_URL} \
    && tar xzf cellranger-arc-${CELLRANGER_ARC_VERSION}.tar.gz \
    && rm -rf cellranger-arc-${CELLRANGER_ARC_VERSION}.tar.gz \
    && mv cellranger-arc-${CELLRANGER_ARC_VERSION} /opt/

WORKDIR /opt

ENTRYPOINT [ "cellranger-arc" ]
CMD [ "--help"]

FROM centos:7

LABEL maintainer="Jaeyoung Chun (chunj@mskcc.org)"

ENV CELLRANGER_ARC_VERSION 1.0.0

ENV PATH /opt/cellranger-arc-${CELLRANGER_ARC_VERSION}:$PATH

RUN yum update -y && yum groups install "Development Tools" -y \
    && yum install -y which

# https://support.10xgenomics.com/single-cell-multiome-atac-gex/software/downloads/1.0
# cell ranger arc binaries
RUN curl -o cellranger-arc-1.0.0.tar.gz "https://cf.10xgenomics.com/releases/cell-arc/cellranger-arc-1.0.0.tar.gz?Expires=1599999326&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1hcmMvY2VsbHJhbmdlci1hcmMtMS4wLjAudGFyLmd6IiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNTk5OTk5MzI2fX19XX0_&Signature=e6rFz13cXXyCU6Z5PQ4xMNwh~Z8jywv-A7Dxag6Y13bz~8HX9yJx8oAHIzu8CpNkxjzKGfZnsMUfPiO9hqERbtn4Jo5LHnLMvgJw1sXcwQEtrnATXXyd382bv7aVBgMixXb0CtuyN8EBWC1z-4S~YH5miYiB9v17Y8YxfV6bGwa55wcIyZ1~SGBQDghDFssbKqn0dkz4guNBFAhl8zfuqMQSH~BQmHQn0aaTTjjGsw5G6yyNwMmf3uD2c93A8PdI7jRPi4rQB4CydjsBkl0dq3uuKSZtAQjY6XUPW6eLBs-kvSmFrH5OCHmp7Jp1X1lS272-~vyagy~KHGNOngNOww__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA" \
    && tar xzf cellranger-arc-${CELLRANGER_ARC_VERSION}.tar.gz \
    && rm -rf cellranger-arc-${CELLRANGER_ARC_VERSION}.tar.gz \
    && mv cellranger-arc-${CELLRANGER_ARC_VERSION} /opt/

WORKDIR /opt

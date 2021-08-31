# docker-cellranger-arc

Dockerized Cell Ranger ARC v2.0.0

## Build Container Image

SCING (Single-Cell pIpeliNe Garden; pronounced as "sing" /siŋ/) is required for smooth and uninteruppted build process (e.g. CI/CD). For setup, please refer to [this page](https://github.com/hisplan/scing). All the instructions below is given under the assumption that you have already configured SCING in your environment.

[SCING](https://github.com/hisplan/scing) installation is required.

```bash
conda activate scing

./build.sh
```

## Push to Docker Registry

```bash
conda activate scing

./push.sh
```

## Usage

```
$ docker run -it --rm cellranger-arc:2.0.0

cellranger-arc cellranger-arc-2.0.0
Process 10x Genomics Chromium Single Cell Multiome ATAC + Gene Expression data

USAGE:
    cellranger-arc <SUBCOMMAND>

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

SUBCOMMANDS:
    count        Count ATAC and gene expression reads from a single library
    mkfastq      Run bcl2fastq on Single Cell Multiome ATAC + Gene Expression sequencing data
    mkref        Create a cellranger-arc-compatible reference package
    aggr         Aggregate data from multiple `cellranger-arc count` runs
    reanalyze    Re-run secondary analysis (dimensionality reduction, clustering, feature
                 linkage etc.) on a completed `cellranger-arc count` or `cellranger-arc aggr`
                 run
    testrun      Run a tiny cellranger-arc count pipeline to verify software integrity
    mkgtf        Filter a GTF file by attribute prior to creating a 10x reference
    upload       Upload analysis logs to 10x Genomics support
    sitecheck    Collect linux system configuration information
    help         Prints this message or the help of the given subcommand(s)
```

## Handling barcodes

- GEX barcode list: `737K-arc-gex-v1.txt.gz`
- ATAC barcode list: `737K-arc-atac-v1.txt.gz`

The two files have the same number of lines (modulo new lines). The line-by-line correspondence between barcodes in the two files gives you the bijective map between the GEX barcode and ATAC barcode in each gel bead. For instance, the gex barcode on line 34 and the atac barcode on line 34 are part of the same gel bead.

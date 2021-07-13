# Dockerized Cell Ranger ARC v1.0.1

https://support.10xgenomics.com/single-cell-multiome-atac-gex/software/downloads/1.0

## Usage

```
$ docker run -it --rm cellranger-arc:1.0.1

cellranger-arc cellranger-arc-1.0.1
Process 10x Genomics Chromium Single Cell Multiome ATAC + Gene Expression data

USAGE:
    cellranger-arc <SUBCOMMAND>

FLAGS:
    -h, --help       Prints help information
    -V, --version    Prints version information

SUBCOMMANDS:
    count        Count ATAC and gene expression reads from a single sample
    mkref        Create a cellranger-arc-compatible reference package
    mkfastq      Run bcl2fastq on Single Cell Multiome ATAC + Gene Expression sequencing data
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

# staphit2 test data

Minimal real dataset for [`alarawms/staphit2`](https://github.com/alarawms/staphit2) `-profile test`.
Four *Staphylococcus aureus* samples covering every read mode:

| Sample | Mode | Source runs (ENA/SRA) | Expected at test depth |
|---|---|---|---|
| SAMEA114040935 | short | ERR11728906 | ST5, SCCmec negative, spa t458 (t2595 at full depth) |
| SAMEA114860840 | short | ERR12354957 | ST8, SCCmec IV(2B), spa t008 |
| SAMN15567915 | hybrid | SRR12343869 (Illumina) + SRR12343849 (ONT) | ST72, SCCmec negative, spa t901; single 2.75 Mb contig |
| SAMEA117686580 | long | ERR14364924 (ONT) | ST1535, SCCmec V(5C2), spa t084 |

Reads were subsampled with [Rasusa](https://github.com/mbhall88/rasusa) 0.3.0 (seed 42, genome size 2.8 Mb)
to 40x (Illumina) and 20x (ONT); see `subsample.sh`. Total ~250 MB. Checksums: `reads/md5sums.txt`.

`samplesheet.csv` points at the raw GitHub URLs of `reads/`, so it can be passed straight to `--input`.
All reads are public INSDC data; cite the original submitters when reusing them.

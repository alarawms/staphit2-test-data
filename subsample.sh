#!/usr/bin/env bash
# Subsample staphit2 test reads (rasusa 0.3.0, seed 42; short 40x, ONT 20x; genome 2.8 Mb)
set -euo pipefail
D=$(cd "$(dirname "$0")" && pwd); N=/home/alarawms/nfs/SA/new_sa; F=$N/test_modes/fetchngs/fastq
r() { /usr/bin/docker run --rm -u "$(id -u):$(id -g)" -v "$N:$N:ro" -v "$D:$D" -w "$D/reads" \
        quay.io/biocontainers/rasusa:0.3.0--h779adbc_1 rasusa -g 2800000 -s 42 "$@" 2>&1 | tail -1; }
r -c 40 -i $F/ERX11129664_ERR11728906_1.fastq.gz $F/ERX11129664_ERR11728906_2.fastq.gz -o SAMEA114040935_R1.fastq.gz SAMEA114040935_R2.fastq.gz
r -c 40 -i $N/fastq/ERR12354957_1.fastq.gz $N/fastq/ERR12354957_2.fastq.gz -o SAMEA114860840_R1.fastq.gz SAMEA114860840_R2.fastq.gz
r -c 40 -i $F/SRX8843696_SRR12343869_1.fastq.gz $F/SRX8843696_SRR12343869_2.fastq.gz -o SAMN15567915_R1.fastq.gz SAMN15567915_R2.fastq.gz
r -c 20 -i $F/SRX8843716_SRR12343849.fastq.gz -o SAMN15567915_ont.fastq.gz
r -c 20 -i $F/ERX13766329_ERR14364924.fastq.gz -o SAMEA117686580_ont.fastq.gz

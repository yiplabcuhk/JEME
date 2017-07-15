All the input data involved in reconstructing the 935 enhancer-target networks can be downloaded from
https://www.dropbox.com/sh/wjyqyog3p5d33kh/AABUY-OSsV8CQD4TFPRGzp8Na?dl=0 .

After downloading, the files should be placed in the corresponding blank folders included in this package.


###############################################################################
FANTOM5
1) FANTOM5/1_first_step_modeling/1MB_intervals
In this directory, each TSS and all enhancers within 1Mbp from it are represented by two tab-delimited files, identified by an ID for the TSS in the file names.
The first file provides the expression level of the TSS in the different samples.
The second file provides the enhancer RNA level of each enhancer in the different samples, with one enhancer for each row.

For example, for a TSS with ID chrX_99, the TSS file is named "mRNA.final.withHead.rle.chrX.ordered.csv.bed.overlap.chrX_99". This file contains a single line, with the basic information of the TSS in the first column, and the expression of it in the 808 samples in the subsequent columns:
NM_005089$ZRSR2$chrX$15808573$+	0.75065795248215	1.05152798198428	1.04454126121925 ...

Correspondingly, the enhancer file is named "enhancer.final.withHead.chrX.ordered.csv.bed.overlap.chrX_99". This file contains one line for each enhancer within 1Mbp from the TSS, with the information of the enhancer in the first column and its eRNA level in the 808 samples in the subsequent columns:
chrX:15354246-15354416	0.130979075497712	0.103041011647722	0 ...
chrX:15469517-15469528	0	0.103041011647722	0 ...
...

2) FANTOM5/2_second_step_modeling/active
In this directory, each comma-separated file corresponds to one sample and has the following format:
. Each row corresponds to one enhancer-TSS pair, and the rows cover all active enhancers in this sample and all TSSs within 1Mbp from each of them.
. Each row contains five columns, namely i) pair ID, ii) enhancer ID, iii) TSS ID, iv) genomic distance between the enhancer and the TSS, and v) a dummy random class label (for defining the classes, the actual values not really used in training or testing)

For example, for sample 1, the file is named "1.active", and the first line is for one particular enhancer-TSS pair:
chr10:101170653-101170798|NM_001282438$BLOC1S2$chr10$102046135$-,chr10:101170653-101170798,NM_001282438$BLOC1S2$chr10$102046135$-,875410,1

3) FANTOM5/2_second_step_modeling/FANTOM5_scale_sample_specific_each
This directory contains the normalized CAGE signals of enhancer, promoter, and window regions in each sample.

Each window file contains two columns in a comma-separated format, namely pair ID and window signal.
For example, for sample 1, the file is named "window.1.scale.sorted", and the first line provides the CAGE level of the window between an enhancer and a TSS (which happens to be the TSS of two transcripts):
chr10:100019738-100019959|NM_000195$HPS1$chr10$100206704$-%NM_182639$HPS1$chr10$100206704$-,2.61915586810731

Each enhancer file contains two columns in a comma-separated format, namely enhancer ID and enhancer signal.
For example, for sample 1, the file is named "enhancer.1.scale.sorted", and the first line provides the eRNA level of an enhancer:
chr10:100019738-100019959,-0.182913345635979

Each promoter file contains two columns in a comma-separated format, namely TSS ID and promoter signal.
For example, for sample 1, the file is named "promoter.1.scale.sorted", and the first line provides the expression level of a TSS:
NM_000195$HPS1$chr10$100206704$-%NM_182639$HPS1$chr10$100206704$-,-0.49507016828244

4) FANTOM5/2_second_step_modeling/model
This directory contains the model for predicting positive pairs (in Weka model format). The model was trained in the way described in the paper.


###############################################################################
ENCODE+Roadmap

The file formats are essentially the same as in the FANTOM5 case, except that in this case there are four different types of input data (DNase, H3K27ac, H3K27me3 and H3K4me1) instead of one type (CAGE).

1) Roadmap/1_first_step_modeling/1MB_intervals

In this directory, each TSS and all enhancers within 1Mbp from it are represented by two sets of comma-separated files, identified by an ID for the TSS in the file names.
The first set, containing one file, provides the expression level of the TSS in the different samples.
The second set, containing four files, provides the DNase, H3K27ac, H3K27me3 and H3K4me1 levels of each enhancer in the different samples, with one enhancer for each row.

For example, for a TSS with ID chrX_9, the TSS file is named "gene.chrX.chrX_9". This file contains a single line, with the basic information of the TSS in the first column, and the expression of it in the 127 samples in the subsequent columns:
ENSG00000169093.10$ASMTL$chrX$1572655$-,0.08015,0.0687,0.10465...

Correspondingly, the enhancer file for DNase is named "DNase.enhancer_127.head.chrX.ordered.csv.bed.overlap.sort.chrX_9.head". This file contains one line for each enhancer within 1Mbp from the TSS, with the information of the enhancer in the first column and its DNase level in the 127 samples in the subsequent columns:
chrX:1008600-1009000,0.509375,0.498125,0.599375...
chrX:1033400-1033600,3.87375,3.77375,3.27...
...

2) Roadmap/2_second_step_modeling/active
In this directory, each comma-separated file corresponds to one sample and has the following format:
. Each row corresponds to one enhancer-TSS pair, and the rows cover all active enhancers in this sample and all TSSs within 1Mbp from each of them.
. Each row contains five columns, namely i) pair ID, ii) enhancer ID, iii) TSS ID, iv) genomic distance between the enhancer and the TSS, and v) a dummy random class label (for defining the classes, the actual values not really used in training or testing)

For example, for sample 1, the comma-separated file is named "1.active", and the first line is for one particular enhancer-TSS pair:
chr10:100049400-100050000_ENSG00000052749.9$RRP12$chr10$99161127$-,chr10:100049400-100050000,ENSG00000052749.9$RRP12$chr10$99161127$-,888573,0

3) Roadmap/2_second_step_modeling/roadmap_scale_sample_specific_each
This directory contains the normalized feature signals (DNase, H3K27ac, H3K27me3 and H3K4me1) of enhancer, promoter, and window regions in each sample.

Each window file contains five columns, namely pair ID and the four window signals in the above order.
For example, for sample 1, the comma-separated file is named "window.1.scale", and the first line provides the four signal levels of the window between an enhancer and a TSS:
chr10:100036000-100036800_ENSG00000052749.9$RRP12$chr10$99161127$-,-0.0463497122236709,-0.807088749035259,1.72468116765432,-0.592786164851509

Each enhancer file contains five columns, namely enhancer ID and the four enhancer signals in the above order.
For example, for sample 1, the comma-separated file is named "enhancer.1.scale", and the first line provides the four signal levels of an enhancer:
chr10:100036000-100036800,-0.579932929165191,0.14417924530891,0.020621849972547,-0.210608564954706

Each promoter file contains five columns, namely gene ID and the four promoter signals in the above order.
For example, for sample 1, the comma-separated file is named "promoter.1.scale", and the first line provides the expression level of a TSS:
ENSG00000052749.9$RRP12$chr10$99161127$-,-0.540855840750131,-0.989024607269943,-1.71308035883268,-0.806856057221551

4) Roadmap/2_second_step_modeling/model
This directory contains the model for predicting positive pairs (in Weka model format). The model was trained in the way described in the paper.
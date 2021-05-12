#!/usr/bin/Rscript

abi=readLines("abi.txt")

library(sangerseqR)

hetab1 <- read.abif(abi)

str(hetab1, list.len = 20)

homosangerseq <- sangerseq(hetab1)

str(homosangerseq)

Seq1=primarySeq(homosangerseq)

reverseComplement(Seq1)

primarySeq(homosangerseq, string = TRUE)

chromatogram(homosangerseq, width = 50, height = 2, trim5 = 50, trim3 = 100, showcalls = "both",filename = "chromatogram_homo.pdf")

hetcalls <- makeBaseCalls(homosangerseq, ratio = 0.33)

chromatogram(hetcalls, width = 50, height = 2, trim5 = 50, trim3 = 100,showcalls = "both",filename = "chromatogram_hetero.pdf") 


























# main.R


# filter out tags that have cpm <= 1

## ---- pr_1_c
keep <- rowSums(cpm(raw_counts)>1) >= 3
counts <- raw_counts[keep,,keep.lib.sizes=FALSE]


## ---- pr_1_d
counts <- calcNormFactors(counts)
xtable(counts$sample[,c("files", "lib.size")])

## ---- pr_1_e 
male <- factor(c(rep(0,6), rep(1,6)))
polygamous <- factor(c(rep(0,3), rep(1,3), rep(0,3), rep(1,3)))
design <- model.matrix(~male*polygamous)


## ---- pr_1_f
common_disp<- estimateGLMCommonDisp(counts, design)
trended_disp <- estimateGLMTrendedDisp(common_disp,design)
tagwise_disp<- estimateGLMTagwiseDisp(trended_disp, design)
tagwise_disp$tagwise.dispersion[1:5]

## ---- pr_1_g

neg_bin_model <- glmFit(tagwise_disp, design=design)
tests <- glmLRT(neg_bin_model)$table
tests <- tests[order(tests$PValue),]



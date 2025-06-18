#📊 Step 4: Differential Expression Analysis

fit <- lmFit(exprs_data, design)
fit2 <- contrasts.fit(fit, contrast)
fit2 <- eBayes(fit2)

results <- topTable(fit2, adjust = "fdr", number = Inf)

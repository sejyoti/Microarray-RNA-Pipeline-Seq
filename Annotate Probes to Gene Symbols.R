#🧬 Step 5: Annotate Probes to Gene Symbols

results$Symbol <- getSYMBOL(rownames(results), "hgu133plus2.db")
head(results[, c("Symbol", "logFC", "P.Value", "adj.P.Val")])

#🌡 Step 6: Heatmap of Top 50 DEGs
top_genes <- rownames(results)[1:50]
top_exprs <- exprs_data[top_genes, ]
top_exprs_scaled <- t(scale(t(top_exprs)))

# Define group colors
group_colors <- list(Group = c(LuminalA = "#1f78b4", Basal = "#e31a1c"))

# Plot heatmap
pheatmap(
  top_exprs_scaled,
  show_rownames = FALSE,
  annotation_col = data.frame(Group = groups_clean),
  annotation_colors = group_colors,
  main = "Top 50 DEGs: Luminal A vs Basal"
)

#🌋 Step 7: Volcano Plot
results$Significant <- with(results, ifelse(adj.P.Val < 0.05 & abs(logFC) > 1, "Yes", "No"))

ggplot(results, aes(x = logFC, y = -log10(P.Value), color = Significant)) +
  geom_point(alpha = 0.7) +
  scale_color_manual(values = c("No" = "grey", "Yes" = "red")) +
  theme_minimal() +
  labs(title = "Volcano Plot", x = "Log2 Fold Change", y = "-log10(P-value)")


#📉 Step 8: MA Plot
plotMA(fit2, main = "MA Plot", ylim = c(-5, 5))


#💾 Step 9: Save Results
write.csv(results, "DEG_results_GSE.csv", row.names = TRUE)

#install_GO
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
BiocManager::install(c("clusterProfiler", "org.Hs.eg.db", "AnnotationDbi", "enrichplot"))


library(clusterProfiler)
library(org.Hs.eg.db)
library(AnnotationDbi)
library(enrichplot)


# Assuming 'results' is from topTable()
deg_genes <- subset(results, adj.P.Val < 0.05 & abs(logFC) > 1)
gene_symbols <- deg_genes$Symbol


#🔹 Map gene symbols to Entrez IDs
# Remove NA or duplicated symbols
gene_symbols <- na.omit(unique(gene_symbols))

# Convert gene symbols to Entrez IDs
entrez_ids <- mapIds(org.Hs.eg.db,
                     keys = gene_symbols,
                     column = "ENTREZID",
                     keytype = "SYMBOL",
                     multiVals = "first")

# Remove NAs
entrez_ids <- na.omit(entrez_ids)

#✅ Step 3: GO Enrichment Analysis
ego <- enrichGO(
  gene         = entrez_ids,
  OrgDb        = org.Hs.eg.db,
  keyType      = "ENTREZID",
  ont          = "BP",        # Biological Process
  pAdjustMethod = "BH",
  qvalueCutoff = 0.05,
  readable     = TRUE
)


#✅ Step 4: Visualize Results
dotplot(ego, showCategory = 10) + ggtitle("GO Enrichment - Biological Process")

#barplot
barplot(ego, showCategory = 10) + ggtitle("GO Terms - Barplot")



#network plot
cnetplot(ego, showCategory = 5)

#Enrichment-MAP
# Step 1: Calculate term similarity
ego <- pairwise_termsim(ego)

# Step 2: Plot enrichment map
emapplot(ego)




# Enrichment analysis (already done)
ego <- enrichGO(
  gene          = entrez_ids,
  OrgDb         = org.Hs.eg.db,
  keyType       = "ENTREZID",
  ont           = "BP",
  pAdjustMethod = "BH",
  qvalueCutoff  = 0.05,
  readable      = TRUE
)

# Fix: Add similarity matrix
ego <- pairwise_termsim(ego)

# Plot enrichment map
emapplot(ego, showCategory = 20, cex_category = 0.8)

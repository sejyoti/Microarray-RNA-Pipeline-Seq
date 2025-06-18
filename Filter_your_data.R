#🧹 Step 2: Filter for Subtypes (Luminal A vs Basal)

# Load data from GEO
gse <- getGEO("GSE", GSEMatrix = TRUE)
data <- gse[[1]]

# Extract expression and phenotype
exprs_data <- exprs(data)
pheno <- pData(data)


# Extract subtype from phenotype
subtypes <- pheno$characteristics_ch1.1
selected_subtypes <- c("tumor subtype: Luminal A", "tumor subtype: Basal")

# Filter samples
idx <- which(subtypes %in% selected_subtypes)
exprs_data <- exprs_data[, idx]
groups <- factor(subtypes[idx])

# Clean group names
groups_clean <- factor(ifelse(groups == "tumor subtype: Luminal A", "LuminalA", "Basal"))


#📥 Step 1: Download Microarray Data

if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")

BiocManager::install(c("GEOquery", "limma", "affy", "pheatmap", 
                       "hgu133plus2.db", "annotate", "ggplot2"))

# Load libraries
library(GEOquery)
library(limma)
library(pheatmap)
library(ggplot2)
library(hgu133plus2.db)
library(annotate)

#🧹 Step 2: Filter for Subtypes (Luminal A vs Basal)

# Load data from GEO
gse <- getGEO("GSENumber", GSEMatrix = TRUE)
data <- gse[[1]]

# Extract expression and phenotype
exprs_data <- exprs(data)
pheno <- pData(data)

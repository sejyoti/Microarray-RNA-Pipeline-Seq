# Install these only once
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("GEOquery", "limma", "affy", "annotate", "pheatmap", "ggplot2"))

# Core microarray analysis packages
BiocManager::install("GEOquery")
BiocManager::install("affy")
BiocManager::install("limma")
BiocManager::install("annotate")
BiocManager::install("clusterProfiler")

# For plotting heatmaps
#install.packages("pheatmap")  # From CRAN


#📂 Data Source:
 # GEO Dataset: GSE45827

#Platform: Affymetrix Human Genome U133 Plus 2.0 Array

#Samples: Breast cancer patients (Subtypes: Luminal A, Basal-like/TNBC, HER2, etc.)

#✅ You can focus on Luminal A vs. TNBC samples.

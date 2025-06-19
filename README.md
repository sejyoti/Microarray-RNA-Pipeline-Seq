# RNA Pipelines 

# Bioinformatics Pipelines in R

This repository contains two basic pipelines for expression analysis in R:
- 📊 Microarray pipeline using `limma`
- 🧬 Single-cell RNA-seq pipeline using `Seurat`

---

## 📁 Project Structure

microarray-pipeline/
├── data/
│   └── raw/               # Raw CEL or TXT files
├── results/
├── plots/
├── scripts/
│   └── microarray_pipeline.R
└── README.md


scRNAseq-pipeline/
├── data/
│   └── pbmc3k_filtered_feature_bc_matrix/    # Downloaded or from SeuratData
├── results/
├── plots/
├── scripts/
│   └── scRNAseq_pipeline.R
└── README.md

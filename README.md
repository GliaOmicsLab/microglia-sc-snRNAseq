**Welcome!**
---
These scripts guide you through the analysis of single-cell(**scRNA-seq**) and single-nucleus RNA sequencing (**snRNA-seq**) data generated from microglial enrichment experiments using three different isolation protocols: 
**LiveCells**, **LiveNuclei**, and **FixedNuclei**. 

Datasets are publicly available on **Zenodo**.
The main experiment can be explored online via **Nygen portal** ([all cells] (https://scarfweb.nygen.io/eu-central-1/public/q2acwcw8)  and [the subset of microglia] (https://scarfweb.nygen.io/eu-central-1/public/wxvqmskh)).

## Experimental Overview
Enriching microglia from fresh-frozen brain tissue is challenging due to marker degradation and cellular fragility. To overcome these limitations, we developed a novel protocol (**FixedNuclei**)  that selectively enriches PU.1⁺ nuclei (protocol.io):

- **FixedNuclei** - snRNA-seq of nuclei isolated from lightly formaldehyde-fixed tissue and enriched for PU.1+ nuclei, capturing nuclear transcripts only.

Results obtained with the FixedNuclei protocol were compared with two commonly used protocols:
- **LiveCells** - scRNA-seq of papain-dissociated cells enriched for CD11b⁺ populations, capturing both cytoplasmic and nuclear transcripts.
- **LiveNuclei** - snRNA-seq of nuclei isolated from the CD11b⁺ fraction of LiveCells, capturing nuclear transcripts only.

## Sample Collection and Library Preparation
- **Samples** - cortical tissue was collected from **male mice** subjected to permanent MCAO (7 days post-stroke) and controls (sham).
- **Library Preparation** - full-length mRNA sequencing using **Smart-seq3xpress (SS3x)**:
  - **FixedNuclei** - includes thermolabile proteinase K for decrosslinking while preserving RNA integrity.
  - **LiveCells/LiveNuclei** - standard SS3x without proteinase K.
---

## Setting Up the R Project
The following folder structure is recommended:
```
project_name/
├── data/                 # Raw and processed data files
├── ws/                  # Workspace files (RDS, intermediate objects)
└── results/             # Analysis outputs (plots, tables)
```
---

## File Naming Convention
The file naming strategy separates **data processing** and **visualization** tasks for clarity and workflow organization:

- **`OF` — Functions**
  Scripts which contain functions/clours/orders of variables which are consistent across markdown scripts

- **`1DP` — Data Processing**  
  Markdown files focused on data preparation, analysis, and computations (e.g., creating Seurat objects, DEG analysis...).

- **`2V` — Visualization**  
  Markdown files dedicated to generating visualizations and plots (e.g., UMAPs, dot plots, CellChat diagrams...) for result interpretation and presentation.
The numbering indicates the sequential order of steps within each category, ensuring a structured and organized workflow.
---

## Description of markdown scripts 

### Basic data processing in R - quality control, normalisation, integration, dimensional reduction, clustering and annotation
1. **1DP_00_all_cells_raw_data_to_seurat_merged_integrated_UMAP.Rmd** - analysis of all cells obtained in the experiments
2. **1DP_01_mg_cells_raw_data_to_seurat_merged_integrated_UMAP.Rmd** - this analysis specifically targets microglia
3. **1DP_05_all_cells_LC_FN_raw_data_to_seurat_merged_integrated_UMAP.Rmd** - 2nd independent experiment 

### Targeted analysis
4. **1DP_02_DEG.Rmd**
5. **1DP_03_GO.Rmd**
6. **1DP_04_CellChat.Rmd**
---

## Figures in article 
This  guideline outlines the procedure for preparing figures for publication.

**Fig. 1: Comparison of three enrichment protocols for microglia populations** 
- **A** - BioRender
- **B-D** - 2V_00_all_cells_UMAP_dot_plot.Rmd
- **E** - 2V_03_technical_part.Rmd

**Fig. 2: Characterization of microglia subpopulations** 
- **A-E** - 2V_02_mg_cells_UMAP_dot_plot.Rmd

**Fig. 3: Comparison of microglia activation over isolation protocols**
- **A,C** - 2V_04_DEG.Rmd
- **B** - 2V_04_DEG.Rmd + PowerPoint
- **D** - 2V_05_GO.Rmd + PowerPoint

**Fig. 4: Cell–cell communication in microglial subclusters across isolation protocols**
- **A,C** - 2V_06_CellChat.Rmd
- **B** - 2V_06_CellChat.Rmd + PowerPoint

**SFig. 1: Technical parameters for Sham and MCAO condition separately** 
- **A-C** - 2V_03_technical_part.Rmd

**SFig. 2: Gating strategy for sorting across protocols** 
- **A-C** - FlowJo - FACS data

**SFig. 3: Exclusion of cluster** 
- **A-C** - 2V_01_mg_cells_nonstandard_cluster_UMAP_FACS.Rmd
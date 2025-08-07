#For ALL cells

orders[["Cell_types_all_abbr"]] <- c("MG", "PVM", "MON","NEUT", "MUR", "EC", "OL", "AST")

orders[["Cell_types_all_abbr_invert"]] <- c("AST", "OL", "EC", "MUR", "NEUT", "MON", "PVM", "MG")

orders[["Cond_SHAMvsMCAO"]] <- c("Sham", "MCAO")

orders[["LiveCells"]] <- c("Sham", "MCAO", "LiveNuclei + FixedNuclei")

orders[["LiveNuclei"]] <- c("Sham", "MCAO", "LiveCells + FixedNuclei")

orders[["FixedNuclei"]] <- c("Sham", "MCAO", "LiveCells + LiveNuclei")

#--------------------------------------------------------------------------------------------

#For Microglia

orders[["Cell_types_mg_abbr"]] <- c("HM1", "HM2", "INTER", "ARM","IRM", "DIV" )

orders[["Cell_types_mg_abbr_woDIV"]] <- c("HM1", "HM2", "INTER", "ARM","IRM")

orders[["Cell_types_mg_abbr_invert"]] <- c("DIV", "IRM", "ARM", "INTER", "HM2", "HM1")

orders[["Cond_preparation"]] <-  c("LiveCells", "LiveNuclei", "FixedNuclei")

orders[["Cond_publication"]] <- c("LiveCells_Sham", "LiveCells_MCAO", "LiveNuclei_Sham", "LiveNuclei_MCAO", "FixedNuclei_Sham", "FixedNuclei_MCAO")

orders[["Condition_publ_group"]] <- c("LiveCells_Sham", "LiveNuclei_Sham","FixedNuclei_Sham", "LiveCells_MCAO", "LiveNuclei_MCAO", "FixedNuclei_MCAO")

#Validation
orders[["Cond_preparation_val"]] <-  c("LiveCells", "FixedNuclei")

orders[["Cond_publication_val"]] <- c("LiveCells_MCAO", "FixedNuclei_MCAO")
#---------------------------------------------------------------------------

col_list[["UMAP_all"]] <- c(
  "MG"   = "#6585e7",
  "MON"  = "#A27DA5",
  "PVM"  = "#7a7396",
  "NEUT" = "#d3c1d4",
  "AST"  = "#C7DEDD",
  "OL"   = "#3D858B",
  "EC"   = "#a73f52",
  "MUR"  = "#ce7d8c"
)

col_list[["Conditions"]] <- c(
  "LiveCells_Sham"     = "#CDE5C2",
  "LiveCells_MCAO"     = "#5F7048",
  "LiveNuclei_Sham"    = "#e8d4b0",
  "LiveNuclei_MCAO"    = "#8a5c1a",
  "FixedNuclei_Sham"   = "#f9dab5",
  "FixedNuclei_MCAO"   = "#d9741a"
)

col_list[["UMAPLiveCells"]] <- c(
  "Sham" = "#CDE5C2",
  "MCAO" = "#5F7048"
)

col_list[["UMAPLiveNuclei"]] <- c(
  "Sham" = "#e8d4b0",
  "MCAO" = "#8a5c1a"
)

col_list[["UMAPFixedNuclei"]] <- c(
  "Sham" = "#f9dab5",
  "MCAO" = "#d9741a"
)

col_list[["gradient"]] <- c("lightblue", "#663399")


col_list[["Cond_preparation"]] <- c(
  "LiveCells"    = "#5F7048",
  "LiveNuclei"   = "#8a5c1a",
  "FixedNuclei"  = "#d9741a"
)

col_list[["Cond_preparation_wo_names"]] <- c(
   "#5F7048",
   "#8a5c1a",
   "#d9741a"
)
col_list[["Cond_preparation_cellchat"]] <- c(
  "LiveCells"   = "#5F7048",
  "FixedNuclei" = "#d9741a"
)

col_list[["Conditions_violin"]] <- c(
  "LiveCells_Sham"     = "#CDE5C2",
  "LiveNuclei_Sham"    = "#e8d4b0",
  "FixedNuclei_Sham"   = "#f9dab5",
  "LiveCells_MCAO"     = "#5F7048",
  "LiveNuclei_MCAO"    = "#8a5c1a",
  "FixedNuclei_MCAO"   = "#d9741a"
)


col_list[["dot_plot"]] <- c("#E8ECEF","#9ABDDC", "#3A0956")




col_list[["UMAP_mg_rm"]] <- c(
  "0" = "#ebebeb",
  "1" = "#d0d0d0",
  "2" = "#c3c3c3",
  "3" = "#b5b5b5",
  "4" = "#AE1440",
  "5" = "#9a9a9a",
  "6" = "#595959"
)

col_list[["UMAP_mg"]] <- c(
  "HM1"   = "#6687E8",   
  "HM2"   = "#003399",   
  "INTER" = "#A8BEDA", 
  "ARM"   = "#8A4FE8",   
  "DIV"   = "#49C7E6",   
  "IRM"   = "#348ABD"    
)

col_list[["cellchat"]] <- c(
 "#6687E8",   
 "#003399",  
 "#A8BEDA", 
 "#8A4FE8",   
 "#348ABD"    
)


col_list[["Conditions_violin_val"]] <- c(
  "LiveCells_MCAO"   = "#5F7048",
  "FixedNuclei_MCAO" = "#d9741a"
)

col_list[["Conditions_cellchat"]] <- c(
  "#5F7048","#d9741a"
)

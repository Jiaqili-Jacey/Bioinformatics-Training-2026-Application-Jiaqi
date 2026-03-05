library(limma)
library(ggplot2)

# BiocManager::install("limma")

GSE60450 <- read.csv("/Users/File/MELB_Coursework/training_application/GSE60450_GeneLevel_Normalized(CPM.and.TMM)_data.csv", row.names=1)
metadata <- read.csv("/Users/File/MELB_Coursework/training_application/GSE60450_filtered_metadata.csv", row.names=1)

# For Q11 & Q12
data_raw <- read.csv("GSE60450_GeneLevel_Normalized(CPM.and.TMM)_data.csv")
dim(data_raw) # extract data structure for raw data

exp_matrix <- data[, -1]

mds <- plotMDS(exp_matrix, plot=FALSE)

plot_df <- data.frame(
  Sample = rownames(metadata),
  X = mds$x,
  Y = mds$y,
  CellType = metadata$immunophenotype,
  Stage = metadata$developmental.stage
)

ggplot(plot_df, aes(x=X, y=Y, color=CellType, shape=Stage)) +
  geom_point(size=4) +
  theme_minimal() +
  labs(title="MDS Plot of GSE60450",
       x="MDS Dimension 1",
       y="MDS Dimension 2") +
  scale_color_brewer(palette="Set1")

ggsave("/Users/File/MELB_Coursework/training_application/MDS_plot.png", width=8, height=6)
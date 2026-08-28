library(readxl)
library(dplyr)

# 1. Import
data <- read_excel(
  "data/TIM_POP_database_V1.xlsx",
  sheet = "Inclusion"
)

# 2. Vérification population
dim(data)
n_distinct(data$Numero)
sum(duplicated(data$Numero))

# 3. Voir directement les données microbiologiques pré-EOT
data |>
  select(
    Numero,
    type_prelevement_preeot,
    pathogene_preeot,
    pathogene_preeot_2,
    pathogene_preeot_3
  ) |>
  print(n = Inf)
preEOT_pos <- data |>
  filter(
    pathogene_preeot > 0 |
      pathogene_preeot_2 > 0 |
      pathogene_preeot_3 > 0
  ) |>
  select(
    Numero,
    pathogene_preeot,
    pathogene_preeot_2,
    pathogene_preeot_3,
    pathogene_ppo,
    pathogene_ppo_2,
    pathogene_ppo_3
  )

preEOT_pos
# 4. Nombre de patients avec prélèvement pré-EOT positif
sum(
  data$pathogene_preeot > 0 |
    data$pathogene_preeot_2 > 0 |
    data$pathogene_preeot_3 > 0,
  na.rm = TRUE
)
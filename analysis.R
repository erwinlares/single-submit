## flowchart LR
##   A[load the libraries <br>and data] --> B[Prepare <br>the data]
##   B --> C[Perform Calculations]
##   C --> D[Print tabular results]
##   C --> E[Render visualizations]
##   D -->F[Save tabular results as .csv<br>Save plot as .png]
##   E -->F

## -----------------------------------------------------------------------------------
library(tidyverse)
library(palmerpenguins)
library(gt)

data <- palmerpenguins::penguins


## -----------------------------------------------------------------------------------
moft_bm <- data |>
    group_by(species) |>
    summarize(min_fl = min(flipper_length_mm, na.rm = TRUE),
              max_fl = max(flipper_length_mm, na.rm = TRUE),
              mean_fl = mean(flipper_length_mm, na.rm = TRUE),
              sd_fl = sd(flipper_length_mm, na.rm = TRUE))

moft_bm |> 
  gt() |> 
  fmt_number(decimals = 0) |> 
  tab_header(
    title = "Measures of Tendency",
    subtitle = "Flipper Length in mm"
  )


## -----------------------------------------------------------------------------------
data |> 
    ggplot() +
    aes(x = flipper_length_mm, color = species) +
    geom_boxplot() + 
    labs(title = "Flipper length in mm") +
    theme_bw()


## -----------------------------------------------------------------------------------

moft_bm |> write_csv("results-folder/moft-bm.csv")

ggsave("results-folder/fl-mm-plot.png")


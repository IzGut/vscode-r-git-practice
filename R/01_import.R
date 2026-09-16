library(tidyverse)

sales <- read_csv( "data/sample/sales_sample.csv", show_col_types = FALSE )  %>%  mutate( revenue = quantity * price )

sales

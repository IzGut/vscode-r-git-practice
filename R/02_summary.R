library(tidyverse) 

sales <- read_csv( 
    "data/sample/sales_sample.csv", 
    show_col_types = FALSE 
    ) |> mutate( 
        revenue = quantity * price 
        ) 
        
product_summary <- sales |> 
    group_by(product) |> 
    summarise( 
        transactions = n(), 
        total_quantity = sum(quantity), 
        average_quantity = mean(quantity), 
        total_revenue = sum(revenue), 
        average_revenue = mean(revenue), 
        .groups = "drop" 
    ) |> 
    arrange(desc(total_revenue)) 
    
product_summary

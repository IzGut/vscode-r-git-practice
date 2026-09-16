library(tidyverse) 
sales <- read_csv( 
    "data/sample/sales_sample.csv", 
    show_col_types = FALSE 
    ) |>
    mutate( 
        revenue = quantity * price 
        ) 

revenue_by_product <- sales |> 
group_by(product) |> 
summarise( 
    total_revenue = sum(revenue), 
    .groups = "drop" 
    ) 

revenue_by_product |> 
ggplot( 
    aes( 
        x = reorder(product, total_revenue), 
        y = total_revenue 
        ) 
        ) + 
        geom_col() + 
        coord_flip() + 
        labs( 
            title = "Total Revenue by Product", 
            x = NULL, 
            y = "Revenue" ) + 
            theme_minimal()

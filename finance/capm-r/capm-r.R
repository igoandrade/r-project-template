# Pacotes R
library(tidyverse)
library(tidyquant)
library(PerformanceAnalytics)

acoes_v = c("MGLU3.SA", "WEGE3.SA", "POSI3.SA", "WIZS3.SA")

acoes_df = tq_get(
    acoes_v,
    from=Sys.Date() + years(-5) ,
    to=Sys.Date(),
    get="stock.prices"
) %>% group_by(symbol)

head(acoes_df)

Ri <- acoes_df %>%
    tq_transmute(
        select = adjusted, 
        mutate_fun = periodReturn,
        period = "daily",
        col_rename = "Ri"
    )

Ri <- Ri[-1,]
Ri <- na.omit(Ri)

Rm <- "^BVSP" %>%
    tq_get(
        get = "stock.prices",
        from = Sys.Date() + years(-5) ,
        to = Sys.Date()
    ) %>% tq_transmute(
        select = adjusted,
        mutate_fun = periodReturn,
        period = "daily",
        col_rename = "Rm"
    )

Rm <- na.omit(Rm)


RiRm <- left_join(Ri, Rm, by = c("date" = "date"))

head(RiRm)

tq_performance(RiRm, Ri, Rm, Rf = 0.0525/252, performance_fun = table.CAPM)

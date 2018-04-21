rm(list=ls())
cust_dimen <- read.csv("cust_dimen.csv", stringsAsFactors = F)
market_fact <- read.csv("market_fact.csv", stringsAsFactors = F)
orders_dimen <- read.csv("orders_dimen.csv", stringsAsFactors = F)
prod_dimen <- read.csv("prod_dimen.csv", stringsAsFactors = F)
shipping_dimen <- read.csv("shipping_dimen.csv", stringsAsFactors = F)

merged_data <- merge(market_fact,cust_dimen, by="Cust_id")
merged_data <- merge(merged_data,orders_dimen, by="Ord_id")
merged_data <- merge(merged_data,prod_dimen, by="Prod_id")
merged_data <- merge(merged_data,shipping_dimen, by="Ship_id")

sliced_data <- subset(merged_data, merged_data$Ship_Mode=='DELIVERY TRUCK')
diced_data <- subset(merged_data, merged_data$Region == 'ATLANTIC' & merged_data$Order_Priority == 'MEDIUM')

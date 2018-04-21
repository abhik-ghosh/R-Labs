setwd("~/DS_Lab/BI OLAP Lab/Input")
rm(list=ls())

# Ingesting the provided data in R
cust_dimen <- read.csv("cust_dimen.csv", stringsAsFactors = F)
market_fact <- read.csv("market_fact.csv", stringsAsFactors = F)
orders_dimen <- read.csv("orders_dimen.csv", stringsAsFactors = F)
prod_dimen <- read.csv("prod_dimen.csv", stringsAsFactors = F)
shipping_dimen <- read.csv("shipping_dimen.csv", stringsAsFactors = F)


# Merging dimension tables to the fact table and creating a bigger more informative fact table
merged_data <- merge(market_fact,cust_dimen, by="Cust_id")
merged_data <- merge(merged_data,orders_dimen, by="Ord_id")
merged_data <- merge(merged_data,prod_dimen, by="Prod_id")
merged_data <- merge(merged_data,shipping_dimen, by="Ship_id")

# BI OLAP Opertations in R
sliced_data <- subset(merged_data, merged_data$Ship_Mode=='DELIVERY TRUCK')
diced_data <- subset(merged_data, merged_data$Region == 'ATLANTIC' & merged_data$Order_Priority == 'MEDIUM')

rollup_data_sales <- aggregate(merged_data$Sales, by = list(merged_data$Product_Sub_Category), FUN = sum)
rollup_data_profit <- aggregate(merged_data$Profit, by = list(merged_data$Product_Sub_Category), FUN = sum)


# Ungraded Questions:
# Which is the least profitable customer segment and the total profit made in that segment?
rollup_profit_segment <- aggregate(merged_data$Profit, by = list(merged_data$Customer_Segment), FUN = sum)


sliced_data=subset(merged_data,merged_data$Profit==max(merged_data$Profit));

rm(cust_dimen, market_fact, orders_dimen, prod_dimen, shipping_dimen)


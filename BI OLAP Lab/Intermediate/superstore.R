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
rollup_selltotal_segment <- aggregate(merged_data$Sales, by = list(merged_data$Customer_Segment), FUN = sum)

sliced_data=subset(merged_data,merged_data$Profit==max(merged_data$Profit));

rm(cust_dimen, market_fact, orders_dimen, prod_dimen, shipping_dimen)

sliced_consumer <- subset(merged_data,merged_data$Customer_Segment == 'CONSUMER');
rollup_consumer_profit_category <- aggregate(sliced_consumer$Profit, by = list(sliced_consumer$Product_Category), FUN = sum)


sliced_smallbusiness <- subset(merged_data,merged_data$Customer_Segment == 'SMALL BUSINESS');
rollup_smallbusiness_profit_category <- aggregate(sliced_smallbusiness$Profit, by = list(sliced_smallbusiness$Product_Category), FUN = sum)

officemachine_data <- subset(merged_data, merged_data$Product_Sub_Category=='OFFICE MACHINES')
rollup_profit_province <- aggregate(officemachine_data$Profit, by = list(officemachine_data$Province), FUN = sum)

officemachine_Province_data <- subset(merged_data, merged_data$Product_Sub_Category=='OFFICE MACHINES' & merged_data$Province=='ALBERTA')
rollup_profit_province_delivery <- aggregate(officemachine_Province_data$Profit, by = list(officemachine_Province_data$Ship_Mode), FUN = sum)

airshipment_Province_data <- subset(merged_data, merged_data$Ship_Mode=='REGULAR AIR'& merged_data$Province=='ALBERTA')
rollup_profit_segment_delivery <- aggregate(airshipment_Province_data$Profit, by = list(airshipment_Province_data$Customer_Segment), FUN = sum)


setwd("~/DS_Lab/BI OLAP Lab/Output")
write.table(merged_data, "merged_data.txt", row.names = F, sep = "\t")

#rm(merged_data)


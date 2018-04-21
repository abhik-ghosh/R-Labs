install.packages("rjava")
library("rjava")
install.packages("xlsx")
library("xlsx")

setwd("~/DS_Lab/BI_OLAP_Cricket/Input")
cricket_odi <- read.xlsx("Cricket.xlsx", 1, header=TRUE, colClasses=NA)
install.packages("RMySQL", dependencies=TRUE, INSTALL_opts = c('--no-lock'))
#library("RMySQL", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.2")
library(RMySQL)


con <- dbConnect(RMySQL::MySQL(), dbname = "employeedb",  host = "127.0.0.1", port = 3306, user = "root", password = "abhik")
query <- "select * from emptab"
dbGetQuery(con, query)



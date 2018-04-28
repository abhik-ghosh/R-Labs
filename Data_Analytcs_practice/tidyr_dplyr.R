#install.packages("dplyr", dependencies=TRUE, INSTALL_opts = c('--no-lock'))
#install.packages("tidyr", dependencies=TRUE, INSTALL_opts = c('--no-lock'))
#library("dplyr", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.2")
#library("tidyr", lib.loc="~/R/x86_64-pc-linux-gnu-library/3.2")

rm(list=ls())

iris_data <- iris

# tidyR - gather, spread, seperate, unite
#gather() - Reshaping wide format to long format
long_data <- gather(iris_data,iris_header, value, Sepal.Length : Petal.Width)
long_data_concise <- long_data[!(long_data$value == 0),]
str(long_data_concise)
#separate() - Splitting single variable into two
# NOT WORKING - original_data <- separate(long_data, iris_header, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width'), sep="")

# spread() - compliment to gather
my_data <- spread(long_data_concise, iris_header, value)
str(my_data)


filter(iris_data, Sepal.Length == 5.1, Petal.Length ==1.5)




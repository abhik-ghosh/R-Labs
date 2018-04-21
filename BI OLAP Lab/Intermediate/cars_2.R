# Store the mtcars dataframe as cars
cars <- mtcars

# ------ TODO -- CREATE THE FOLLOWING 3 OBJECTS ----

# Find the average horsepower hp for each level of cylinder 
# The output should be a df with two columns having cyl and the average horsepower 
# Store the resulting df as cyl_hp
cyl_hp <- aggregate(mtcars$hp, by = list(mtcars$cyl), FUN = mean)
  
  # Find the average miles per gallon (mpg) for each level of cylinder
  # The output should be a df with two columns having cyl and the average mpg
  # Store the resulting df as cyl_mpg
  cyl_mpg <- aggregate(mtcars$mpg, by = list(mtcars$cyl), FUN = mean)
  
  # Join the two tables created above so that the result contains three columns cyl, avg hp and avg mpg
  # Store the result as cyl_summary
  cyl_summary <- merge(cyl_hp, cyl_mpg, by='Group.1')
  
  
  # ----- DO NOT EDIT THE CODE BELOW FOR CORRECT FEEDBACK------#
  
  #Adding relevant libaries
  suppressWarnings({ ## Supressing Warning messages
    suppressPackageStartupMessages({ ## Supressing startup messages
      library(compare)
    })
  })

l = ls()
if (!"cyl_hp" %in% l| !"cyl_mpg" %in% l | !"cyl_summary" %in% l) {
  cat('You have not created all three variables. Please check!\n')
} else {
  test1 = F
  test2 = F
  test3 = F
  
  if (!is.data.frame(cyl_hp) | !is.data.frame(cyl_mpg) | !is.data.frame(cyl_summary)){
    cat("All three variables should be dataframes! Please check.\n")
  }
  
  d1 = aggregate(hp~cyl, cars, mean)
  d2 = aggregate(mpg~cyl, cars, mean)
  d3 = merge(d1, d2, by="cyl")
  test1 = compare(d1, cyl_hp, round = T, allowAll = T)[[1]]
  if (!test1){cat("cyl_hp is not aggregated correctly! Try again.\n")}
  test2 = compare(d2, cyl_mpg, round = T, allowAll = T)[[1]]
  if (!test2){cat("cyl_mpg is not aggregated correctly! Try again.\n")}
  test3 = compare(d3, cyl_summary, round = T, allowAll = T)[[1]]
  if (!test3){cat("cyl_summary is not merged correctly! Try again.\n")}
  
  if (test1 & test2 & test3){
    cat("Your answer is correct! Awesome!\n")
  }
}

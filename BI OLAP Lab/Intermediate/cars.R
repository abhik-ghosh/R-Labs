# Store the mtcars dataframe as cars
cars <- mtcars

# ------ TODO -- CREATE THE FOLLOWING 3 OBJECTS ----
# 1. Convert the variable cyl into factor format and 
# save it into a new variable cars_cyl 


# 2. Subset the cars having 4 gears (gear) and 
# store it in the dataframe cars_4



# 3. Subset the df 'cars' to store the cars having cars with 3 gears and hp greater than 100
# store the result as cars_3



# ----- DO NOT EDIT THE CODE BELOW FOR CORRECT FEEDBACK------#
l = ls()
if (!"cars_cyl" %in% l| !"cars_4" %in% l | !"cars_3" %in% l) {
  cat('You have not created all three variables. Please check!\n')
} else {
  test1 = F
  test2 = F
  test3 = F
  if (!is.factor(cars_cyl)) {
    cat('1. cars_cyl is not in factor format\n')
  } else {
    cat('1. cars_cyl is perfect!\n')
    test1 = T
  } 
  
  if (!(all.equal(cars_4$gear, rep.int(4, 12)) == T)) {
    cat('2. cars_4 is not subsetted correctly. Please check!\n')
  } else {
    cat('2. cars_4 is subsetted perfectly\n')
    test2 = T
  } 
  
  if (!(all.equal(cars_3$gear, rep.int(3, 14))== T) | !(all.equal(cars_3$hp >100, rep(TRUE, 14)) == T)) {
    cat('3. cars_3 is not subsetted correctly. Please check!\n')
  } else {
    cat('3. cars_3 is subsetted perfectly.\n')
    test3 = T
  } 
  
  if (test1 & test2 & test3){
    cat("Your answer is correct! Awesome job!\n")
  }
}

# IF not installed, install the Kernlab package 
library(kernlab)
data(spam)

# Performing the sampling step for test and trainign data set
set.seed(3435)
trainIndicator = rbinom(4601, size = 1, prob = 0.5)
table(trainIndicator)

trainSpam = spam [trainIndicator == 1, ]  
testSpam  = spam [trainIndicator == 0, ] 

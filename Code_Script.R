# IF not installed, install the Kernlab package 
library(kernlab)
# The data here is precleaned and is in the required format, 
# no proper documentation available as of now 
data(spam)

# Performing the sampling step for test and trainign data set
set.seed(3435)
trainIndicator = rbinom(4601, size = 1, prob = 0.5)
table(trainIndicator)

trainSpam = spam [trainIndicator == 1, ]  
testSpam  = spam [trainIndicator == 0, ] 

# Exploratory Analysis 

# The columns are essentially the words appearing in the emails 
names (trainSpam)

# The rows show the occurence of the words in the emails 
head(trainSpam, 5)

# The type variable shows the classifications, classifying 906 of 2287 emails as spam
table(trainSpam$type)

# Lets also look at some of the pltos to understand the relatioship between two variables 
plot ( spam$capitalAve ~ spam$type)

# The above plot makes it difficult to visulaize data points, 
# -- hence we will look at the log transformation of the variables 
# Why + 1 added to the log base 10?
# This will remove all the 0 and make them 1 to get a 
# -- rough sense of the log values, since we are just exploring, it is ok 
# From the graph, it is evident that there are a lot of capital letters 
# -- in spam emails 
plot (log10(spam$capitalAve + 1) ~ spam$type)


# Let's also look at the pair wise relationship of all teh variables 
# We can clearly see that some of the variables are not correlated 
plot (log10(trainSpam[,1:4] + 1 ) )

# Let's start our cluster analysis 
# The below is the first cut analysis using hcluster function 
hcluster = hclust(dist(t(trainSpam[,1:57])))
plot (hcluster)

# The plot is not very helpful at this point as it is skewed against one variable
# In order to solve for that, we will take the log10 transformation 
hcluster = hclust(dist(t(log10(trainSpam[,1:57]+1))))
plot (hcluster)



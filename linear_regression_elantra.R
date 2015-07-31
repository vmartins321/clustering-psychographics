#load the data as sales and examine it
sales = read.csv("./elantra.csv")
summary(sales)
str(sales)

#create month as a factor
monthFactor = as.factor(sales$Month)

#add to data frame
sales = cbind(sales, monthFactor)

#split into test and train based on 2012 or earlier
train = subset(sales, sales$Year<=2012)
test = subset(sales, sales$Year>2012)

#Build a linear regression model to predict monthly Elantra sales
#using Unemployment, CPI_all, CPI_energy and Queries
salesmodel = lm(train$ElantraSales ~ train$Unemployment + train$CPI_all + train$CPI_energy + train$monthFactor, data = train)

#what's the result
summary(salesmodel)

#As we have seen before, changes in coefficient signs
#and signs that are counter to our intuition may be 
#due to a multicolinearity problem. >0.6
#To check, compute the correlations of the variables in the training set.
cor(train[c("Unemployment","monthFactor","Queries","CPI_energy","CPI_all")])

#predict
predictTest = predict(salesmodel, data =test$ElantraSales)
summary(predictTest)
str(predictTest)

#SSE
SSE = sum((predictTest - test$ElantraSales)^2)

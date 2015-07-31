statedata = data.frame(state.x77)

#First, predict Life.Exp 
#using all of the other variables as the independent variables
lifeModel = lm(Life.Exp ~ ., data = statedata)
summary(lifeModel)

#make predictions with this model
predictions = predict(lifeModel)

#Calculate the sum of squared errors (SSE) between the predicted life 
#expectancies using this model and the actual life expectancies:
SSE = sum((predictions - statedata$Life.Exp)^2)

#or just use the residuals
sum(lifeModel$residuals^2)
plot(LifeModel$residuals)

#Build a second linear regression model using just
#Population, Murder, Frost, and HS.Grad as independent variables 
lifeModel2 = lm(Life.Exp ~ Population + Murder + Frost + HS.Grad, data = statedata)
summary(lifeModel2)
#we've improved the R squared

#check out the residuals
sum(lifeModel2$residuals^2)

#Let's now build a CART model to predict Life.Exp using all of the other variables 
library(rpart)
CARTmodel = rpart(Life.Exp ~ ., data=statedata, minbucket = 5)

#You can then plot the tree by typing:
library(rpart.plot)  
prp(CARTmodel)

#Use the regression tree you just built to predict life expectancies
#(using the predict function), 
#and calculate the sum-of-squared-errors (SSE)
CARTpredictions = predict(CARTmodel)
CARTSSE = sum((CARTpredictions - statedata$Life.Exp)^2)
CARTSSE #the errors are about the same as the linear regression

#let's tune the model using k-folds cross validation
library(caret)
set.seed(111)
fitControl = trainControl(method = "cv", number = 10)
cartGrid = expand.grid(.cp = seq(0.01, 0.5, 0.01) )
train(Life.Exp ~ ., data=statedata, method="rpart", trControl = fitControl, tuneGrid = cartGrid)

#use the cp value to create a new tree
CARTcp = rpart(Life.Exp ~ ., data = statedata, cp = 0.12 )
prp(CARTcp)

#make predictions using this model
cpPredictions = predict(CARTcp)
SSEcp = sum((cpPredictions - statedata$Life.Exp)^2)
SSEcp #we reduced SSE slightly 

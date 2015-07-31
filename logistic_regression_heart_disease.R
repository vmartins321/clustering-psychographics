#predict heart disease

framingham = read.csv("./Unit2_framingham.csv")

#split into train and test set, split on the dependent variable, 
#put 65% in training set bc we have enough data points, 
#and having more in the test set allows us to increase 
#our confidence in the model's ability to generalize to new data
library(caTools)
set.seed(1000)
split = sample.split(framingham$TenYearCHD, SplitRatio = 0.65)
train = subset(framingham, split ==TRUE)
test = subset(framingham, split = F)

#create a logistic regression. family binomial tells r to perform a logistic regresssion
framinghamLog = glm(TenYearCHD~., data = train, family = binomial)
summary(framinghamLog)

#make predictions based on this model. type = response gives us probabilities
predictTest = predict(framinghamLog, type = "response", newdata = test)

#how many heart diseases do we predict at a 0.5 threshold?
table(test$TenYearCHD, predictTest >0.5)

#the accuracy of the model is the true negative + true positives / all
(3088+36)/(3088+13+521+36) #85% accuracy

#compare this to accuracy of a baseline model. the most frequent outcome is no heart disease.
#what's the accuracy of predicting no heart disease for everyone?
(2865+236)/(2865+236+409+148) #true negatives + false negatives / all
#84.8% accuracy

#so out model is not better than just guessing no one has heart disease
#but can we get a better model by varying the threshold?
#ROCR makes predictions based on our predictions and the test data
library(ROCR)
ROCRpred = prediction(predictTest, test$TenYearCHD)

# turn the outcome of the ROCR prediction to a numeric,
#and get the auc of the y values
as.numeric(performance(ROCRpred, "auc")@y.values)
#74% of the time, model can differentiate whether someone will have heart disease

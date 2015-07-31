baseball = read.csv('./baseball.csv')
View(baseball)

#Using the table() function, 
#identify the total number of years included in this dataset.
length(table(baseball$Year))

#subset to only include teams that made the playoffs
baseball = subset(baseball, Playoffs == 1)

#how many teams made it to playoffs each year?
table(table(baseball$Year))

#It's much harder to win the World Series 
#if there are 10 teams competing for the championship versus just two. 
#Therefore, we will add the predictor variable
#NumCompetitors to the baseball data frame.
NumCompetitors = table(baseball$Year)
baseball$NumCompetitors = NumCompetitors[as.character(baseball$Year)] 

#How many playoff team/year pairs are there in our dataset
#from years where 8 teams were invited to the playoffs?
table(baseball$NumCompetitors == 8)

#Add a variable named WorldSeries to the baseball data frame
baseball$WorldSeries = as.numeric(baseball$RankPlayoffs == 1)
baseball$WorldSeries
table(baseball$WorldSeries == 0)

#check for colinearity
cor(baseball[c("Year", "RA", "RankSeason", "NumCompetitors")])

#build multivariate models
Model1 = glm(WorldSeries ~ Year + RA, data=baseball, family=binomial)
Model2 = glm(WorldSeries ~ Year + RankSeason, data=baseball, family=binomial)
Model3 = glm(WorldSeries ~ Year + NumCompetitors, data=baseball, family=binomial)
Model4 = glm(WorldSeries ~ RA + RankSeason, data=baseball, family=binomial)
Model5 = glm(WorldSeries ~ RA + NumCompetitors, data=baseball, family=binomial)
Model6 = glm(WorldSeries ~ RankSeason + NumCompetitors, data=baseball, family=binomial)

#check models AIC
summary(Model1)
summary(Model2)

#build bivariate model
Model0 =  glm(WorldSeries ~ NumCompetitors, data = baseball, family = binomial)
summary(Model0)

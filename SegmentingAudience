#load survey data. name AudienceCoded.
AudienceCoded = read.csv("./Dropbox/AJ+/Data/Surveys/AJ_Audience_Survey_Coded_Values.csv", 
                         header = T, stringsAsFactors = F)


#rename variables
install.packages("reshape2")
library(reshape2)

install.pakages("plyr")
library(plyr)
AudienceCoded <- rename(AudienceCoded, 
                   c(V1="ParticipantID", V8 = "ParticipantStartTime", V9 = "ParticipantEndTime", 
                     V10 = "ParticipantFinished", Q_TotalDuration = "ParticipantDurationInSeconds", 
                     Q_URL = "ParticipantReferralSource", X1.Browser_1_TEXT = "ParticipantBrowser", 
                     X1.Browser_3_TEXT  = "ParticipantOperatingSystem", X2.Age = "ParticipantAgeGroup", 
                     X3.Gender = "ParticipantGender", X3.Educatio = "ParticipantEducation", 
                     X4.Language = "ParticipantLanguage", X4.Language_TEXT = "ParticipantLanguageText", 
                     X5.Country = "ParticipantCountry", X6.State = "ParticpantState", 
                     X7.News_1 = "NewsLabor", X7.News_2 = "NewsLifestyle", 
                     X7.News_3 = "NewsTechAndScience", X7.News_4 = "NewsEcononomyAndBusiness",
                     X7.News_5 = "NewsSocialIssues", X7.News_6 = "NewsEducation", X7.News_7 = "NewsHealth",
                     X7.News_8 = "NewsOther", X7.News_8_TEXT = "NewsOtherText", X7.News_9 = "NewsNone", 
                     X7.News_10 = "NewsArtsCultureEntertainment", X7.News_11 = "NewsCrimeLawJustice", 
                     X7.News_12 = "NewsDisaster", X7.News_13 =  "NewsEnvironment", X7.News_14 = "NewsHumanInterest", 
                     X7.News_15 = "NewsPolitics", X7.News_16 = "NewsReligion", X7.News_17 = "NewsSport", 
                     X7.News_18 = "NewsUnrestConflictWar", X7.News_19 = "NewsWeather", X8.Competit_1 = "CompetCNN", 
                     X8.Competit_2 = "CompetBuzzfeed", X8.Competit_3 = "CompetAlJazeera", X8.Competit_4 = "CompetVice", 
                     X8.Competit_5 = "CompetUpworthy", X8.Competit_6 = "CompetNowThisNews", X8.Competit_7 = "CompetBBC", 
                     X8.Competit_8 = "CompetFox", X8.Competit_9 = "CompetMic", X8.Competit_10 = "CompetVox", 
                     X8.Competit_11 = "CompetOther", X8.Competit_11_TEXT = "CompetOtherText", X8.Competit_12 = "CompetNone",
                     X8.Competit_13 = "CompetHuffPo", X8.Competit_15 = "CompetNYT", X9.PsyTrust = "PsyTrustMainstream", 
                     X10.PsyNega = "PsyNewsTooNegative", X11.PsyWorl = "PsyWorldly", X12.PsyGirl = "PsyGirlsStrong", 
                     X13.PsyPers = "PsyPersonalStory", X14.PsyPoli = "PsyPolitical", X15.PsyOpin = "PsyOpinionated", 
                     QualityCon = "QualityControlDisagree", X16.FBFreq = "FBFrequency", X17.FBTime_1 = "FBEarlyMorning", 
                     X17.FBTime_2 = "FBAfternoon", X17.FBTime_4 = "FBMorning", X17.FBTime_5 = "FBEvening", 
                     X20.YTFreq = "YTFrequency", X21.YTTime_1 = "YTEarlyMorning", X21.YTTime_2 = "YTAfernoon", X21.YTTime_4 = "YTMorning", 
                     X21.YTTime_5 = "YTEvening", X24.TWFreq = "TWFrequency", X25.TWTime_1 = "TWEarlyMorning", 
                     X25.TWTime_2 = "TWAfternoon", X25.TWTime_4 = "TWMorning", X25.TWTime_5 = "TWEvening", 
                     X26.IGFreq = "IGFrequency", X32.MAFreq = "AppFrequency", X33.MATime_1 = "AppEarlyMorning", X33.MATime_2 = "AppAfternoon", 
                     X33.MATime_4 = "AppMorning", X33.MATime_5 = "AppEvening", X35.MADurat = "AppDuration", X36.MARank_1 = "AppLiveChat", 
                     X36.MARank_2  = "AppInfographicsAndIllustrations", X36.MARank_3 = "AppVideos", X36.MARank_4 = "AppPhotos", 
                     X36.MARank_5 = "DebatesAndConversations", X37.BrandVa_1 = "ValueUniqueNews", X37.BrandVa_2 = "ValueBreakingNews", 
                     X37.BrandVa_3 = "ValueOnTheGround", X37.BrandVa_4 = "ValueContext", X37.BrandVa_5 = "ValueUniquePerspectives", 
                     X37.BrandVa_6 = "ValueUpdates", X37.BrandVa_7 = "ValueBoredom", X37.BrandVa_8 = "ValueEntertainment", 
                     X38.BrandPe = "BrandPerceptions", X39.Stories_1 = "StoryGaza", X39.Stories_2 = "StoryEbola", 
                     X39.Stories_3 = "StoryBlackLives", X39.Stories_4 = "StoryISIS", X39.Stories_5 = "StorySyria", 
                     X39.Stories_6 = "StoryAyotzinapa", X39.Stories_7 = "StoryNone", X40.Africa = "ThemeAfricaReset", 
                     X41.Bubbles = "ThemeBubbles", X42.NewLife = "New Ways of Living", X43.Eat = "Food", X44.Place = "Place", 
                     X45.Surveil = "Surveillance", X46.Gadgets = "Gadgets", X47.Email = "ParticipantEmail", X47.Email_TEXT = "ParticipantEmailText"))


#throw out participants who failed the quality control
AudienceCoded = AudienceCoded[which(AudienceCoded$QualityControlDisagree == "0"),]

#replace NA with 0 
AudienceCoded[is.na(AudienceCoded)] = 0

#write csv
write.csv(AudienceCoded, "Clean_Audience_Survey_Coded.csv")

#reshape NewsTypes
#AudienceMelt = melt(AudienceCoded,
                    #measure.vars = c("NewsLabor", "NewsLifestyle", 
                                     "NewsTechAndScience",  "NewsEcononomyAndBusiness",	
                                      "NewsSocialIssues",	"NewsEducation",	"NewsHealth",	
                                      "NewsOther",	"NewsOtherText",	"NewsNone",	
                                      "NewsArtsCultureEntertainment",	"NewsCrimeLawJustice",
                                      "NewsDisaster",	"NewsEnvironment",	"NewsHumanInterest",
                                        "NewsPolitics",	"NewsReligion",	"NewsSport",	
                                        "NewsUnrestConflictWar",	"NewsWeather"), variable.name = "NewsType", value.name = "NewsTypeValue")

#analyze the "other" text
library(tm)
library(wordcloud)
CompCorpus = Corpus(VectorSource(AudienceCoded$CompetOtherText))
CompCorpus = tm_map(CompCorpus, tolower)
CompCorpus = tm_map(CompCorpus, PlainTextDocument)
CompCorpus = tm_map(CompCorpus, removePunctuation)
CompFreq = DocumentTermMatrix(CompCorpus)
CompFreq = as.data.frame(as.matrix((CompFreq)))
CompWords = colnames(CompFreq)
CompCounts = colSums(CompFreq)
wordcloud(CompWords, CompCounts)

#subset dataframe by participant, news type consumption, competitors and psychographics
AudienceSubset = subset(AudienceCoded, select = NewsLabor:PsyOpinionated)
AudienceSubset$CompetOtherText = NULL
AudienceSubset$NewsOtherText = NULL

#cluster
library(caret)
distances = dist(AudienceSubset, method = "euclidian")
cluster = hclust(distances, method = "ward.D2")
plot(cluster)
clusterGroups = cutree(cluster, k = 6)
rect.hclust(cluster, k=6, border = "red")

#add clusters to subset
AudienceSubset$cluster = clusterGroups

#examine clusters by column means
clusterMeans = by(AudienceSubset, AudienceSubset$cluster, colMeans, simplify = T)
cluster1 = as.data.frame(clusterMeans[1])
cluster1 = cbind(cluster1, as.data.frame(clusterMeans[2]))
cluster1 = cbind(cluster1, as.data.frame(clusterMeans[3]))
cluster1 = cbind(cluster1, as.data.frame(clusterMeans[4]))
cluster1 = cbind(cluster1, as.data.frame(clusterMeans[5]))
cluster1 = cbind(cluster1, as.data.frame(clusterMeans[6]))

#add the means of the entire population to the cluster means
Means = colMeans(AudienceSubset)
cluster = cbind(cluster1, Means)

write.csv(cluster, "Audience_Cluster_Means.csv")

#add clusters to Audience Coded
AudienceCoded = cbind(AudienceCoded, clusterGroups)

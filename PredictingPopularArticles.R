#load data
NewsTrain <- read.csv("~/Downloads/NYTimesBlogTrain.csv", stringsAsFactors=FALSE)
NewsTest <- read.csv("~/Downloads/NYTimesBlogTest.csv", stringsAsFactors=FALSE)

# convert the date/time to something R will understand
NewsTrain$PubDate = strptime(NewsTrain$PubDate, "%Y-%m-%d %H:%M:%S")
NewsTest$PubDate = strptime(NewsTest$PubDate, "%Y-%m-%d %H:%M:%S")

#add a variables called "Weekday" and "Hour" 
(0 = Sunday, 1 = Monday, etc.), by using the following commands:
NewsTrain$Weekday = NewsTrain$PubDate$wday
NewsTest$Weekday = NewsTest$PubDate$wday
NewsTrain$Hour = NewsTrain$PubDate$hour
NewsTest$Hour = NewsTest$PubDate$hour

#load packages for text processing (documentTermMatrix)
library(tm)
library(SnowballC)

#create corpus for headlines and for article snippet
CorpusHeadline = Corpus(VectorSource(c(NewsTrain$Headline, NewsTest$Headline)))
CorpusSnippet = Corpus(VectorSource(c(NewsTrain$Snippet, NewsTest$Snippet)))

#make lower case
CorpusHeadline = tm_map(CorpusHeadline, tolower)
CorpusSnippet = tm_map(CorpusSnippet, tolower)

#make plain text:
CorpusHeadline = tm_map(CorpusHeadline, PlainTextDocument)
CorpusSnippet = tm_map(CorpusSnippet, PlainTextDocument)

#remove punctuation
CorpusHeadline = tm_map(CorpusHeadline, removePunctuation)
CorpusSnippet = tm_map(CorpusSnippet, removePunctuation)

#remove stopwords
CorpusHeadline = tm_map(CorpusHeadline, removeWords, stopwords("english"))
CorpusSnippet = tm_map(CorpusSnippet, removeWords, stopwords("english"))

#stem document
CorpusHeadline = tm_map(CorpusHeadline, stemDocument)
CorpusSnippet = tm_map(CorpusSnippet, stemDocument)

#create document term matrix
dtm = DocumentTermMatrix(CorpusHeadline)
dtmSnippet = DocumentTermMatrix(CorpusSnippet)

#remove sparse words
sparse = removeSparseTerms(dtm, 0.99)
sparseSnippet = removeSparseTerms(dtmSnippet, 0.99)

#make a data frames of common headline and snippet words
HeadlineWords = as.data.frame(as.matrix(sparse))
SnippetWords = as.data.frame(as.matrix(sparseSnippet))

#make sure variable names are okay for R
colnames(HeadlineWords) = make.names(colnames(HeadlineWords))
colnames(SnippetWords) = make.names(colnames(SnippetWords))

#prepend all the headline words with the letter H, and snippet words with S
colnames(HeadlineWords) = paste("H", colnames(HeadlineWords))
colnames(SnippetWords) = paste("S", colnames(SnippetWords))

#split the text observations back into training set and testing set
HeadlineWordsTrain = head(HeadlineWords, nrow(NewsTrain))
HeadlineWordsTest = tail(HeadlineWords, nrow(NewsTest))
SnippetWordsTrain = head(SnippetWords, nrow(NewsTrain))
SnippetWordsTest = tail(SnippetWords, nrow(NewsTest))

#add outcome variable back in to the training set 
HeadlineWordsTrain$Popular = NewsTrain$Popular

#add wordcount
HeadlineWordsTrain$WordCount = NewsTrain$WordCount
HeadlineWordsTest$WordCount = NewsTest$WordCount

#combine data frames
NewsTrain1 = cbind(HeadlineWordsTrain, SnippetWordsTrain)
NewsTest1 = cbind(HeadlineWordsTest, SnippetWordsTest)

#add more variables
NewsTrain1$Weekday = NewsTrain$Weekday
NewsTest1$Weekday = NewsTest$Weekday

NewsTrain1$Hour = NewsTrain$Hour
NewsTest1$Hour = NewsTest$Hour

NewsTrain1$NewsDesk = NewsTrain$NewsDesk
NewsTest1$NewsDesk = NewsTest$NewsDesk

NewsTrain1$SectionName = NewsTrain$SectionName
NewsTest1$SectionName = NewsTest$SectionName

NewsTrain1$SubsectionName = NewsTrain$SubsectionName
NewsTest1$SubsectionName = NewsTest$SubsectionName

#create a random Forest
library(randomForest)
myForest = randomForest(Popular ~., data = NewsTrain1)

#make predictions on our test set:
PredTest1 = predict(myForest, newdata=NewsTest1, type="response")

#prepare our submission file for Kaggle:
MySubmission1 = data.frame(UniqueID = NewsTest$UniqueID, Probability1 = PredTest1)

write.csv(MySubmission1, "Submission1.csv", row.names=FALSE)

install.packages("twitteR")

library(twitteR)
setup_twitter_oauth()

fluSznTweets <- searchTwitter('#fluszn', n=10000)
head(fluSznTweets)

fluSZNdf <- twListToDF(fluSznTweets)
head(fluSzndf)
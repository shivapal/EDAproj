install.packages("twitteR")

library(twitteR)
setup_twitter_oauth("7wWEZx68NOOeqA3zFBYJDNCSJ", "yDHDM8BxX7y9zxBh0sz1qhqi6XSGsANNorkTtlTIjv7dITm9wV","1059911756007522304-hGD9KqzYIFgTAG0yOz8bMCgtmaMLa6","Y5tth0zDiVhufaMIYXSmEVldZmAmnB3u1ZCvkBHBxbFww" )

fluSznTweets <- searchTwitter('#fluszn', n=10000)
head(fluSznTweets)

fluSZNdf <- twListToDF(fluSznTweets)
head(fluSzndf)
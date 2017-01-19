# http://blog.haunschmid.name/use-r-to-connect-to-twitter-and-create-a-wordcloud-of-your-tweets/
#
# install.packages(c("wordcloud", "twitteR"))
library(twitteR)
library(wordcloud)
library(httr)
library(tm)

api_key <- "VLP1A7YUNVoXKf9T7jZxqIyp5"
api_secret <- "ueKqhyEuRR74UtJsjhYA1rudot65VHzkX3der8DX47Bhv8yXPH"
access_token <- "22907698-8470AMxuadpn1wb7zSdIq5qjEPSWwxW8PDrrThokL"
access_token_secret <-
        "x2IAXTerfsTUbWkQaVXt4WFAUfzzGF4823Wq03CIp6yVB"
oauth <-
        setup_twitter_oauth(api_key, api_secret,
                            access_token, access_token_secret)
myTweets <- userTimeline("imb_duk", n = 100)
set.seed(1234) # to always get the same wordcloud and for better reproducibility
tweetTexts <-
        unlist(lapply(myTweets, function(t) {
                t$text
        })) # to extract only the text of each status object
words <- unlist(strsplit(tweetTexts, " "))
words <- tolower(words)
# remove urls, usernames, hashtags and umlauts
# (the latter can not be displayed by all fonts)
clean_words <-
        words[-grep("http|@|#|ü|ä|ö", words)]
pal <- brewer.pal(7, "Spectral")
par(bg = "lightgrey")
wordcloud(
        clean_words,
        min.freq = 2,
        vfont = c("script", "plain"),
        colors = pal
)



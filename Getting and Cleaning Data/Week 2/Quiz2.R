setwd("C:/DataScienceCoursera/Getting and Cleaning Data/Week 2/")


##1
library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "c304f5b774126546815b",
                   secret = "3236fed8b1aa007b2002d31f9c737f6a334da06f")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)


##2 + 3 know MySQL so it was kinda easy..

#4
con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode

#5
data <- read.csv("getdata-wksst8110.for", header=T)
head(data)
dim(data)
file_name <- "getdata_wksst8110.for"
df <- read.fwf(file=file_name,widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
head(df)
sum(df[, 4])

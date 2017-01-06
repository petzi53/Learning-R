# Learn to prepare data for analysis with real (PIAAC)-data
# if (!dir.exists("./DATA")) {dir.create("./DATA")}
# fileAustria.sav <- "./DATA/Extended_PUF_PIAAC_STAT_AUT.sav"
# download.file(
#         url = "http://www.statistik.at/web_de/downloads/piaac/extended_puf_piaac_stat_aut.zip",
#         destfile = fileAustria.sav,
#         method = "curl",
#         quiet = TRUE,
#         cacheOK = TRUE
# )
# dateDownloadedAustria <- date()

# library("foreign")
# fileAustria.csv <- read.spss(fileAustria.sav)

temp <- tempfile()
download.file(
        "http://www.statistik.at/web_de/downloads/piaac/extended_puf_piaac_stat_aut.zip",
        temp,
        method = "curl"
)
# data <- read.table(unz(temp, "./DATA/Extended_PUF_PIAAC_STAT_AUT.sav"))
# unlink(temp)

library("foreign")
fileAustria.csv <- read.spss(unz(temp, "extended_puf_piaac_stat_aut.zip"))
unlink(temp)

url("http://www.statistik.at/web_de/downloads/piaac/extended_puf_piaac_stat_aut.zip",
    method = "libcurl")


library(memisc)
temp <- tempfile()
download.file(
        "http://www.statistik.at/web_de/downloads/piaac/extended_puf_piaac_stat_aut.zip",
        temp,
        method = "libcurl")
# data <- read.table(unz(temp, "Extended_PUF_PIAAC_STAT_AUT.sav"))
# unlink(temp)
data <- unzip(temp)
unlink(temp)
data1 <- as.data.set(spss.system.file(data))

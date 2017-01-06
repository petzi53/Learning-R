# Learn to prepare data for analysis with real (PIAAC)-data
if (!dir.exists("./DATA")) {dir.create("./DATA")}
setwd(paste0(getwd(),"/DATA"))

### Previous versions did not work:
### (1) download.file needs method "libcur" instead "curl"
###     This was (wrongly?) said in the Coursera lecture
### (2) neither package "rio" nor "foreign" worked
###     read.spss() of "foreign" package brought up two warnings
###     it seems that the implementation is pretty old

library(memisc)
temp <- tempfile()
download.file(
        url = "http://www.statistik.at/web_de/downloads/piaac/extended_puf_piaac_stat_aut.zip",
        destfile = temp,
        method = "libcurl")
dateDownloadedAustria <- date()
fileName <- unzip(temp)
unlink(temp)
## next command from package "memisc" brings a huge data.set into memory
data <- as.data.set(spss.system.file(fileName))
write.csv(data, "piaac_austria")
setwd("../")
## NOTE: huge data.set is very unhandy
## develop research question and check the codebook for relevant variables!

# Learn to prepare data for analysis with real (PIAAC)-data
setwd("/Users/petzi/Documents/_PB-Data/Programming/R/Learning-R/PIAAC")
if (!dir.exists("./DATA")) {dir.create("./DATA")}
setwd(paste0(getwd(),"/DATA"))

### Previous versions did not work:
### (1) download.file needs method "libcur" instead "curl"
###     This was (wrongly?) said in the Coursera lecture
### (2) neither package "rio" nor "foreign" worked
###     read.spss() of "foreign" package brought up two warnings
###     it seems that the implementation is pretty old


# getting extended PUF file about Austria from Statistik Austria
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
write.csv(data, "piaacAustria.csv")
setwd("../") # go back to PIACC directory
## NOTE: huge data.set is very unhandy
## develop research question and check the codebook for relevant variables!

# Getting all data files from OECD website
# Code example at StackOverflow:
# http://stackoverflow.com/questions/33790052/download-all-files-from-a-folder-on-a-website

setwd("/Users/petzi/Documents/_PB-Data/Programming/R/Learning-R/PIAAC")
myDir <- getwd()
if (!dir.exists("./DATA/OECD")) {dir.create("./DATA/OECD")}
setwd(paste0(getwd(),"/DATA/OECD"))
## oecd url
oecdUrl <- "http://vs-web-fs-1.oecd.org/piaac/puf-data/CSV/"
## base url
baseUrl <- "http://vs-web-fs-1.oecd.org"
## query the url to get all the file names ending in '.csv'
myUrls <- XML::getHTMLLinks(
        oecdUrl,
        xpQuery = "//a/@href['.csv'=substring(., string-length(.) - 3)]"
)
## create all the new files
myFiles <- basename(myUrls)
file.create(myFiles)
## download them all
lapply(paste0(oecdUrl,myFiles), function(x) download.file(x, basename(x)))
## reset working directory to original
setwd(myDir)
# ------------------------------------------------------------------------------

### Download Background variales
### Excel notebook with many sheets
setwd("/Users/petzi/Documents/_PB-Data/Programming/R/Learning-R/PIAAC")
myDir <- getwd()
if (!dir.exists("./DATA")) {dir.create("./DATA")}
setwd(paste0(getwd(),"/DATA"))
fileUrl <-
        "http://www.oecd.org/skills/piaac/PIAAC_Background_Compendium_Round1_15Sept2016_annotated.xlsx"
download.file(
        fileUrl,
        destfile = "background_1.xlsx",
        method = "libcurl",
        quiet = TRUE,
        cacheOK = FALSE
)
dateDownloadedBackground.1 <- date()
# ---------------- Load Excel with different sheets  ---------------------------
library(readxl)
excelSheetNames <- excel_sheets("background_1.xlsx")
# To load all sheets in a workbook, use lapply
sheetList <- lapply(
                excel_sheets("background_1.xlsx"),
                read_excel,
                path = "background_1.xlsx",
                skip = 1,
                col_names = TRUE
)
setwd("/Users/petzi/Documents/_PB-Data/Programming/R/Learning-R/PIAAC")
myDir <- getwd()
if (!dir.exists("./DATA/compendia")) {dir.create("./DATA/compendia")}
setwd(paste0(getwd(),"/DATA/compendia"))
for (i in 3:length(sheetList)) {
        fwrite(sheetList[[i]], paste0(excelSheetNames[i], ".csv"))
}
setwd(myDir)

# -----------------------------------------------------------------------------
## After solving Java problem: I can also other packages:
## xlsx, XLConnect, openxls and compare it to readxl

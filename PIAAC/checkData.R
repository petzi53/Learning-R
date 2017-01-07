### Learn how to use these huge data files
### I am concentrating on the PUF Austrian data files
### (a) the extended version provided by Statistik Austria "piaacAustria.csv"
### (b) the OECD version "prgautp1.csv" resp- "piaacOECD.csv
### Looking into the files: piaacAustria is better prepared, for example:
###  - na values are "NA"
###  - gender_r is not 1 and 2 but MALE and FEMALE

library("dplyr")
library("readr")
f1 <- read_csv("piaacAustria.csv")       # read the file as tbl into memory
class(f1)                                # = tbl_df, tbl, data.frame
col.spec <- spec_csv("piaacAustria.csv") # read the specs of the columns
col.spec[1]$cols$gender_r                # get type of column "gender_r
col.names <- colnames(f1)                #  get char vector of column names
tally(group_by(f1, gender_r))            # counts obs (gender) by group
f1 %>% count(gender_r)                   # counts obs by group, the same as bevor
f1 %>% count(j_q08)                      # more interesting: no. of owned books
by_gender <- group_by(f1, gender_r)      # group data by gender
by_gender %>% count(j_q08)               # owned book by gender
group_by(f1, gender_r) %>% count(j_q08)  # the same with shortened syntax

by.books <- f1 %>% group_by((j_q08))
# colnames(by.books$j_q08) <- "books"
by.books %>% summarise(n = n(),
                "%" = round(n() / nrow(by.books) * 100, digits = 2))
books.owned <- by.books %>% summarise(n = n(),
                "%" = round(n() / nrow(by.books) * 100, digits = 2))
# colnames(books.owned)[1] <- "Books"                         # just one column
# colnames(books.owned)[c(1, 3)] <- c("Books", "Perc.")       # some columns
colnames(books.owned) <- c("Books", "N", "Percent")       # all columns
books.owned
# -----------------------------------------------------------------------------
# books owned by gender
books.by.gender <- f1 %>% group_by(gender_r, j_q08)
books.by.gender %>% summarise(n = n(),
                       "%" = round(n() / nrow(by.books) * 100, digits = 2))



###############################################################################

# ----------------------       data.table vs. dplyr        ---------------------

# ---------------------- (1) data.table ----------------------
# data.table version of iris: DT
DT <- as.data.table(iris)

# Group the specimens by Sepal area (to the nearest 10 cm2)
# and count how many occur in each group
# and name the output columns `Area` and `Count`
DT[, .(Count <- .N), by = .(Area = 10 * round(Sepal.Length * Sepal.Width / 10))]

# ---------------------- (2) dplyr --------------------------
### # tbl (dplyr) version of iris:
TBL <- as.tbl(iris)

# Group the specimens by Sepal area (to the nearest 10 cm2)
# and count how many occur in each group
# and name the output columns `Area` and `Count`
count(TBL, "Area" = 10 * round(Sepal.Length * Sepal.Width / 10))

# -----   FAZIT: I like dplyr more, it is easier and more intuitive>!  --------

###############################################################################

# ---------------------------------------------------------------------------

myTbl <- as.tbl(iris)
class(myTbl)
by_area <- group_by(myTbl, 10 * round(Sepal.Length * Sepal.Width / 10))
by_area
x <- transmute(myTbl, area = 10 * round(Sepal.Length * Sepal.Width / 10))
count(group_by(myTbl, area = 10 * round(Sepal.Length * Sepal.Width / 10)))
filter(myTbl, by_area)


### the oecd file has 2 cols more than the "extended" Austrian version
### [A]: What are these two columns? How to detect the difference?


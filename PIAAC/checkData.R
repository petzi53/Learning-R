### Learn how to use these huge data files
### I am concentrating on the PUF Austrian data files
### (a) the extended version provided by Statistik Austria "piaacAustria.csv"
### (b) the OECD version "prgautp1.csv" resp- "piaacOECD.csv
### Looking into the files: piaacAustria is better prepared, for example:
###  - na values are "NA"
###  - gender_r is not 1 and 2 but MALE and FEMALE

library("data.table")
f1 <- fread("piaacAustria.csv")
f2 <- fread("piaacOECD.csv")
dim(f1); dim(f2)
f1[, gender_r, j_q08]
### f1[, .(Geschlecht = f1 %>% count(gender_r), by = .(j_q08)) ]

library("dplyr")
f1 <- tbl("piaacAustria.csv")
tally(group_by(f1, gender_r))
f1 %>% count(gender_r)
f1 %>% count(j_q08)

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


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

library(dplyr) # but how to do with data.table?
tally(group_by(f1, gender_r))
f1 %>% count(gender_r)

### the oecd file has 2 cols more than the "extended" Austrian version
### [A]: What are these two columns? How to detect the difference?


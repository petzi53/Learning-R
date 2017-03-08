# Example preprocessing script.
first.letter.counts <- ddply(letters, c('FirstLetter'), nrow)
second.letter.counts <- ddply(letters, c('SecondLetter'), nrow)
anzahl.erster.buchstabe <- dplyr::count(letters, FirstLetter)
anzahl.zweiter.buchstabe <- dplyr::count(letters, SecondLetter)

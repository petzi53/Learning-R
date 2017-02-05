OpenIntro Statistics: Introduction to data
================
Peter Baumgartner
2017-02-05

-   [Data basics](#data-basics)
    -   [Get the data](#get-the-data)
    -   [Explore the data](#explore-the-data)
-   [Summaries and tables](#summaries-and-tables)

Data basics
===========

Get the data
------------

The Behavioral Risk Factor Surveillance System (BRFSS) is an annual telephone survey of 350,000 people in the United States. The [BRFSS Web site](http://www.cdc.gov/brfss) contains a complete description of the survey, including the research questions that motivate the study and many interesting results derived from the data.

Load the data set from the [OpenIntro Website](http://www.openintro.org/stat/data/cdc.R).

-   Have a look at the data in the browser to get a feeling of the raw data.
-   Load the data set into R. As it is a big file (2.1 MB) check if it is already loaded into memory:

``` r
> if (!exists("cdc")) {source("http://www.openintro.org/stat/data/cdc.R")}
```

The data set `cdc` that shows up in your workspace is a data matrix, with each row representing a case and each column representing a variable. R calls this data format a data frame, which is a term that will be used throughout the labs.

But I will convert all data frames into to a `tibbles`. This has some advantages, explained in [R for Data Science](http://r4ds.had.co.nz/tibbles.html)

-   It never changes an input’s type (i.e., no more stringsAsFactors = FALSE!).
-   It never adjusts the names of variables (i.e. you can create names with blanks)
-   It evaluates its arguments lazily and sequentially (i.e. you can calculate `y` from values of x during the creation)
-   It never uses `row.names()`. The whole point of tidy data is to store variables in a consistent way. So it never stores a variable as special attribute.
-   It only recycles vectors of length 1. This is because recycling vectors of greater lengths is a frequent source of bugs.
-   When you print a tibble, it only shows the first ten rows and all the columns that fit on one screen. It also prints an abbreviated description of the column type.
-   Tibbles are quite strict about subsetting. `[` always returns another tibble whereas d data frame sometimes returns a data frame and sometimes it just returns a vector.
-   Tibbles are also stricter with $. as they never do partial matching (a common source of error).
-   Tibbles ignore the drop argument.

Therefore I will call the matrix organisation of the data set "tibble" or abbreviated "tbl".

``` r
> library(tidyverse)
> CDC <- tbl_df(cdc)
> class(cdc)
```

    [1] "data.frame"

``` r
> class(CDC)
```

    [1] "tbl_df"     "tbl"        "data.frame"

"cdc" (with small letters) has class "data.frame", whereas "CDC" (with capital letters) now have "tbl\_df, tbl, data.frame" e.g. three classes at the same time to secure full compatiblity with data frames.

Explore the data
----------------

After loading the data and converting it into a tibble, one should inspect the data to get some understanding about the structure and content. Common funtions for these tasks are:

-   `<name-of-data-tibble>`: Display the first 10 rows and all columns that fit on one screen. It also prints an abbreviated description of the column type.
-   `head(<name-of-df>)`, `tail(<name-of-df>)`: Return the first or last part. Use these commands if it is not a tibble but a data frame
-   `dim()`: Retrieve the dimension
-   `names()`: Get the names
-   `str()`: Display compactly the internal structure
-   `glimpse()`: is the `dplyr`-version of `str()` showing values of each variable the whole sceen width, but does not display the number of levels and names of factor variables. But this feature of `str()` cannot be displayed completly with either many or long levels names.
-   `View()`: With [RStudio](https://www.rstudio.com/) you can see and inspect the data set comfortably. The `View()` function invokes a spreadsheet-style data viewer.

You can see and inspect the data set comfortably in RStudio with the `View()` command, which invokes a spreadsheet-style data viewer on a matrix-like R object.

``` r
> CDC
```

    # A tibble: 20,000 × 9
         genhlth exerany hlthplan smoke100 height weight wtdesire   age gender
    *     <fctr>   <dbl>    <dbl>    <dbl>  <dbl>  <int>    <int> <int> <fctr>
    1       good       0        1        0     70    175      175    77      m
    2       good       0        1        1     64    125      115    33      f
    3       good       1        1        1     60    105      105    49      f
    4       good       1        1        0     66    132      124    42      f
    5  very good       0        1        0     61    150      130    55      f
    6  very good       1        1        0     64    114      114    55      f
    7  very good       1        1        0     71    194      185    31      m
    8  very good       0        1        0     67    170      160    45      m
    9       good       0        1        1     65    150      130    27      f
    10      good       1        1        0     70    180      170    44      m
    # ... with 19,990 more rows

``` r
> head(CDC)
```

    # A tibble: 6 × 9
        genhlth exerany hlthplan smoke100 height weight wtdesire   age gender
         <fctr>   <dbl>    <dbl>    <dbl>  <dbl>  <int>    <int> <int> <fctr>
    1      good       0        1        0     70    175      175    77      m
    2      good       0        1        1     64    125      115    33      f
    3      good       1        1        1     60    105      105    49      f
    4      good       1        1        0     66    132      124    42      f
    5 very good       0        1        0     61    150      130    55      f
    6 very good       1        1        0     64    114      114    55      f

``` r
> tail(CDC)
```

    # A tibble: 6 × 9
        genhlth exerany hlthplan smoke100 height weight wtdesire   age gender
         <fctr>   <dbl>    <dbl>    <dbl>  <dbl>  <int>    <int> <int> <fctr>
    1      good       0        1        1     69    224      224    73      m
    2      good       1        1        0     66    215      140    23      f
    3 excellent       0        1        0     73    200      185    35      m
    4      poor       0        1        0     65    216      150    57      f
    5      good       1        1        0     67    165      165    81      f
    6      good       1        1        1     69    170      165    83      m

``` r
> dim(CDC)
```

    [1] 20000     9

``` r
> names(CDC)
```

    [1] "genhlth"  "exerany"  "hlthplan" "smoke100" "height"   "weight"  
    [7] "wtdesire" "age"      "gender"  

``` r
> str(CDC)
```

    Classes 'tbl_df', 'tbl' and 'data.frame':   20000 obs. of  9 variables:
     $ genhlth : Factor w/ 5 levels "excellent","very good",..: 3 3 3 3 2 2 2 2 3 3 ...
     $ exerany : num  0 0 1 1 0 1 1 0 0 1 ...
     $ hlthplan: num  1 1 1 1 1 1 1 1 1 1 ...
     $ smoke100: num  0 1 1 0 0 0 0 0 1 0 ...
     $ height  : num  70 64 60 66 61 64 71 67 65 70 ...
     $ weight  : int  175 125 105 132 150 114 194 170 150 180 ...
     $ wtdesire: int  175 115 105 124 130 114 185 160 130 170 ...
     $ age     : int  77 33 49 42 55 55 31 45 27 44 ...
     $ gender  : Factor w/ 2 levels "m","f": 1 2 2 2 2 2 1 1 2 1 ...

``` r
> glimpse(CDC)
```

    Observations: 20,000
    Variables: 9
    $ genhlth  <fctr> good, good, good, good, very good, very good, very g...
    $ exerany  <dbl> 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0,...
    $ hlthplan <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1,...
    $ smoke100 <dbl> 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1,...
    $ height   <dbl> 70, 64, 60, 66, 61, 64, 71, 67, 65, 70, 69, 69, 66, 7...
    $ weight   <int> 175, 125, 105, 132, 150, 114, 194, 170, 150, 180, 186...
    $ wtdesire <int> 175, 115, 105, 124, 130, 114, 185, 160, 130, 170, 175...
    $ age      <int> 77, 33, 49, 42, 55, 55, 31, 45, 27, 44, 46, 62, 21, 6...
    $ gender   <fctr> m, f, f, f, f, f, m, m, f, m, m, m, m, m, m, m, m, m...

``` r
> # View(CDC)
```

The tibble has 2000 observations (= rows) with 9 variables (columns). Each one of these variables corresponds to a question that was asked in the survey:

1.  `genhlth`: respondents were asked to evaluate their general health, responding either excellent, very good, good, fair or poor.
2.  `exerany`: indicates whether the respondent exercised in the past month (1) or did not (0).
3.  `hlthplan`: indicates whether the respondent had some form of health coverage (1) or did not (0).
4.  `smoke100`: indicates whether the respondent had smoked at least 100 cigarettes in her lifetime.
5.  `height`: in inches
6.  `weight`: in pounds
7.  `wtdesire`: desired weight
8.  `age` in years
9.  `gender`: "m" or "f"

Exercise 1  
How many cases are there in this data set? How many variables? For each variable, identify its data type (e.g. categorical, discrete).

**My Solution**:

1.  There are 20000 cases (= observations) and 9 variables in the CDC data set.

2.  `genhlth`: excellent, very good, good, fair or poor = categorial
3.  `exerany`: past month (1) or not (0) = categorial
4.  `hlthplan`: some form of health coverage (1) or not (0) = categorial
5.  `smoke100`: had smoked at least 100 cigarettes in her lifetime = categorial
6.  `height`: in inches = continous
7.  `weight`: in pounds = continous
8.  `wtdesire`: desired weight = continuos
9.  `age` in years = discrete
10. `gender`: "m" or "f" = categorial

Summaries and tables
====================

A good first step in any analysis is to distill all of that information into a few summary statistics and graphics. As a simple example, the function summary returns a numerical summary: minimum, first quartile, median, mean, second quartile, and maximum. For weight this is:

``` r
> summary(CDC$weight)
```

       Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
       68.0   140.0   165.0   169.7   190.0   500.0 

`dplyr` does not have its own special methods for R summary function (see last sentence of vignette [Introduction to dplyr](https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html). But you can use the R base functions with `dplyr` and some other extra functions supplied by `dplyr`. Besides functions in base R like `min()`, `max()`, `mean()`, `sum()`, `sd()`, `median()`, and `IQR()`. dplyr provides a handful of others:

-   `n()`: the number of observations in the current group
-   `n_distinct(x)`:the number of unique values in x.
-   `first(x)`, `last(x)` and \`nth(x, n) - these work similarly to x\[1\], x\[length(x)\], and x\[n\] but give you more control over the result if the value is missing.

``` r
> summarise(CDC, Min. = min(weight), "1st Qu." = quantile(weight, probs = 0.25), Median = median(weight), Mean = mean(weight), "3rd Qu." = quantile(weight, probs = 0.75), Max = max(weight))
```

    # A tibble: 1 × 6
       Min. `1st Qu.` Median    Mean `3rd Qu.`   Max
      <int>     <dbl>  <dbl>   <dbl>     <dbl> <int>
    1    68       140    165 169.683       190   500

The `dplyr`-equivalent of base R `summary()` is more complex, but has more control about functions used, their names in the table, their sequence etc. So we could add for instance `sd()`, `var()`, `IQR()`. To get these extra values with the base R functions one would have to be write different lines of code.

``` r
> summarise(CDC, Min. = min(weight), "1st Qu." = quantile(weight, probs = 0.25), Median = median(weight), Mean = mean(weight), "3rd Qu." = quantile(weight, probs = 0.75), Max = max(weight), Var = var(weight), SD = sd(weight), IQR = IQR(weight))
```

    # A tibble: 1 × 9
       Min. `1st Qu.` Median    Mean `3rd Qu.`   Max      Var       SD   IQR
      <int>     <dbl>  <dbl>   <dbl>     <dbl> <int>    <dbl>    <dbl> <dbl>
    1    68       140    165 169.683       190   500 1606.484 40.08097    50

But the great advantage for `summarise()` lies int the combination with the `group_by()` function of `dplyr` (see the examples in the [Introduction to dplyr](https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html) vignette.)

While it makes sense to describe a quantitative variable like `weight` in terms of these statistics, what about categorical data? We would instead consider the sample frequency or relative frequency distribution. The function table does this for you by counting the number of times each kind of response was given. For example, to see the number of people who have smoked 100 cigarettes in their lifetime or instead look at the relative frequency distribution.

``` r
> table(CDC$smoke100)
```


        0     1 
    10559  9441 

``` r
> table(CDC$smoke100) / 20000
```


          0       1 
    0.52795 0.47205 

Notice how R automatically divides all entries in the table by 20,000 in the command above. This is similar to something we observed in the Introduction to R; when we multiplied or divided a vector with a number, R applied that action across entries in the vectors. As we see above, this also works for tables.

But the outcome of the `table()` command is class "table" which is not so easy to work with as a data frame or a tibble. (See the article on [R-bloggers](https://www.r-bloggers.com/how-to-get-the-frequency-table-of-a-categorical-variable-as-a-data-frame-in-r/).) It is better to use the `count()` function of `dplyr`, because it adds the column names and returns – as all dply-functions — a tibble. Furthermore the relative frequency distribution (the propoartion) can be added as a new column in one command.

``` r
> CDC %>% 
+         count(smoke100) %>%
+         mutate(prop = n / 20000)
```

    # A tibble: 2 × 3
      smoke100     n    prop
         <dbl> <int>   <dbl>
    1        0 10559 0.52795
    2        1  9441 0.47205

Next, we make a bar plot of the entries in the table by putting the table inside the `barplot()` command.

``` r
> barplot(table(CDC$smoke100))
```

![](01-Intro-to-data_files/figure-markdown_github/generate-a-barplot-1.png) Notice what we’ve done here! We’ve computed the table of cdc$smoke100 and then immediately applied the graphical function, barplot. This is an important idea: R commands can be nested. You could also break this into two steps by typing the following:

``` r
> smoke <- table(CDC$smoke100)
> 
> barplot(smoke)
```

![](01-Intro-to-data_files/figure-markdown_github/generate-a-barplot-from-a-table-object-1.png)

Here, we’ve made a new object, a table, called `smoke` (the contents of which we can see by typing `smoke` into the console) and then used it in as the input for barplot. The special symbol `<-` performs an assignment, taking the output of one line of code and saving it into an object in your workspace.

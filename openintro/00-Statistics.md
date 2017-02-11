OpenIntro Statistics: Material and my learning strategies
================
Peter Baumgartner
2017-02-05

-   [OpenIntro Statistics](#openintro-statistics)
    -   [Additional material](#additional-material)
    -   [My learning strategy](#my-learning-strategy)
-   [Introduction to R](#introduction-to-r)
    -   [Reproducibility with R Markdown](#reproducibility-with-r-markdown)
    -   [Task \[open\]: Investige template](#task-open-investige-template)
-   [Summary](#summary)

OpenIntro Statistics
====================

I am going to use the free material of the [OpenIntro Statistics](https://www.openintro.org/stat/textbook.php?stat_book=os) course to repeat the basics of statistics but by using R as programming language.

Additional material
-------------------

The textbooks comes with many additional resources:

-   [Videos](https://www.openintro.org/stat/videos.php)
-   Many Exercises at the end of the chapters: With solution of all odd-numbered in the annex. (But one can apply as teacher to get all solutions)
-   [Interactive Labs with R](https://www.openintro.org/stat/labs.php)
-   Several R Packages:
    -   [openintro](https://cran.r-project.org/web/packages/openintro/index.html): OpenIntro data sets and supplemental functions. [PDF manual](https://cran.r-project.org/web/packages/openintro/openintro.pdf))
    -   [OIdata](https://cran.r-project.org/web/packages/OIdata/index.html): Data sets and supplements (OpenIntro). [PDF manual](https://cran.r-project.org/web/packages/OIdata/OIdata.pdf)
    -   [oilabs](https://github.com/OpenIntroOrg/oilabs) An R package that contains the data sets, custom functions, documentation, and templates for the OpenIntro Labs.
-   [Free course on datacamp.com](https://www.datacamp.com/community/open-courses/statistical-inference-and-data-analysis) Data Analysis and Statistical Inference
-   Github source files to work interactively:
    -   [OpenIntro Statistics labs with base R](https://github.com/andrewpbray/oiLabs-base-R): Contentrates on base R functions and packages
    -   [OpenIntro Statistics labs with dplyr and ggplot2](https://github.com/andrewpbray/oiLabs-dplyr-ggplot): OpenIntro Labs in R using the `dplyr` and `ggplot` syntax for data manipulation.
-   [Coursera](https://www.coursera.org/specializations/statistics#courses): And last not least there is also a Coursera course specialisation (5 courses).

My learning strategy
--------------------

I plan to take the chapters in several overlapping rounds:

-   I will follow the text and experiment with the data on my own. Here I will give special attention in using function from the tidyverse-packages.
-   I will follow the text for the R labs
-   And I will complete the course on Datacamp.com.

I am not sure, if this various approaches are effective or too much of the same. But I will at least try out all of these different learning possiblities.

I will start with the [github labs tutorial](http://htmlpreview.github.io/?https://github.com/andrewpbray/oiLabs-base-R/blob/master/intro_to_data/intro_to_data.html).

> **Attention**: I will provide "My Solutions" of the assignments, but please keep in mind: I am learning and therefore my solutions could be inadequat or wrong.

Introduction to R
=================

I am using the for this introduction my forked file of the `dplyr`and `ggplot` lab version: [Intro to R](https://github.com/petzi53/oiLabs-dplyr-ggplot/blob/master/01_intro_to_r/intro_to_r.Rmd).

``` r
> library(dplyr)
> library(ggplot2)
> library(oilabs)
```

As the labs progress, you are encouraged to explore beyond what the labs dictate; a willingness to experiment will make you a much better programmer. \[Exactly this is was I am trying to do with my Rmarkdown files.\] Before we get to that stage, however, you need to build some basic fluency in R. Today we begin with the fundamental building blocks of R and RStudio: the interface, reading in data, and basic commands.

For this lab, and many others in the future, we will use the following R packages:

-   `dplyr`: for data wrangling
-   `ggplot2`: for data visualization
-   `oilabs`: for data and custom functions with the OpenIntro labs

Reproducibility with R Markdown
-------------------------------

It is vital that every report is reproducible. This can't be done with two separate approaches (e.g. Word document on the one hand and a programming language like R on the other hand). Instead one should use R Markdown for labs report. See for this argument also the video on YouTube [Why use R Markdown for Lab Reports?](https://www.youtube.com/watch?v=lNWVQ2oxNho&feature=youtu.be).

How to use R Markdown document especially for the OpenIntro labs is explained in another video [Using R Markdown for Lab Reports in RStudio](https://www.youtube.com/watch?v=o0h-eVABe9M&feature=youtu.be). There is also a special template provided for the OpenIntro exercises.

Task \[open\]: Investige template
---------------------------------

The special template provided by the oilabs package is a good opportunity to investigate the details how this template is produced and called from the oilabs package.

Summary
=======

I am now going to change to the `oilabs` template and to continue with the [Dr. Arbuthnot's Baptism Records](https://github.com/petzi53/oiLabs-dplyr-ggplot/blob/master/01_intro_to_r/intro_to_r.Rmd#dr-arbuthnots-baptism-records).

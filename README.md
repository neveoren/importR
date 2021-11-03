
# importR

![](importimage.png)

The goal of importR is to create an R data frame from 
external data in SAS, SPSS, or Stata bionary files, Excel
Workbooks, or delimited text files

## Installation

You can install importR from  with:

``` r
if(!require("remotes")){
  install.packages("remotes")
  library("remotes"")
}
remotes::install_github("neveoren/importR")
```

## Example

You can import a data file using 

``` r
library(importR)
mydata <- import()
```


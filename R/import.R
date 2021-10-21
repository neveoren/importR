#'@title Import a dataset
#'
#'@description
#'the import function can import data from
#'delimited text files, EXCEL spreadsheets, and
#'statistical packages such as SAS, SPSS, and Stata.
#'
#'@param file datafile to import. If missing, the user
#'is prompted to select a file interactively.
#'@param ... parameters pass to the import functio. See details
#'below.
#'
#'@return a data frame
#'
#'@details
#'put details in here!
#'
#'@export
#'
#'@importFrom haven read_sas read_spss read_stata
#'@importFrom readxl read_excel
#'@import vroom
#'@importFrom tools file_ext
#'
#'@examples
#'\dontrun{
#'# import a comma delimited file
#'mydataframe <- import("mydata.csv")
#'
#'# import a SAS binary datafile
#'mydataframe <- import("mydata.sas")
#'
#'# import the second worksheet of an excel workbook
#'mydataframe <- import("mydata.xlsx", sheet = 2)
#'
#'# prompt for a file to import
#'mydataframe <- import()
#'}

import <- function(file, ...){

  # if no file specified, prompt user

  if(missing(file))
    file <- file.choose()


  # get file info

  file <- tolower(file)
  basename <- basename(file)
  extension <- tools::file_ext(file)


  # import dataset

  df <- switch(extension,
               "sas7bdat" = haven::read_sas(file, ...),
               "dta" = haven::read_stata(file, ...),
               "sav" = haven::read_spss(file, ...),
               "xlsx" = readxl::read_excel(file, ...),
               "xls" = readxl::read_excel(file, ...),
               vroom::vroom(file, ...)
  )

  # return data frame
  return(df)

}

 install.packages("vroom")
library(vroom)
 
getwd()

newi <- vroom("C:/Users/Oyeladun.Oluwamuyiwa/OneDrive - Church Army/Documents/internship/com-highlights/data/inputs/census/com/csvs/A7/A7-ethn.csv")



library(data.table)
setwd("C:/Users/Oyeladun.Oluwamuyiwa/OneDrive - Church Army/Documents/internship/com-highlights/data/inputs/census/com")
files <- list.files(path = "csvs/Attercliffe-and-Darnall/" , pattern = ".csv", full.names = TRUE)
temp <- lapply(files, fread)
#read.csv("temp", header = TRUE)
temp

get_files <- function(folder){
  here("data", "inputs", "census", "com", folder, c("file1.csv", "file2.csv", "etc.csv"))
}

com_name_newdir <- function(folder){
  folder <- here("data", "inputs", "census", "com", "temp", "csvs"[c("1":"32")])
  temp %>% folder
}
com_name_newdir()

## Where is this code behaving unexpectedly?
folder <- here(list.files(path = "csvs", pattern = ".csv", full.names = TRUE))


here(  "data", "inputs", "census", "com", "temp", "csvs"[1:32]  )

top_level_dirs <- list.dirs(
  here("data", "inputs", "census"),
  full.names = TRUE,
  recursive = FALSE
  )

csv_dirs <- file.path(top_level_dirs, "csvs")
names(csv_dirs) <- c("com", "dioceses", "nations")

csv_dirs <- as.list(csv_dirs)

csv_sub_dirs      <- map(csv_dirs, dir, full.names = TRUE)
csv_sub_dir_names <- map(csv_dirs, dir, full.names = FALSE)

csv_sub_dirs <- map2(csv_sub_dirs, csv_sub_dir_names,
     function(x, y){
       list_out <- as.list(x)
       names(list_out) <- y
       
       return(list_out)
     })

## For each of these list elements, make a character vector of the paths to the five files within the directory

# csv_paths <- 
  map(csv_sub_dirs,
      map,
      function(x) return(x)
      )

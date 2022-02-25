# created by Saskia Otto
# latest update 12/11/2021

packages <- c("httr")
package_loader <- function(x){
    for (i in 1:length(x)){
        if (!identical(x[i], installed.packages()[x[i],1])){
            install.packages(x[i], dep = TRUE)
        }
    }
}
suppressWarnings(package_loader(packages))

# Function to install individual DSB - DS1 courses
install_dsb_courses <- function(courses) {
  courses_zip <- paste0(courses, ".swc.zip")
  courses_swc <- paste0(courses, ".swc")
  get_course_path <- function(){
    tryCatch(swirl:::swirl_courses_dir(),
      error = function(c) {file.path(find.package("swirl"),"Courses")}
    )
  }
  for (i in 1:length(courses)) {
    url <- paste0("https://saskiaotto.github.io/bio-bsc-data-science-1/swirl/", courses_zip[i])
    response <- httr::GET(url, httr::progress())
    path_zip <- file.path(get_course_path(), "temp.zip")
    writeBin(httr::content(response, "raw"), path_zip)
    swirl::install_course_zip(path_zip, multi = FALSE)
    unlink(path_zip, force = TRUE)
    path_swc <- file.path(get_course_path(), courses_swc[i])
    swirl::install_course(swc_path = path_swc)
    unlink(path_swc, force = TRUE)
  }
}

# Install all 5 courses
install_dsb_courses(courses = c(
  "DS1-01-R_Grundlagen",
  "DS1-02-Deskriptive_Statistik_mit_R",
  "DS1-03-Datenaufbereitung_oder_per_Anleitung_durchs_Tidyversum",
  "DS1-04-Datenvisualisierung_mit_ggplot2",
  "DS1-05-Handling_spezieller_Datentypen")
)


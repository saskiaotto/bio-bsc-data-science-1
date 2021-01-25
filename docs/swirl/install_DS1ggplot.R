install_dsb_course <- function(){

  swirl::install_course_url("https://saskiaotto.github.io/bio-bsc-data-science-1/swirl/daten-vis-ggplot2.swc.zip")
  get_course_path <- function(){
    tryCatch(swirl:::swirl_courses_dir(),
             error = function(c) {file.path(find.package("swirl"),"Courses")}
    )
  }
  path <- file.path(get_course_path(), "daten-vis-ggplot2.swc")
  swirl::install_course(swc_path = path)
  unlink(path)

}

install_dsb_course()
rm(install_dsb_course)

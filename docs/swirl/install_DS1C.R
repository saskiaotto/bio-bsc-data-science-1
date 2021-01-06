install_dsb_course <- function(){

    swirl::install_course_url("https://saskiaotto.github.io/bio-bsc-data-science-1/swirl/UHH-DSB-Data_Science_1C.swc.zip")
    scd <- getOption("swirl_courses_dir")
    if (is.null(scd)) {
        scd <- file.path(find.package("swirl"), "Courses")
    }
    path <- file.path(scd, "UHH-DSB-Data_Science_1C.swc")
    swirl::install_course(swc_path = path)
    unlink(path)

}

install_dsb_course()
rm(install_dsb_course)

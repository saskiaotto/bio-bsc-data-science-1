install_dsb_course <- function(){

    install_course_url("https://saskiaotto.github.io/bio-bsc-data-science-1/swirl/UHH-DSB-Data_Science_1C.swc.zip")
    path <- file.path(swirl_courses_dir(), "UHH-DSB-Data_Science_1C.swc")
    install_course(swc_path = path)
    unlink(path)
}

install_dsb_course()
rm(install_dsb_course)

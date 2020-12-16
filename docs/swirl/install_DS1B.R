install_DS1 <- function(){
  writeLines(strwrap("Jetzt werden die swirl-Kursdateien fuer das erste DS Modul runtergeladen. Diese Dateien mit der Endung .swc sind fuer die Nutzung der Kurse nicht erforderlich, Du kannst sie nach der Installation loeschen. \n\nEs hat sich ein neues Fenster geoeffnet.  Waehle dort einen beliebigen Speicherort fuer die Dateien. (Das Fenster oeffnet sich evtl. hinter Deinem RStudio-Fenster)"));
  choose_directory = function(caption = 'Select data directory') {
    if (exists('utils::choose.dir')) {
      choose.dir(caption = caption)
    } else {
      library("tcltk")
      tk_choose.dir(caption = caption)
    }
  };
  target_folder <- choose_directory();
  course_list <- c("UHH-DSB-Data_Science_1B");
  for(i in seq_along(course_list)){
    download.file(url = paste0("https://saskiaotto.github.io/bio-bsc-data-science-1/swirl/", course_list[i], ".swc"), destfile = paste0(target_folder, "/", course_list[i], ".swc"), mode = "wb")
  };
  if(!length(unique((installed.packages()[,1] == "swirl"))) == 2){install.packages("swirl")};
  library(swirl);
  for(i in seq_along(course_list)){
    install_course(swc_path = paste0(target_folder, "/", course_list[i], ".swc"))
  };
  swirl(select_language(language = "german"))
}

install_DS1()

rm(install_DS1)

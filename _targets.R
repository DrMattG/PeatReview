library(targets)
source(paste0(here::here(),"/R/functions.R"))
#source("R/functions.R")
options(tidyverse.quiet = TRUE)
tar_option_set(packages = c("tidyverse", "bibliometrix", "here"))

Sys.setenv(TAR_WARN = "false")

list(
  tar_target(
    filelist,
    list.files(paste0(here::here(),"/data/"),
               pattern = ".txt",full.names = TRUE)
    ),
  tar_target(
    all_corpus,
    create_corpus(files=(c(filelist[1],filelist[2],filelist[3],filelist[4],filelist[5],filelist[6],filelist[7],filelist[8],filelist[9],filelist[10],
          filelist[11],filelist[12],filelist[13],filelist[14],filelist[15],filelist[16],filelist[17],filelist[18],filelist[19],filelist[20],filelist[21], filelist[22])))
  ),
  tar_target(
    Agri_corpus,
    create_corpus(files = c(filelist[1]))
  ),
  tar_target(
    Carb_acc_corpus,
    create_corpus(files = c(filelist[2], filelist[3]))
  ),
  tar_target(
    clim_corpus,
    create_corpus(files = c(filelist[4], filelist[5]))
  ),
  tar_target(
    Drain_corpus,
    create_corpus(files = c(filelist[6],filelist[7],filelist[8],filelist[9]))
  ),
  tar_target(
    F_on_P_corpus,
    create_corpus(files = c(filelist[10]))
  ),
  tar_target(
    Gas_corpus,
    create_corpus(files = c(filelist[11],filelist[12]))
  ),
  tar_target(
    Hydrology_corpus,
    create_corpus(files = c(filelist[13],filelist[14]))
  ),
  tar_target(
    Peat_RM_corpus,
    create_corpus(files = c(filelist[16],filelist[18], filelist[19], filelist[20]))
  ),
  tar_target(
    Peat_acc_corpus,
    create_corpus(files = c(filelist[21],filelist[22],filelist[23],filelist[24], filelist[25],filelist[26]))
  ),

  tar_target(
    all_wordC,
    create_wordcloud(all_corpus)
  ),
  tar_target(
    words_agr,
    get_cluster_words(Agri_corpus)
  ),
  tar_target(
    words_Carb,
    get_cluster_words(Carb_acc_corpus)
  ),
  tar_target(
    words_clim,
    get_cluster_words(clim_corpus)
  ),
  tar_target(
    words_Drain,
    get_cluster_words(Drain_corpus)
  ),
  tar_target(
    words_F_on_P,
    get_cluster_words(F_on_P_corpus)
  ),
  tar_target(
    words_Gas,
    get_cluster_words(Gas_corpus)
  ),
  tar_target(
    words_hydro,
    get_cluster_words(Hydrology_corpus)
  ),
  tar_target(
    words_Peat_acc,
    get_cluster_words(Peat_acc_corpus)
  ),
  tar_target(
    words_Peat_RM,
    get_cluster_words(Peat_RM_corpus)
  ),
  tar_target(
    Agri_papers,
    get_list_of_papers(Agri_corpus)
  ),
  tar_target(
    Carb_acc_papers,
    get_list_of_papers(Carb_acc_corpus)
  ),
  tar_target(
    clim_papers,
    get_list_of_papers(clim_corpus)
  ),
  tar_target(
    Drain_papers,
    get_list_of_papers(Drain_corpus)
  ),
  tar_target(
    F_on_P_papers,
    get_list_of_papers(F_on_P_corpus)
  ),
  tar_target(
    Gas_papers,
    get_list_of_papers(Gas_corpus)
  ),
  tar_target(
    Hydrology_papers,
    get_list_of_papers(Hydrology_corpus)
  ),
  tar_target(
    Peat_acc_papers,
    get_list_of_papers(Peat_acc_corpus)
  ),
  tar_target(
    Peat_RM_papers,
    get_list_of_papers(Peat_RM_corpus)
  ),
  tar_target(
    Top_fifteen_Agri,
    Agri_papers %>%
      group_by(grp) %>%
      top_n(15) %>%
      select(label)
  ),
  tar_target(
    Top_fifteen_Carb,
    Carb_acc_papers %>%
      group_by(grp) %>%
      top_n(15)%>%
      select(label)
  ),
  tar_target(
    Top_fifteen_Clim,
    clim_papers %>%
      group_by(grp) %>%
      top_n(15)%>%
      select(label)
  ),
  tar_target(
    Top_fifteen_Drain,
    Drain_papers %>%
      group_by(grp) %>%
      top_n(15)%>%
      select(label)
  ),
  tar_target(
    Top_fifteen_F_on_P,
    F_on_P_papers %>%
      group_by(grp) %>%
      top_n(15)%>%
      select(label)
  ),
  tar_target(
    Top_fifteen_Gas,
    Gas_papers %>%
      group_by(grp) %>%
      top_n(15)%>%
      select(label)
  ),
  tar_target(
    Top_fifteen_Hydro,
    Hydrology_papers %>%
      group_by(grp) %>%
      top_n(15) %>%
      select(label)
  ),
  tar_target(
    Top_fifteen_Peat_acc,
    Peat_acc_papers %>%
      group_by(grp) %>%
      top_n(15)%>%
      select(label)
  ),
  tar_target(
    Top_fifteen_Peat_RM,
    Peat_RM_papers %>%
      group_by(grp) %>%
      top_n(15)%>%
      select(label)
  )
)

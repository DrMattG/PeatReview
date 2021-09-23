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
  ),
  tar_target(
    save_top15_PeatRM,
    save_top15(Top_fifteen_Peat_RM)
  ),
  tar_target(
    save_top15_Agri,
    save_top15(Top_fifteen_Agri)
  ),
  tar_target(
    save_top15_Carb,
    save_top15(Top_fifteen_Carb)
  ),
  tar_target(
    save_top15_Clim,
    save_top15(Top_fifteen_Clim)
  ),
  tar_target(
    save_top15_Drain,
    save_top15(Top_fifteen_Drain)
  ),
  tar_target(
    save_top15_FonP,
    save_top15(Top_fifteen_F_on_P)
  ),
  tar_target(
    save_top15_Gas,
    save_top15(Top_fifteen_Gas)
  ),
  tar_target(
    save_top15_Hydro,
    save_top15(Top_fifteen_Hydro)
  ),
  tar_target(
    save_top15_Peat_acc,
    save_top15(Top_fifteen_Peat_acc)
  ),
  tar_target(
    cut_off_Agri,
    get_cut_off(Agri_papers)
  ),
  tar_target(
    cut_off_Carb,
    get_cut_off(Carb_acc_papers)
  ),
  tar_target(
    cut_off_Clim,
    get_cut_off(clim_papers)
  ),
  tar_target(
    cut_off_Drain,
    get_cut_off(Drain_papers)
  ),
  tar_target(
    cut_off_FonP,
    get_cut_off(F_on_P_papers)
  ),
  tar_target(
    cut_off_Gas,
    get_cut_off(Gas_papers)
  ),
  tar_target(
    cut_off_Hydrology,
    get_cut_off(Hydrology_papers)
  ),
  tar_target(
    cut_off_Peat_acc,
    get_cut_off(Peat_acc_papers)
  ),
  tar_target(
    Agri_papers_con,
    Check_conceptual_structure(Agri_papers,Agri_corpus)
  ),
  tar_target(
    Carb_acc_papers_con,
    Check_conceptual_structure(Carb_acc_papers,Carb_acc_corpus)
  ),
  tar_target(
    clim_papers_con,
    Check_conceptual_structure(clim_papers, clim_corpus)
  ),
  tar_target(
    Drain_papers_con,
    Check_conceptual_structure(Drain_papers, Drain_corpus)
  ),
  tar_target(
    F_on_P_papers_con,
    Check_conceptual_structure(F_on_P_papers,F_on_P_corpus)
  ),
  tar_target(
    Gas_papers_con,
    Check_conceptual_structure(Gas_papers, Gas_corpus)
  ),
  tar_target(
    Hydrology_papers_con,
    Check_conceptual_structure(Hydrology_papers,Hydrology_corpus)
  ),
  tar_target(
    Peat_acc_papers_con,
    Check_conceptual_structure(Peat_acc_papers, Peat_acc_corpus)
  ),
  tar_target(
    Peat_RM_papers_con,
    Check_conceptual_structure(Peat_RM_papers,Peat_RM_corpus)
  ),
  tar_target(
    Agri_papers_check,
    CS_check_groups(Agri_papers_con)
  ),
  tar_target(
    Carb_acc_papers_check,
    CS_check_groups(Carb_acc_papers_con)
  ),
  tar_target(
    clim_papers_check,
    CS_check_groups(clim_papers_con)
  ),
  tar_target(
    Drain_papers_check,
    CS_check_groups(Drain_papers_con)
  ),
  tar_target(
    F_on_P_papers_check,
    CS_check_groups(F_on_P_papers_con)
  ),
  tar_target(
    Gas_papers_check,
    CS_check_groups(Gas_papers_con)
  ),
  tar_target(
    Hydrology_papers_check,
    CS_check_groups(Hydrology_papers_con)
  ),

  tar_target(
    Peat_RM_papers_check,
    CS_check_groups(Peat_RM_papers_con)
  ),
  tar_target(
    Peat_acc_papers_check,
    CS_check_groups(Peat_acc_papers_con)
  ),
  tar_target(
    Agri_papers_major,
    CS_major_grp(Agri_papers_con, Agri_papers, Agri_corpus)
  ),
  tar_target(
    Carb_acc_papers_major,
    CS_major_grp(Carb_acc_papers_con, Carb_acc_papers, Carb_acc_corpus)
  ),
  tar_target(
    clim_papers_major,
    CS_major_grp(clim_papers_con, clim_papers, clim_corpus)
  ),
  tar_target(
    Drain_papers_major,
    CS_major_grp(Drain_papers_con, Drain_papers, Drain_corpus)
  ),
  tar_target(
    F_on_P_papers_major,
    CS_major_grp(F_on_P_papers_con, F_on_P_papers,F_on_P_corpus)
  ),
  tar_target(
    Gas_papers_major,
    CS_major_grp(Gas_papers_con, Gas_papers,Gas_corpus)
  ),
  tar_target(
    Hydrology_papers_major,
    CS_major_grp(Hydrology_papers_con, Hydrology_papers,Hydrology_corpus)
  ),

  tar_target(
    Peat_RM_papers_major,
    CS_major_grp(Peat_RM_papers_con, Peat_RM_papers,Peat_RM_corpus)
  ),
  tar_target(
    Peat_acc_papers_major,
    CS_major_grp(Peat_acc_papers_con,Peat_acc_papers,Peat_acc_corpus)
  ),
  tar_target(
    Agricultural_rev,
    Get_important_Reviews(Agri_papers_major, Agri_corpus, "Agricultural_rev")
  ),
  tar_target(
    Carb_acc_rev,
    Get_important_Reviews(Carb_acc_papers_major, Carb_acc_corpus, "CarbonAcc_rev")
  ),
  tar_target(
    Clim_rev,
    Get_important_Reviews(clim_papers_major, clim_corpus, "Climate_rev")
  ),
  tar_target(
    Drain_rev,
    Get_important_Reviews(Drain_papers_major, Drain_corpus, "Drain_rev")
  ),
  tar_target(
    F_on_P_rev,
    Get_important_Reviews(F_on_P_papers_major, F_on_P_corpus, "Forest_rev")
  ),
  tar_target(
    Gas_rev,
    Get_important_Reviews(Gas_papers_major, Gas_corpus, "Gas_rev")
  ),
  tar_target(
    Hydrology_rev,
    Get_important_Reviews(Hydrology_papers_major, Hydrology_corpus, "Hydrology_rev")
  ),
  tar_target(
    Peat_RM_rev,
    Get_important_Reviews(Peat_RM_papers_major, Peat_RM_corpus, "Peat_rev")
  ),
  tar_target(
    Peat_acc_rev,
    Get_important_Reviews(Peat_acc_papers_major, Peat_acc_corpus, "Peat_acc_rev")
    )

)

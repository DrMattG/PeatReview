#Functions

#Create corpus
#'@title Create a corpus
#'@description wrap around bibliometrix::convert2df
#'@param files list of files
#'@param dbsource wos
#'@param format plaintext
#'@export
#filelist=list.files(paste0(here::here(),"/data/"), pattern = ".txt",full.names = TRUE)

create_corpus=function(files,dbsource = "wos", format = "plaintext" ){
require(bibliometrix)
convert2df(c(files),dbsource, format)

}

#'@title Create a wordcloud from the co-occurring words
#'@description wrap around wordcloud2::wordcloud
#'@param corpus corpus of literature
#'@param keywords either plus or author keywords used to make the wordcloud
#'@export

create_wordcloud=function(corpus=corpus, keywords="plus"){
  require(bibliometrix)
  require(dplyr)
  results <- biblioAnalysis(corpus, sep = ";")

  if(keywords=="plus"){
    keywordPlus=results$ID

    keywordPlus=as_tibble(keywordPlus)


    wordcloud2::wordcloud2(keywordPlus)

  }else{
    if(keywords=="author"){
      Authorkeywords=results$DE
    Authorkeywords=as_tibble(Authorkeywords)
    wordcloud2::wordcloud2(Authorkeywords)
  }else{
    print("keywords can be either 'author' or 'plus'")
  }
  }


  }


get_cluster_words=function(corpus=corpus, outloc=paste0(here::here(),"/Reports")){
  require(bibliometrix)
  require(igraph)
  require(dplyr)
  # Create keyword co-occurrences network
  NetMatrix <- biblioNetwork(corpus, analysis = "co-occurrences", network = "keywords", sep = ";")
  # full network
  net=networkPlot(NetMatrix, normalize="association", weighted=T, n =  length(corpus$TI) , Title = "Keyword Co-occurrences", type = "fruchterman", size=T,edgesize = 5,label= TRUE)
  #make a dataframe
  df=data.frame(#x=net$layout[,1],
    #y=net$layout[,2],
    label=corpus$TI, grp=net$cluster_obj$memberships[1,],keyword=V(net$graph)$name, btw=net$cluster_res$btw_centrality, cls=net$cluster_res$clos_centrality)
  mainwords=df %>%
    group_by(grp) %>%
    select(keyword) %>%
    arrange(grp)
  write.csv(mainwords,paste0("Reports/",substitute(corpus),".csv"))
}

get_list_of_papers=function(corpus){
  require(bibliometrix)
  require(igraph)
  require(dplyr)
  # Create keyword co-occurrences network
  NetMatrix <- biblioNetwork(corpus, analysis = "co-occurrences", network = "keywords", sep = ";")
  # full network
  net=networkPlot(NetMatrix, normalize="association", weighted=T, n =  length(corpus$TI) , Title = "Keyword Co-occurrences", type = "fruchterman", size=T,edgesize = 5,label= TRUE)
  #make a dataframe
  df=data.frame(#x=net$layout[,1],
    #y=net$layout[,2],
    label=corpus$TI, grp=net$cluster_obj$memberships[1,],keyword=V(net$graph)$name, btw=net$cluster_res$btw_centrality, cls=net$cluster_res$clos_centrality)

  df %>%
    group_by(grp) %>%
    arrange(grp,desc(btw))

}


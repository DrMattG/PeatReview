## Functions and code to sort the data and input it in to Bibliometrix R package

# Load the required packages
library(tidyverse)
library(bibliometrix)
library(here)


# Citations for loaded packages
#' @description function to cite all loaded packages in the session
#' @author Matthew Grainger, \email{matthew.grainger@@nina.no}
#' @examples 
#' cite_loaded_packages() 
#' @export

cite_loaded_packages<-function(){
pkgs<-(.packages())

for (i in 1:length(pkgs)){
  print(citation(package=pkgs[i]))
}
}


cite_loaded_packages()

#load all the results in one large object

filelist=list.files(paste0(here::here(),"/data/"), pattern = ".txt",full.names = TRUE)

M<-convert2df(c(filelist[15],filelist[16]), dbsource = "wos", format = "plaintext")
)
M <- convert2df(c(filelist[1])
                #,filelist[2],filelist[3],filelist[4],filelist[5],filelist[6],filelist[7],filelist[8],filelist[9],filelist[10],
                 #filelist[11],filelist[12],filelist[13],filelist[14],filelist[15],filelist[16],filelist[17],filelist[18],filelist[19],filelist[20],filelist[21], filelist[22])
                , dbsource = "wos", format = "plaintext")

results <- biblioAnalysis(M, sep = ";")
S <- summary(object = results, k = 10, pause = FALSE)

Authorkeywords=results$DE
keywordPlus=results$ID

Authorkeywords=as_tibble(Authorkeywords)
keywordPlus=as_tibble(keywordPlus)

wordcloud2::wordcloud2(Authorkeywords)
wordcloud2::wordcloud2(keywordPlus)


#bibliometrix::duplicatedMatching(M)

# Create keyword co-occurrences network
NetMatrix <- biblioNetwork(M, analysis = "co-occurrences", network = "keywords", sep = ";")

# full network
net=networkPlot(NetMatrix, normalize="association", weighted=T, n =  length(M$TI) , Title = "Keyword Co-occurrences", type = "fruchterman", size=T,edgesize = 5,label= TRUE)

plot(net$layout)

degree(net$graph)
net$graph

df=data.frame(x=net$layout[,1], y=net$layout[,2], label=M$TI, grp=net$cluster_obj$memberships[1,],keyword=V(net$graph)$name, btw=net$cluster_res$btw_centrality, cls=net$cluster_res$clos_centrality)


  df %>% 
    group_by(grp) %>% 
    arrange(grp,desc(btw))


df %>% 
  group_by(grp) %>% 
  select(keyword) %>% 
  arrange(grp)



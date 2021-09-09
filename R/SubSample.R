#' @description  Subsample based on co-word analysis
#' @param M bibliometrix file 
#' @param size fraction of papers from each cluster
#' @return A tibble with subsample of title and group
#' @export

SubSample=function(M,size=0.2){
NetMatrix <- biblioNetwork(M, analysis = "co-occurrences", network = "keywords", sep = ";")

net=networkPlot(NetMatrix, normalize="association", weighted=T, n =  length(M$TI) , Title = "Keyword Co-occurrences", type = "fruchterman", size=T,edgesize = 5,label= FALSE)

out=data.frame(Title=M$TI,cluster=net$cluster_obj$membership)

cluster=as_tibble(out)

cluster %>% 
  group_by(cluster) %>% 
  sample_frac(.,size = size,weight=NULL) 
}

#SubSample(M,size=0.2)

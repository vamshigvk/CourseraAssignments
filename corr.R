corr<-function(directory,threshold=0){
  a=complete(directory,1:332)
  ids=a$id[a$nobs>threshold]
  corr_vector=length(ids)
  for(i in ids){
    if(i>0 && i<10){
      path=paste0(directory,"/00",i,".csv")
    }
    else if(i>9 && i<100){
      path=paste0(directory,"/0",i,".csv")
    }
    else{
      path=paste0(directory,"/",i,".csv")
    }
    a=as.data.frame(read.csv(path))
    good=complete.cases(a)
    b= a[good,]
    corr_vector=c(corr_vector, cor(b$sulfate,b$nitrate))
  }
  corr_vector
}
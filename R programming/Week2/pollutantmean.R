pollutantmean<-function(directory,pollutant,id=1:332){
  values=numeric()
  for( i in id){
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
      values= c(values, as.numeric(unlist(b[pollutant])))
  }
  print(mean(values))
}
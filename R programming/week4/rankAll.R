rankall <- function(outcome, num = "best") {
  outcome.data=read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
  if(outcome %in% c("heart attack", "heart failure",  "pneumonia") ){
    states=unique(outcome.data[,7])
    hospital1=c()
    state1=c()
    for(i in states){
      hospital1=c(hospital1,rankhospital(i,outcome,num))
      state1=c(state1,i)
    }
    df=data.frame(hospital=hospital1,state=state1)
  }
  return(df)
}
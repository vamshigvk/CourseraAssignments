rankhospital <- function(state, outcome, num = "best") {
  outcome.data=read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
  if(state %in% outcome.data$State && outcome %in% c("heart attack", "heart failure",  "pneumonia") ){
    
    state.filter = outcome.data[outcome.data$State==state,]
    
    number=switch(outcome , "heart attack"=as.numeric(11),"heart failure"=as.numeric(17), "pneumonia"=as.numeric(23))
    state.hospital = state.filter[,c(2,number)]
    state.nna = state.hospital[state.hospital[,2]!="Not Available",]
    state.order=state.nna[order(state.nna[,2]),]

  }
  return(switch(num , "best"= state.order[1,1] , "worst" = state.order[nrow(state.order),1] , state.order[num,1] ))
 
}

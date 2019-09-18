#Plot the 30-day mortality rates for heart attack
plot1<-function(){
  outcome=read.csv("outcome-of-care-measures.csv",colClasses = "character")
  head(outcome)
  outcome[,11]=as.numeric(outcome[,11])
  hist(outcome[,11])
  #plot(factor(outcome$State), outcome[,11])
  
}

#Finding the best hospital in a state
best <- function(state, outcome) {
  outcome.data=read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
  if(state %in% outcome.data$State && outcome %in% c("heart attack", "heart failure",  "pneumonia") ){
    
    state.filter = outcome.data[outcome.data$State==state,]
    
    number=switch(outcome , "heart attack"=as.numeric(11),"heart failure"=17, "pneumonia"=22)
    
    state.numeric = state.filter[,number]
    
    state.minimum=min(state.numeric,na.rm = FALSE)

    state.a=state.filter[,number]
    
    state.row=state.filter[state.a==state.minimum,]
    
    state.best.hospital=state.row["Hospital.Name"]
    
    state.hospital.order=apply(state.best.hospital,2,order)
    
    state.best.hospital.order= state.best.hospital$Hospital.Name[state.hospital.order]

  }
  return(state.best.hospital.order[1])
}
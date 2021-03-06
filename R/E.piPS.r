#' @export

E.piPS<-function(y,Pik){
  y<-cbind(1,y)
  y<-as.data.frame(y)
  names(y)[1] <- "N"
  Total<-matrix(NA,nrow=4,ncol=dim(y)[2])
  rownames(Total)=c("Estimation", "Standard Error","CVE","DEFF")
  colnames(Total)<-names(y)
  n<-length(Pik)
  for(k in 1:dim(y)[2]){
    ty<-sum(y[,k]/Pik)
    #-------------------
    ck <- (1-Pik)*(n/(n-1))
    P1 <- sum(ck*y[,k]/Pik)
    P2 <- sum(ck)
    ystar <- Pik*P1/P2
    P3 <- ck/(Pik^2)
    #--------------------
    Vty<-sum(P3*((y[,k]-ystar)^2))
    CVe<-100*sqrt(Vty)/ty
    N<-sum(1/Pik)
    VMAS<-(N^2)*(1-(n/N))*var(y[,k])/(n)
    DEFF<-Vty/VMAS
    Total[,k]<-c(ty,sqrt(Vty),CVe,DEFF)
  }
  return(Total)
}
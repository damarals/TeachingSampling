#' @export

E.IC<-function(N,est,type='total',level=0.95){
  a<-est[1, 2]
  b<-est[2, 2]
  if(type == 'mean'){
    a<-est[1, 2]/N
    b<-est[2, 2]/N
  }
  alpha<- 1-level
  quantil<-qnorm(1-(alpha/2))
  c<-quantil*b
  Li<- a-c
  Ls<- a+c
  return(cbind(Li, Ls))
}
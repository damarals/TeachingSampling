#' @export

E.CI <- function (N, est, type = "total", level = 0.95) 
{
  if (length(dim(est)) > 2){
    names<-dimnames(est)[[3]][-1]
    result = NULL
    namerow = NULL
    for(i in 1:length(names)){
      namerow[i] = paste0(names[i], ' ', type)
      result = rbind(result, E.CI(N,  a[,,i+1], type = type, level = level))
    }
    rownames(result)<-namerow
    return(result)
  }
  else{
    a <- as.numeric(tail(est[1,],1))
    b <- as.numeric(tail(est[2,],1))
    if (type == "mean") {
      a <- as.numeric(tail(est[1,],1))/N
      b <- as.numeric(tail(est[2,],1))/N
    }
    alpha <- 1 - level
    quantil <- qnorm(1 - (alpha/2))
    c <- quantil * b
    Li <- a - c
    Ls <- a + c
    interval = matrix(c(Li,Ls),1)
    colnames(interval) = c('ci.low', 'ci.hi')
    return(interval)
  }
}

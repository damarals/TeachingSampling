#' @export

E.CI <- function (N, est, type = "total", level = 0.95) 
{
  if(length(dim(est)) == 2){
    dim_n <- colnames(est)[-1]
    est <- est[,-1]
    dim(est) <- c(4, 1, ncol(est))
    if(length(dim(est)) == 2){
      dim(est) <- c(4, 1, ncol(est))
    }
    colnames(est) <- 'Population'
    dimnames(est)[[3]] <- dim_n
  }
  else{
    est <- est[,,-1]
  }
  result <- array(NA, c(dim(est)[2], 2, dim(est)[3]))
  t_col <-  length(colnames(est))
  rownames(result) <- as.vector(mapply(paste0,colnames(est),rep(' ', t_col), rep(type, t_col)))
  colnames(result) <- c('ci.low', 'ci.hi')
  dimnames(result)[[3]] <- dimnames(est)[[3]]
  if(length(N) == (ncol(est)-1)){
    N <- c(N, sum(N))
  }
  for(j in 1:dim(result)[3]){
    for(k in 1:dim(result)[1]){
      values <- est[,k,j]
      a <- values[1]
      alpha <- 1-level
      b <- values[2]*qnorm(1-(alpha/2))
      if(type == 'mean'){
        result[k,,j] <- c(a-b, a+b)/N[k]
      }
      else{
        result[k,,j] <- c(a-b, a+b)
      }
    }
  }
  return(result)
}

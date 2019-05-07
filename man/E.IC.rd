\name{E.CI}
\alias{E.CI}
\title{Confidence Interval for Estimation of the Population Total and Mean}
\description{Computes the Confidence Interval (1-alpha) utilizing Normal Distribution of the population total and mean for an specified sampling}
\usage{
E.IC(N, est, type, level)
}
\arguments{
\item{N}{Population size}
\item{est}{Estimator of the Population Total}
\item{type}{type of Confidence Interval: "Total" or "Mean"}
\item{level}{level of Interval: (1-alpha)}
}
\seealso{
\code{\link{E.IC}}
}
\details{Returns the confidence interval of estimation of the population total or mean of every sampling design, utilizing the estimated standard error and total in a specified sampling design}
\value{The function returns a data matrix whose columns correspond to the bands of confidence estimated of population total or mean}
\author{Daniel de Amaral da Silva \email{silva.daniel86@gmail.com}}
\references{
Sarndal, C-E. and Swensson, B. and Wretman, J. (1992), \emph{Model Assisted Survey Sampling}. Springer.}
\examples{
############
## Example 1
############
# Uses the Lucy data to get a Confidence Interval to total according to a SI design
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
n <- 400
sam <- S.SI(N,n)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
est <- E.SI(N,n,estima)
# Passing the informations to calculate the Confidence Interval to total
E.CI(N, est, type = 'total', level = 0.95)

############
## Example 2
############
# Uses the Lucy data to get a Confidence Interval to mean according to a Bernoulli sample
data(Lucy)
attach(Lucy)

N <- dim(Lucy)[1]
n=400
prob=n/N
sam <- S.BE(N,prob)
# The information about the units in the sample is stored in an object called data
data <- Lucy[sam,]
attach(data)
names(data)
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
est <- E.BE(estima,prob)
# Passing the informations to calculate the Confidence Interval to mean
E.CI(N, est, type = 'mean', level = 0.95)

}
\keyword{survey}

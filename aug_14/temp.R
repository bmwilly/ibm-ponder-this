
require(mcsm)
require(data.table)

answers <- seq(51, 150)
# answers <- as.data.frame(seq(51, 150))
# answers$P <- 1/nrow(answers)

unif <- runif(n = 10000, min = 51, max = 150)
plot(unif)

dt <- data.table(answers, val = answers)
setattr(dt, 'sorted', 'answers')

dt[J(unif[1]), .I]


calc_cost <- function(answer) {
  
  cost <- 0
  
}
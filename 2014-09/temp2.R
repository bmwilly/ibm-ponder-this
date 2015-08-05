
nth_digit <- function(x, n) {
  if (x) {
    x %% 10^(trunc(log10(x)) - n + 1) %% 10
  } else {
    0
  }
}

nth_digit(726433, 5)


m <- 1:1000
df <- as.data.frame(sapply(m, function(m) sum(1/m * (.5)^m)))
log2 <- sum(df[,1])



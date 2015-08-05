
f1 <- function(ncol) {
  do.call(rbind, lapply(1:ncol, function(x) {
    t(apply(combn(ncol, x), 2, function(y) {
      col = rep(0, ncol)
      col[y] = 1
      col
    }))
  }))
  m <- rbind(as.data.frame(m), z)
}

f1(5)


f2 <- function(ncol) {
  m <- as.data.frame(matrix(rbinom(ncol*2, 1, .5), ncol = 5))
  expand.grid(m)
}


f2(5)

f1(2)

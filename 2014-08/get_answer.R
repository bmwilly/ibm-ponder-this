
# f(1) = 0 
# f(n) = min_{0<i<n} [i/n*(f(i)+10) + (n-i)/n*(f(n-i)+1)] 
# f(100) = ? 

f <- matrix(nrow = 100, ncol = 1)
f[is.na(f)] <- 0

for (n in 2:nrow(f)) {
  
  minval <- 1/n*(f[1]+10) + (n-1)/n*(f[n-1]+1)
  
  if (n > 2) {
    for (i in 2:(n-1)) {
      tmp <- i/n*(f[i]+10) + (n-i)/n*(f[n-i]+1)
      if (tmp < minval) {
        minval <- tmp
      }
    }
  }
  
  f[n] <- minval
}


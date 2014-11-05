require(plyr)
require(dplyr)
require(igraph)

letters <- c('alpha', 'beta', 'gamma')
df <- data.frame(letter = letters) %>% 
  mutate(p = c(1/8, 11/16, 3/16))

num_nodes <- function(num_coins) {
  tot <- 0
  for (n in 0:num_coins) {
    tot <- tot + 2^n
  }
  return(tot)
} 
g <- graph.tree(n = num_nodes(3), children = 2)
lay <- layout.reingold.tilford(g, params = list(root = 1))
plot(g, layout = lay)

p1 = 1/2
p2 = 1/4
q1 = 1-p1
q2 = 1-p2
probs <- c(p1, p2, q1, q2, 1, 0)

combs <- combn(probs, 3)
combs <- expand.grid(combs, combs, combs) %>% 
  group_by(Var1, Var2, Var3) %>% 
  summarize() 
combs$prod <- combs$Var1 * combs$Var2 * combs$Var3

prods <- unique(combs$prod)

tmp <- combn(prods, 8)

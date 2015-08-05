require(plyr)
require(dplyr)

letters <- c('alpha', 'beta', 'gamma', 'delta', 'epsilon', 'zeta', 'eta', 'theta', 'iota', 
             'kappa', 'lambda', 'mu', 'nu', 'xi', 'omicron', 'pi', 'rho', 'sigma', 'tau', 'upsilon', 
             'phi', 'chi', 'omega')

df <- data.frame(matrix(nrow = length(letters)))
df$letter <- letters

df <- df %>% 
  select(letter) %>% 
  mutate(length = nchar(letters)) %>% 
  mutate(even = ifelse(length %% 2 == 0, 1, 0))

ptau <- 1

evens <- df %>% 
  filter(even == 1) %>% 
  mutate(p = 2^length * ptau)

odds <- df %>% 
  filter(even == 0) %>% 
  mutate(p = ifelse(letter == 'tau', ptau, 2^(length-2) * ptau))

df <- rbind(evens, odds) %>% 
  mutate(prob = p/sum(p))




# c1 <- combn(c(p1,p2,q1,q2), 1)
# c2 <- combn(c(p1,p2,q1,q2), 2)
# c3 <- combn(c(p1,p2,q1,q2), 3)
# 
# twos <- NULL
# for (col in 1:ncol(c2)) {
#   p <- prod(c2[,col])
#   twos <- c(twos, p)
#   print('j')
# }
# 
# threes <- NULL
# for (col in 1:ncol(c3)) {
#   threes <- c(threes, prod(c3[,col]))
# }
# 
# nums <- c(p1,p2,q1,q2,twos,threes)
# 
# poss <- combn(nums, 2)
# df <- as.data.frame(t(poss)) %>% 
#   mutate(sum = V1 + V2)
# 
# vals <- c(1/8,11/16,3/16)
# 
# df1 <- df %>% 
#   filter(sum %in% vals) %>% 
#   group_by(sum) %>% 
#   summarize()
# 
# df2 <- as.data.frame(nums) %>% 
#   filter(nums %in% vals) %>% 
#   group_by(nums) %>% 
#   summarize()


### Example run ###
df <- data.frame(letter = c('alpha', 'beta', 'gamma')) %>% 
  mutate(prob = c(1/8, 11/16, 3/16))

p1 = 1/2
p2 = 1/4
q1 = 1-p1
q2 = 1-p2





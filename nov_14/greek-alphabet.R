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

toss_coin <- function(p) {
  rnum <- runif(1)
  if (rnum <= p) {
    return('T')
  } else {
    return('H')
  }
}


### Example run ###
p_1 = 1/2
p_2 = 1/4

# We toss the first coin p_1
toss1 <- toss_coin(p_1)
# If it's tails, we toss the second coin
if (toss1 == 'T') {
  toss2 <- toss_coin(p_2)
  # If it's tails
  if (toss2 == 'T') {
    # We generate alpha
    choice <- 'alpha'
  } else {
    # We toss p_1 and 
    toss3 <- toss_coin(p_1)
    # If it's tails
    if (toss3 == 'T') {
      # We choose beta
      beta <- df$prob[df$letter == 'beta']
    } else {
      # We choose gamma
      gamma <- df$prob[df$letter == 'gamma']
    }
  }
} else {
  # We choose beta
  beta <- df$prob[df$letter == 'beta']
}

alpha_output <- paste('Alpha:', alpha)
beta_output <- paste('Beta:', beta)
gamma_output <- paste('Gamma:', gamma)

output <- paste('Using the schema above yields:', alpha_output, beta_output, gamma_output, sep = '\n')
cat(output)

tmp <- paste('asdf', 'qwer', sep = '\n')
cat(tmp)

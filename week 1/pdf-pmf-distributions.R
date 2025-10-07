library(tidyverse)

#1. Define the possible outcomes

foo <- tibble(
  x = seq(0,10, by = 0.1)
)

#tibble (tidyverse) and data.frame are the same 

foo

#2. Choose our parameters
shape <- 2
rate <- 1


#3. calculate density
foo <- mutate(foo, density = dgamma(x, shape, rate))

#dgamma(x, shape, rate = 1, scale = 1/rate, log = FALSE)


#4. Plot it 

ggplot(foo, aes(x, density)) +
  geom_line()

#-----

#Poisson distribution

#1. Define the possible outcomes

foo <- tibble(
  x = seq(0,100, length.out = 100)
)

foo

#2. Choose our parameters
lambda <- 1


#3. calculate density
foo2 <- mutate(foo, mass = dpois(x, lambda = lambda))

#dgamma(x, shape, rate = 1, scale = 1/rate, log = FALSE)


#4. Plot it 

ggplot(foo2, aes(x, mass)) +
  geom_line()


#---- example during office hours---

#1. Define possible outcomes

#Binomial (1,0.5) -> 0,1 (only 0 or 1 outcomes)

binom_pmf <- tibble(x = c(0:10))

#2. Choose our parameters

n <- 1
p <- 0.5 

#3. Calculate the PMF/PDF

binom_pmf <- mutate(binom_pmf, 
                    pmf = dbinom(x, size = n, prob = p))

#4. plot it

ggplot(binom_pmf, aes(x, pmf)) +
  geom_point(size = 3) +
  theme_classic()


#---- normal distribution ---

normal_pdf <- tibble(x = seq(-3,3, length.out = 100)) #length.out adds points 

#2. Choose our parameters

mu <- 0
sigma <- 1 

#3. Calculate the PMF/PDF (always calculate density over possible outcomes)

normal_pdf <- mutate(normal_pdf, 
                    pdf = dnorm(x, mean = mu, sd = sigma))

#4. plot it

ggplot(normal_pdf, aes(x, pdf)) +
  geom_line(linewidth = 2) +
  geom_point(data = slice(normal_pdf, 50), 
             color = "gold", size = 3) +
  theme_classic()


#probability is the area under the curve

#---- Beta Distribution ----

#BETA (2,7)

#1. Define possible outcomes
beta_pdf <- tibble(x = seq(0,10, length.out = 100))

#2. Choose our parameters
a <- 2
b <- 7

#3. Calculate the PMF/PDF

beta_pdf <- mutate(beta_pdf, 
                    pdf = dbeta(x, shape1 = a, shape2 = b))

#4. plot it

ggplot(beta_pdf, aes(x, pdf)) +
  geom_line(linewidth = 2) +
  theme_classic()



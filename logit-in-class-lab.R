library(ggplot2)
library(tidyverse)

# Intro to logit function
p <- seq(0.001, 0.999, length.out = 1e4)

logit_p <- log(p/(1-p))

ggplot(tibble(p, logit_p), aes(p,logit_p)) +
  geom_line()

#x and logit(p) are linear 
x <- seq(0, 100, length.out = 1e4)
beta0 <- -5
beta1 <- 0.1

logit_p <- beta0 + beta1 * x

ggplot(tibble(x, logit_p), 
       aes(x, logit_p)) +
  geom_line()

# x and p are not linear

p <- exp(logit_p) / 
  (1 + exp(logit_p))

ggplot(tibble(x,p), 
       aes(x, p)) + 
  geom_line()

# Bs reflect your hypothesis 

PctHisp <- seq(0,100, length.out = 1e3)

beta0 <- 10
beta1 <- 0.2

logit_p <- beta0 + beta1 * PctHisp

p <- exp(logit_p) / (1 + exp(logit_p))

ggplot(tibble(PctHisp, p), 
       aes(PctHisp, p))+
  geom_line()

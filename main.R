library(dplyr)
library(GA)

source(here::here("generate_fake_data.R"))
source(here::here("helpers.R"))

members.needed <- 20

gasolution <- GA::ga(
  type = "permutation",
  fitness = fitnessfunc,
  dataset = fake.data,
  new.members=members.needed, 
  lower = 1,
  upper = (nrow(fake.data)),
  maxiter = 1000,
  pmutation = 0.25,
  elitism = 0.1,
  popSize = 200
)




# Delete | Scratch --------------------------------------------------------

gasolution@solution

fake.data[gasolution@solution[1:members.needed],] %>% 
  count(Gender)

fake.data[gasolution@solution[1:members.needed],] %>% 
  count(Job)

fake.data[gasolution@solution[1:members.needed],] %>% 
  count(Region)

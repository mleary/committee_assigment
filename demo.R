# author: matt leary
# intent: demo of a optimization method to create committee assignments


# checkpoint setup --------------------------------------------------------

source(here::here("utils/project_setup.R"))

# Libraries and source add'l scripts --------------------------------------

library(dplyr)
library(GA)


source(here::here("utils/generate_fake_data.R"))
source(here::here("utils/ga_helpers.R"))


# One Committee  ----------------------------------------------------------

members.needed <- 30

gasolution <- GA::ga(
  type = "permutation",
  fitness = fitnessfunc,
  dataset = fake.data,
  new.members=members.needed, 
  lower = 1,
  upper = (nrow(fake.data)),
  maxiter = 5000,
  pmutation = 0.25,
  elitism = 0.15,
  run = 750
)

# Results

fake.data[gasolution@solution[1:members.needed],] %>% 
  count(Gender)

fake.data[gasolution@solution[1:members.needed],] %>% 
  count(Job)

fake.data[gasolution@solution[1:members.needed],] %>% 
  count(Region)


# Multiple Committees -----------------------------------------------------

liver.committee <- fake.data %>% filter(Committee_Assignment == "Liver")
kidney.committee <- fake.data %>% filter(Committee_Assignment == "Kidney")
unassigned.members <- fake.data %>% filter(Committee_Assignment == "Unassigned")


gasolution2 <- GA::ga(
  type = "permutation",
  fitness = fitnessfunc_multiple,
  unassigned.df = unassigned.members, 
  liver.df = liver.committee,
  kidney.df = kidney.committee,
  lower = 1,
  upper = (nrow(unassigned.members)),
  maxiter = 5000,
  pmutation = 0.25,
  elitism = 0.15,
  run = 750
)

# Results Liver committee
liver.committee %>% 
  rbind(unassigned.members[gasolution2@solution[1:15],]) %>%
  count(Gender)

liver.committee %>% 
  rbind(unassigned.members[gasolution2@solution[1:15],]) %>%
  count(Job)

liver.committee %>% 
  rbind(unassigned.members[gasolution2@solution[1:15],]) %>%
  count(Region)

# Results Kidney Committee

kidney.committee %>% 
  rbind(unassigned.members[gasolution2@solution[16:30],]) %>%
  count(Gender)

kidney.committee %>% 
  rbind(unassigned.members[gasolution2@solution[16:30],]) %>%
  count(Job)

kidney.committee %>% 
  rbind(unassigned.members[gasolution2@solution[16:30],]) %>%
  count(Region)

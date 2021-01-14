#Generate fake data for testing


# Libraries ---------------------------------------------------------------

library(tibble)
library(dplyr)
library(janitor)

# Generate fake data ------------------------------------------------------

num.names <- 215

fake.data <- tibble::tibble(
  Name = paste0(rep('Name_', times=num.names), 1:num.names),
  Gender = sample(x=c("M","F"), 
                  size=num.names, 
                  replace = T,
                  prob = c(0.35, 0.65)),
  Region = sample(x=1:11,
                  size=num.names,
                  replace =  T),
  Job = sample(x=c('Surgeon', 'Admin', 'OPO', "Doctor"),
               size=num.names,
               replace = T,
               prob = c(0.2, 0.15, 0.25, 0.4)),
  Committee_Assignment = sample(x=c( "Liver", "Kidney", "Unassigned"),
                            size = num.names,
                            replace = T,
                            prob = c( 0.14, 0.22, 0.64))
)

  

# Fake Data Summary -------------------------------------------------------

fake.data %>%
  group_by(Committee_Assignment) %>% 
  summarise(
    People = n(),
    Percent_Female = sum(Gender == "F") / People,
    Percent_Male = sum(Gender == "M") / People,
    Percent_Doctor = sum(Job == "Doctor") / People, 
    Percent_OPO = sum(Job == "OPO") / People, 
    Percent_Admin = sum(Job == "Admin") / People, 
    Percent_Surgeon = sum(Job == "Surgeon") / People, 
  ) %>% 
  mutate(People = People %>% as.character()) %>% 
  janitor::adorn_pct_formatting(digits = 0)
  




#Generate fake data for testing

library(tibble)

num.names <- 90


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
  Already_Assinged = 0
)


# Fake Data Summary -------------------------------------------------------

fake.data %>% 
  dplyr::count(Gender)

fake.data %>% 
  dplyr::count(Job)

fake.data %>% 
  dplyr::count(Region)


fake.data %>% 
  dplyr::group_by(Gender, Job) %>% 
  dplyr::count()

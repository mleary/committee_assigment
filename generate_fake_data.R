library(tibble)

num.names <- 50

fake.data <- tibble::tibble(
  Name = paste0(rep('Name_', times=num.names), 1:num.names),
  Gender = sample(x=c("M","F"), 
                  size=num.names, 
                  replace = T,
                  prob = c(0.35, 0.65)),
  Region = sample(x=1:6,
                  size=num.names,
                  replace =  T),
  Job = sample(x=c('Surgeon', 'Admin', 'OPO', "Doctor"),
               size=num.names,
               replace = T,
               prob = c(0.2, 0.15, 0.25, 0.4))
)



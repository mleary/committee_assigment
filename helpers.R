library(dplyr)

# Individual Goals --------------------------------------------------------

female_score <- function(vec.gender, goal=0.5){
  denom <- length(vec.gender)
  females <- length(vec.gender[vec.gender ==  "F"]) 
  female.percent <- (females / denom)
  score <- abs(female.percent  - goal)^2  
  return(score)
}


job_score <- function(job.vector ,goal =0.25){
  denom <- length(job.vector)
  perc.vec <- table(job.vector) / denom
  score <- (perc.vec - goal) %>% abs() %>% sum()
  if(sum((perc.vec < 0.15)) > 0){
    score <- 10
  }
  return(score)
}


region_score <- function(region.vector, goal = 0.09){
  denom <- length(region.vector)
  perc.vec <- table(region.vector) / denom
  score <- (perc.vec - goal) %>% abs() %>% sum()
  if((region.vector %>% unique() %>% length()) < 11){
    score <- 10
  }
  return(score)
}


# Aggregate Scoring Function ----------------------------------------------


committee_score <- function(selected, dataset, new.members){
  
  dataset <- dataset[selected,][1:new.members,] # first order by deletion then limit to new
  female.score <- dataset$Gender %>% female_score()
  job.score <- dataset$Job %>% job_score()
  region.score <- dataset$Region %>% region_score()
  return(female.score + job.score + region.score)
}

fitnessfunc <- function(selected, ...) {
  1 / committee_score(selected, ...)
}


# Delete Scratch ----------------------------------------------------------




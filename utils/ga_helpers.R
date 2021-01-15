library(dplyr)

# Individual Goals --------------------------------------------------------

female_score <- function(vec.gender, goal=0.5){
  denom <- length(vec.gender)
  females <- length(vec.gender[vec.gender ==  "F"]) 
  female.percent <- (females / denom)
  score <- abs(female.percent  - goal)*50
  return(score)
}


job_score <- function(job.vector ,goal =0.25){
  denom <- length(job.vector)
  perc.vec <- table(job.vector) / denom
  score <- (perc.vec - goal) %>% abs() %>% sum()
  score <- score * 2
  if(sum((perc.vec < 0.15)) + sum((perc.vec > 0.42)) > 0){
    score <- 50
  }
  return(score)
}


region_score <- function(region.vector, goal = 0.09){
  denom <- length(region.vector)
  perc.vec <- table(region.vector) / denom
  score <- (perc.vec - goal) %>% abs() %>% sum()
  score <- score * 3
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

multiple_committee_score <- function(selected, unassigned.df, liver.df, kidney.df){
  
  committee_score_2 <- function(selected, new.members, old.members, start.index, end.index){
    
    dataset <- rbind(old.members,
                     new.members[selected,][start.index:end.index, ]) # first order by deletion then limit to new
    
    female.score <- dataset$Gender %>% female_score()
    job.score <- dataset$Job %>% job_score()
    region.score <- dataset$Region %>% region_score()
    return(female.score + job.score + region.score)
  }
  
  liver.score  <- committee_score_2(selected, unassigned.df, liver.df, 1, 15)
  kidney.score <- committee_score_2(selected, unassigned.df, kidney.df, 16, 30)
  
  return(liver.score + kidney.score)
}


# Fitness function --------------------------------------------------------

fitnessfunc <- function(selected, ...) {
  1 / committee_score(selected, ...)
}

fitnessfunc_multiple <- function(selected, ...){
  1 / multiple_committee_score(selected, ...)
  
}



library(checkpoint)
library(here)

checkpoint::checkpoint(
  snapshotDate = '2021-01-01',
  R.version = '4.0.2', # update R version as needed
  checkpointLocation = here::here()
)

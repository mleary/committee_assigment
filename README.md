
<!-- README.md is generated from README.Rmd. Please edit that file -->

# committee\_assigment

<!-- badges: start -->

<!-- badges: end -->

The goal of committee\_assigment is to expediate the creation of
*balanced* committee assignments given a handful of *constraints*.

## Objectives & Constraints

The main objective is to create balanced committee assignments that
represent the overall population as whole. This means controlling for
certain variables, such as gender, occupation, region, etc.

The largest constraint are:

  - Gender (ensure balanced gender representation)
  - Job (ensure each Job role is equally represented)
  - Region (ensure representation from each region, try to balance it)

## Session Info

``` r
sessionInfo()
#> R version 4.0.2 (2020-06-22)
#> Platform: x86_64-w64-mingw32/x64 (64-bit)
#> Running under: Windows 10 x64 (build 19041)
#> 
#> Matrix products: default
#> 
#> locale:
#> [1] LC_COLLATE=English_United States.1252 
#> [2] LC_CTYPE=English_United States.1252   
#> [3] LC_MONETARY=English_United States.1252
#> [4] LC_NUMERIC=C                          
#> [5] LC_TIME=English_United States.1252    
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> loaded via a namespace (and not attached):
#>  [1] compiler_4.0.2  magrittr_2.0.1  tools_4.0.2     htmltools_0.5.0
#>  [5] yaml_2.2.1      stringi_1.5.3   rmarkdown_2.6   knitr_1.30     
#>  [9] stringr_1.4.0   xfun_0.19       digest_0.6.27   rlang_0.4.9    
#> [13] evaluate_0.14
```

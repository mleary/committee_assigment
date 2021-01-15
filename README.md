
<!-- README.md is generated from README.Rmd. Please edit that file -->

# committee\_assigment

The goal of committee\_assigment is to expedite the creation of
*balanced* committee assignments given a handful of *constraints*.

This is achieved by using the `{GA}` package to run a genetic algorithim
and optimize committee assignments.

## Objectives & Constraints

The main objective is to create balanced committee assignments that
represent the overall population as whole. This means controlling for
certain variables, such as gender, occupation, region, etc.

The largest constraint are:

  - Gender (ensure balanced gender representation)
      - Goal is 50% Female / 50% Male (this was a basic demo that
        ignores other gender identities (i.e. non-binary))
  - Job (ensure each Job role is equally represented)
      - Goal is 25% each category
      - Large penalty applied if any Job is less than 15% of committee
  - Region (ensure representation from each region, try to balance it)
      - Goal is 9% per region
      - Large penalty applied if any region is not represented at all

## Using this repo

This project was setup with the `{checkpoint}` for package versioning.
It’s not perfect but it works. You can activate the checkpoint folder by
running the `utils\project_setup.R` file. More details on project
development environment is listed belowin the `Session Info` section.

The `utils\ga_helpers.R` file has all the functions used in genetic
algorithim.

The `utils\generate_fake_data.R` file is a temp file purely for
development. It, as the name suggests, generates fake data to demo how
the process **could** work.

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
#>  [5] yaml_2.2.1      stringi_1.4.6   rmarkdown_2.3   knitr_1.30     
#>  [9] stringr_1.4.0   xfun_0.18       digest_0.6.25   rlang_0.4.9    
#> [13] evaluate_0.14
```

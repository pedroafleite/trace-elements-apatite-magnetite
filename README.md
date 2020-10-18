# Indicator Minerals As Proxies for Mineral Deposits: Statistical Analysis of Trace Elements in Apatite and Magnetite
Code for the statistical analysis in my MS dissertation: 

- [Trace element geochemistry of apatite and magnetite in gold systems of the Alta Floresta mineral province, NW Brazil: Petrogenetic and metallogenic implications](http://hdl.handle.net/11449/193761).

The complete dissertation is also available [here at Github](https://github.com/pedroafleite/trace-elements-apatite-magnetite/blob/main/leite2020_dissertation.pdf).

## Data availability
The datasets analysed in this study are available as:
- [Apatite dataset](https://github.com/pedroafleite/trace-elements-apatite-magnetite/blob/main/geochem_ap.csv)
- Magnetite dataset (*Available soon*)

## Data reproducibility
The code for replicating the study in apatite is displayed in the following R markdowns:

- [Part 1: Data Exploration of Trace Elements in Apatite](https://github.com/pedroafleite/trace-elements-apatite-magnetite/blob/main/part1_apatite.md#part-1-data-exploration-of-trace-elements-in-apatite)

- [Part 2: Multivariate Discriminat Analysis in Apatite](https://github.com/pedroafleite/trace-elements-apatite-magnetite/blob/main/part2_apatite_discriminant.md)

## What to expect
This R code contains machine learning algorithms applied for geochemical data:
- Multiple linear regression
- Ridge regression
- Lasso
- Principal Component Analysis (PCA)
- Linear Discriminant Analysis (LDA)
- Log ratio transformations for compositional data analysis (CoDA)

It also contains data visualisation techniques:
- Multiple boxplot visualisation
- Biplots (for PCA)
- Design of petrological diagrams

Most of the code is interchangeable between apatite and magnetite trace element data. Magnetite trace element analysis will be published later on.

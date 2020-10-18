# Indicator Minerals As Proxies for Mineral Deposits: Statistical Analysis of Trace Elements in Apatite and Magnetite
Code for the statistical analysis in my MS dissertation: 

- [Trace element geochemistry of apatite and magnetite in gold systems of the Alta Floresta mineral province, NW Brazil: Petrogenetic and metallogenic implications](http://hdl.handle.net/11449/193761).

The complete dissertation is also available [here at Github](https://github.com/pedroafleite/trace-elements-apatite-magnetite/blob/main/leite2020_dissertation.pdf).

## Introduction

Indicator minerals, such as apatite and magnetite, are useful for discriminating between barren igneous rocks and hydrothermal alteration halos, since they display contrasting chemical compositions that allow us to infer the distance to a mineral deposit, and to know which type of deposit it is. In this study, textural and compositional patterns in apatite and magnetite were evaluated in the Paleoproterozoic mineral deposits of the Alta Floresta mineral province, in the Amazon Craton, to appraise whether there are unrealised metallogenic potentials in the region. 

Samples were collected from the barren host rocks and from the hydrothermally altered zones of three intrusion-hosted gold deposits (Luizão, Pé Quente and X1 deposits), one epithermal Au + base metals deposit (Francisco deposit), and one anorogeni, barren granitic unit (Teles Pires Intrusive Suite). Apatite and magnetite compositions were measured by electron microprobe (EMP) and laser ablation-inductively coupled plasma-mass spectrometry (LA-ICP-MS). Geochemical data was treated, statistically evaluated, analysed for principal components (PCA), and applied to linear discriminant functions (LDA). 

# Conclusion highlights
- Hydrothermal apatite displays a general decrease in Sr contents and increase in Mn, REE, Y and Fe.
- Propylitic-related apatite has higher LREE and Ge contents.
- Phyllic-related apatite has distinctly high Mn and HREE concentrations, similar to apatites from porphyry Cu-Au deposits (as characterised in Mao et al., 2016).
- Apatite related to anorogenic granites has high trace element compositions and may be discriminated from hydrothermal apatites for containing lower Eu contents.


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

## References

Mao, M., Rukhlov, A. S., Rowins, S. M., Spence, J., & Coogan, L. A. 2016. Apatite trace element compositions: a robust new tool for mineral exploration. *Economic Geology*, 111(5), 1187-1222.

# Academic Performance Dashboard (R Shiny)

## Overview

This project develops an interactive dashboard using **Shiny for R** to explore factors associated with student academic performance.

The dashboard supports:

- Filtering students by **School Type**
- Viewing real-time KPI summary:
  - Average Exam Score
- Exploring relationship between:
  - Study hours and exam performance

The goal is to support data-driven educational decision-making for school administrators and families. The dashboard is publicly deployed on Posit Connect Cloud.

## Installation
Install required packages in R:
```bash
R -e "install.packages(c('shiny','dplyr','readr','ggplot2'))"
```

Clone the repository
```bash
git clone https://github.com/mkmetiuk/DSCI-532-IA-Mykhailo_Kmetiuk.git
```

Go to the root of the repository and run the dashboard locally
```bash
cd DSCI-532-IA-Mykhailo_Kmetiuk
R -e "shiny::runApp()"
```

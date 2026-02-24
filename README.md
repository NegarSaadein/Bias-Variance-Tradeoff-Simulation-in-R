# Bias-Variance Tradeoff Simulation in R

Simulation project demonstrating the bias-variance decomposition in polynomial regression using base R.

## 📌 Overview
Analyzes how model complexity affects prediction error by decomposing Mean Squared Error (MSE) into **Bias²** and **Variance** using Monte Carlo simulation.

## ⚙️ Methodology
- **Data Generation:** $y = x^2 + \epsilon$, where $x \sim U(0,1)$ and $\epsilon \sim N(0, 0.1)$
- **Models:** Polynomial regression with degrees 0, 1, 2, and 20
- **Simulation:** 30 Monte Carlo iterations to estimate expected error components
- **Evaluation:** Log-scaled MSE, Bias², and Variance computed at a fixed test point

## 🚀 Usage
```r
# Run directly in R or RStudio
source("Bias-Variance Tradeoff Simulation in R.R")

# Or via terminal (quotes required due to spaces in filename)
Rscript "Bias-Variance Tradeoff Simulation in R.R"

I am pleased to share a recent technical project focused on the fundamental concepts of statistical learning and model evaluation.
Project Overview:
This simulation investigates the relationship between model complexity and generalization error by decomposing the Mean Squared Error (MSE) into its constituent bias and variance components.
Methodology:
Synthetic data was generated following a quadratic function with Gaussian noise to simulate a non-linear regression problem.
Four models of varying complexity were fitted: a constant model (degree 0), linear regression (degree 1), quadratic regression (degree 2), and a high-degree polynomial (degree 20).
A Monte Carlo simulation with 30 iterations was conducted to estimate the expected prediction error, bias, and variance for each model at a fixed test point.
The results were visualized to illustrate the classical U-shaped curve of test error as a function of model flexibility.
Key Findings:
Low-complexity models exhibited high bias and low variance, characteristic of underfitting.
The quadratic model (degree 2), which matched the true data-generating process, achieved the optimal balance with minimal total MSE.
The high-degree polynomial model demonstrated low bias but substantially elevated variance, confirming the phenomenon of overfitting and its detrimental effect on out-of-sample performance.
This exercise underscores the critical importance of model selection and the necessity of balancing bias and variance to achieve robust predictive performance.

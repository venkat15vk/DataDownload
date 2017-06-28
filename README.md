# Earnings-Analytics

Problem Statement
  Develop a tool to predict Best Sell price on an equity (stock) on earnings day
  Predict EPS for a quarter 
  Based on predicted EPS, predict best sell price 
  Hypotheses – Trader makes a buy only when predicted EPS is a positive surprise.

Model 1: ARIMA 
  Dependent Variable:
    EPS of the next 4 quarters
  Independent Variable
    Historical EPS data (per quarter since 2007).
  Models
    Seasonal (per quarter)
    Continuous 

Model 2: Linear Regression

Dependent Variable:
  EPS
Independent Variable
  Historical Consensus data (per quarter since 2007).

Model 3: Regression with ARIMA errors

  Dependent Variable:
    EPS
  Independent Variable
    Historical Consensus data (per quarter since 2007).
    Historical EPS data
  Models
    Seasonal (continuous) 

Model 4: Linear Regression predict highest sell point
Independent Variables:
EPS
Dependent Variable
Best Sell Price

Training DataSet
Historical EPS

Model 5: ARIMA - Predict Highest Sell Point

Independent Variable
Historical Highest stock price on earnings day
Dependent variable
Highest point in stock price

Historical highest sell price (on earnings announcement day)

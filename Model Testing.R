#Model Performance diagnostics
summary(moneymodel)
summary(ratingsmodel)

set.seed(7106)

newdata <- TMDb6000
test <- predict(moneymodel, newdata)

poly <- cbind(TMDb6000, test)

predictions <- lm(sqrt(revenue) ~ test, poly)

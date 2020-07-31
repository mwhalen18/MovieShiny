#Model Performance diagnostics
summary(moneymodel)
summary(ratingsmodel)

set.seed(7106)

newdata <- TMDb6000
pred.revenue <- predict(moneymodel, newdata)
pred.rating <- predict(ratingsmodel, newdata)

poly <- cbind(TMDb6000, pred.revenue)
polyy <- cbind(poly, pred.rating)

predictions <- lm(sqrt(revenue) ~ pred.revenue, poly)
predictions2 <- lm(vote_average ~ pred.rating, polyy)

revenue.plot <- polyy %>% ggplot(aes(pred.revenue, sqrt(revenue))) + 
  geom_point(alpha = 0.3) + 
  geom_smooth(method = "lm", se = FALSE) + xlab("Model Predictions") + ylab("Actual Revenue")

summary(predictions)$r.squared
summary(predictions2)$r.squared

rating.plot <- polyy %>% ggplot(aes(pred.rating, vote_average)) + 
  geom_point(alpha = 0.3) + 
  geom_smooth(method = "lm", se = FALSE) + xlab("Model Predictions") + ylab("Actual Revenue")



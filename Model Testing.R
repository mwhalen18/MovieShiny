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
  geom_smooth(method = "lm", se = FALSE) + xlab("Model Predictions") + ylab("Actual Revenue") + ggtitle("Model Predictions vs Expected Revenue") +
  annotate("text", x = 6000, y = 45000, label = rev.R2, size = 3) + 
  annotate("text", x = 6000, y = 47500, label = "R^2 = ", size = 3)

rev.R2 <- summary(predictions)$r.squared

rating.plot <- polyy %>% ggplot(aes(pred.rating, vote_average)) + 
  geom_point(alpha = 0.3) + 
  geom_smooth(method = "lm", se = FALSE) + xlab("Model Predictions") + ylab("Actual Rating") + ggtitle("Model Predictions vs Expected Rating") +
  annotate("text", x = 5, y = 7.5, label = rate.R2, size = 3) +
  annotate("text", x = 5, y = 7.75, label = "R^2 = ", size = 3)

rate.R2 <- summary(predictions2)$r.squared



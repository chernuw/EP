# Постройте машину опорных векторов типа "eps-regression" с параметром C = 1, используя ядро
# "radial". Отобразите на графике зависимость среднеквадратичной ошибки на обучающей выборке от
# значения параметра ε. Прокомментируйте полученный результат.

area.pallete <- function(n = 3)
{
  cols <- rainbow(n)
  cols[1:3] = c("PaleGreen", "PaleTurquoise", "Pink")
  return(cols)
}
symbols.pallete <- c("Green", "Blue", "Red")

dataIris <- iris[c("Petal.Width", "Petal.Length", "Species")]
plot (Petal.Width ~ Petal.Length , dataIris , col = Species)

set.seed(0)

x <- seq(0.1, 5, by = 0.05)
y <- log(x) + rnorm(x, sd = 0.3)
plot(x, y) 
model <- svm(x, y, type = "eps-regression", eps = 0.25 , cost= 1)
points (x[model$index], y[model$index], col = "red")

predictions <- predict(model, x)
lines(x, predictions, col = "dodgerblue", lwd = 2)
lines(x, predictions + model$epsilon, col = "cyan")
lines(x, predictions - model$epsilon, col = "cyan")


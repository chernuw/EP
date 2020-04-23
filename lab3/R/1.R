# Загрузите данные из файла reglab1.txt.
reg <- read.table("lab3/reglab1.txt", header = TRUE, sep = "")
x <- reg$x
y <- reg$y
z <- reg$z

# Используя функцию lm, постройте регрессию (используйте разные модели). Выберите наиболее
# подходящую модель, объясните свой выбор.

index_y_x <- lm(formula = y ~ x)
res_y_x <- summary(index_y_x)

index_x_z <- lm(formula = x ~ z)
res_x_z <- summary(index_x_z)

index_z_y <- lm(formula = z ~ y)
res_z_y <- summary(index_z_y)

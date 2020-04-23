# Используя тест Шапиро-Уилка, проверьте, являются ли нормально распределенными характеристики
# цветов ириса(фрейм данных iris). Уровень значимости α=0.05.

sw <- iris$Sepal.Width
sw_st <- shapiro.test(sw)["p.value"]
sl <- iris$Sepal.Length
sl_st <- shapiro.test(sl)["p.value"]
pl <- iris$Petal.Length
pl_st <- shapiro.test(pl)["p.value"]
pw <- iris$Petal.Width
pw_st <- shapiro.test(pw)["p.value"]

hist(pl, col = "green")
hist(pw, col = "yellow")
hist(sl, col = "red")
hist(sw, col = "blue")

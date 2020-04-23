# Загрузите данные из файла cygage.txt.
cygage <- read.table("lab3/cygage.txt", header = TRUE, sep = "")
calAge <- cygage$calAge
depth <- cygage$Depth
weight <- cygage$Weight

# Постройте регрессию, выражающую зависимость возраста исследуемых отложений от глубины залегания,
# используя веса наблюдений. Оцените качество построенной модели.

f <- lm(calAge ~ depth, weights = weight)

plot(depth, calAge)
abline(f)
summary(f)

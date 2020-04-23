# Загрузите данные из файла alligators.txt.
allig <- read.table("lab3/alligators.txt", header = TRUE, sep = "")

length <- allig$Length
weight <- allig$Weight

# Выберите лучшую регресионную модель (возможно нелинейную), отражающую зависимость веса аллигатора
# от его длины.
f <- lm(weight ~ length)
plot(length, weight)
lines(x = length, y = weight)

# Загрузите таблицу из файла allcountries.txt, содержащую информацию о населении, площади и ряде
# других характеристик современных государств.
d <- read.table("lab2/allcountries.txt", header = TRUE, sep = "")

# Выберите из таблицы те страны, для которых доступна информация о населении и площади (нет
# отсутствующих значений NA) и площадь больше 10.
d <- d[!is.na(d$area) &
  !is.na(d$population) &
  d$area > 10,]

# Пусть area_log = log10(log10(area)),
# population_log = log10(log10(population)).
d["area_log"] <- log10(log10(d$area))
d["population_log"] <- log10(log10(d$population))

# Методом наименьших квадратов постройте функцию f(·), моделирующую зависимость population_log от
# area_log с помощью линейной функции population_log = f(area_log) = β0 + β1area_log, т.е. подберите
# коэффициенты β0 и β1.
b0 <- 0.2
b1 <- 0.9
f <- approx(d$area, b0 + b1 * d$area_log, d$area, method = "constant")

# Используя тест Колмогорова-Смирнова, проверьте гипотезу о том, что population_log и f(area_log)
# относятся к одному непрерывному распределению. Уровень значимости α = 0.05
res <- ks.test(d$population_log, f$y)

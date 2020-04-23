# Для k = 10, 15, 20, 25, 30 cгенерируйте 200 реализаций нормальной распределенной случайной
# величины с мат. ожиданием, равным k, и стандартным отклонением, равным √k, и 200 реализаций
# случайной величины, распределенной по закону χ^2 с k степенями свободы.

k <- c(10, 15, 20, 25, 30)

m1 <- matrix(data = 0, nrow = length(k), 200)
m2 <- matrix(data = 0, nrow = length(k), 200)


for (i in seq_along(k)) {
  m1[i,] <- rnorm(n = 200, mean = k[i], sd = sqrt(k[i]))
  m2[i,] <- rchisq(n = 200, df = k[i])
}


# Используя тест Колмогорова-Смирнова, проверьте гипотезу о том, что данные выборки относятся к
# одному непрерывному распределению. Уровень значимости α = 0.05.
m1_m1_1_2 <- ks.test(m1[1,], m1[2,], alternative = "two.sided", exact = TRUE)
m1_m1_1_3 <- ks.test(m1[1,], m1[3,], alternative = "two.sided", exact = TRUE)
m1_m1_1_4 <- ks.test(m1[1,], m1[4,], alternative = "two.sided", exact = TRUE)
m1_m1_1_5 <- ks.test(m1[1,], m1[5,], alternative = "two.sided", exact = TRUE)
m1_m1_2_3 <- ks.test(m1[2,], m1[3,], alternative = "two.sided", exact = TRUE)
m1_m1_2_4 <- ks.test(m1[2,], m1[4,], alternative = "two.sided", exact = TRUE)
m1_m1_2_4 <- ks.test(m1[2,], m1[5,], alternative = "two.sided", exact = TRUE)

m1_m2_1_2 <- ks.test(m1[1,], m2[2,], alternative = "two.sided", exact = TRUE)
m1_m2_1_3 <- ks.test(m1[1,], m2[3,], alternative = "two.sided", exact = TRUE)
m1_m2_1_4 <- ks.test(m1[1,], m2[4,], alternative = "two.sided", exact = TRUE)
m1_m2_1_5 <- ks.test(m1[1,], m2[5,], alternative = "two.sided", exact = TRUE)
m1_m2_2_3 <- ks.test(m1[2,], m2[3,], alternative = "two.sided", exact = TRUE)
m1_m2_2_4 <- ks.test(m1[2,], m2[4,], alternative = "two.sided", exact = TRUE)
m1_m2_2_4 <- ks.test(m1[2,], m2[5,], alternative = "two.sided", exact = TRUE)

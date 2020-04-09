# Сгенерируйте вектор длины N = 1000, элементами которого являются реализации нормально
# распределенной случайной величины с математическим ожиданием равным 1, и стандартным
# отклонением 0.3.
rnorm_1000 <- rnorm(1000, 1, 0.3)

# Подсчитайте статистические оценки мат. ожидания, стандарного отклонения,
# квантилей уровней 0.95 и 0.99 с и без использования встроенных функций. Сравните результат.
rnorm_1000_expected_mean_standart <- mean(rnorm_1000)
rnorm_1000_standart_deviation_standart <- sd(rnorm_1000)
rnorm_1000_quantile_95_standart <- quantile(rnorm_1000, 0.95)
rnorm_1000_quantile_99_standart <- quantile(rnorm_1000, 0.99)

rnorm_1000_expected_mean_custom <- sum(rnorm_1000) / length(rnorm_1000)
rnorm_1000_standart_deviation_custom <- sqrt(var(rnorm_1000))
#rnorm_1000_quantile_95_custom <- rnorm_1000[1000 * 0.95]
#rnorm_1000_quantile_99_custom <- rnorm_1000[1000 * 0.99]

# Исследуйте отклонение статистического мат. ожидания от 1 при росте N (N = 1000, 2000, 4000, 8000, 16000, 32000).
rnorm_2000 <- rnorm(2000, 1, 0.3)
rnorm_2000_expected_mean <- mean(rnorm_2000)

rnorm_4000 <- rnorm(4000, 1, 0.3)
rnorm_4000_expected_mean <- mean(rnorm_4000)

rnorm_8000 <- rnorm(8000, 1, 0.3)
rnorm_8000_expected_mean <- mean(rnorm_8000)

rnorm_16000 <- rnorm(16000, 1, 0.3)
rnorm_16000_expected_mean <- mean(rnorm_16000)

rnorm_32000 <- rnorm(32000, 1, 0.3)
rnorm_32000_expected_mean <- mean(rnorm_32000)


# Загрузите таблицу из файла readingspeed.txt, которая содержит информацию о скорости чтения у детей
# в зависимости от применяемой методики обучения (DRA – direct reading activities, SC – standart
# curriculum).
d <- read.table("lab2/readingspeed.txt", header = TRUE, sep = "")

# Используя t-тест, проверьте гипотезу о том, что среднее время чтения для обеих методик совпадает
# (используйте разные альтернативные гипотезы). Объясните полученные результаты.
t_res <- t.test(Score ~ LearningType, data = d)
t_res_2 <- t.test(Score ~ LearningType, data = d, alternative = "less")

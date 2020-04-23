# Используя критерий χ^2 проверьте гипотезу, состоящую в том, что цвет глаз женщин не зависит от
# цвета волос (на фрейме данных HairEyeColor)
res <- chisq.test(HairEyeColor[, , "Female"], simulate.p.value = TRUE)

# Пусть дан набор точек в xi ∈ R^d, i = 1, 2, . . . , n., каждой из которых поставлено в соотвествие
# некоторое вещественное число y. Реализуйте метод наименьших квадратов, находящий гиперплоскость,
# обеспечивающую наименьшую невязку по y.
# x <- sample(1:50, 50)
x <- sample(1:50, 30, replace = FALSE)
size <- length(x)
# y <- (x + rnorm(size, mean = 5))
y <- sample(1:50, size)


sum_x <- sum(x)
sum_y <- sum(y)

xx <- x * x
xy <- x * y

sum__xx <- sum(xx)
sum__xy <- sum(xy)

a <- (((size * sum__xy) - (sum_x * sum_y)) / ((size * sum__xx) - (sum_x * sum_x)))

b <- ((sum_y - (a * sum_x)) / size)

y_ <- ((a * x) + b)

# Для случая d = 1 нарисуйте график, содержащий исходные точки и найденную прямую.


plot(x, y, col = "red")
points(x, y_, col = "blue")

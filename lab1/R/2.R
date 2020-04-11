# Создайте фрейм данных из N = 20 записей со следующими полями: Nrow – номер записи, Name – имя
# сотрудника, BirthYear – год рождения, EmployYear – год приема на работу, Salary – зарплата.
#
# Заполните данный фрейм данными так, что Nrow изменяется от 1 до N, Name задается произвольно,
# BithYear распределен равномерно (случайно) на отрезке [1960, 1985], EmployYear распределен равномерно
# на отрезке [BirthYear+18, 2006], Salary для работников младше 1975 г.р. определяется по формуле
# Salary = (ln(2007 − EmployYear) + 1) ∗ 8000, для остальных
# Salary = (log2(2007 − EmployYear) + 1) ∗ 8000.
NRow <- 1:20
Name <- c("Jill Mac", "Sacha Moses", "Aairah Bourne", "Juanita Wynn", "Aoife Reader", "Kyan Stark",
          "Farrah Wicks", "Shah Shah", "Shayla Marriott", "Roland Gilbert", "Luisa Houghton",
          "Roscoe Guerra", "Avneet Stamp", "Jean-Luc Cortez", "Kamran Corbett", "Sean Gardiner",
          "Leigha Contreras", "Kimberly Brennan", "Romana Wolf", "Roman Harris")
BirthYear <- trunc(runif(20, min = 1960, max = 1985))
EmployYear <- integer(20)
Salary <- double(20)
f <- data.frame(NRow, Name, BirthYear, EmployYear, Salary)
for (row in seq_len(nrow(f))) {
  f[row, "EmployYear"] <- trunc(runif(1, min = f[row, "BirthYear"] + 18, max = 2006))
  if (f[row, "BirthYear"] < 1975) {
    f[row, "Salary"] <- (log(2007 - f[row, "EmployYear"]) + 1) * 8000
  } else {
    f[row, "Salary"] <- (log2(2007 - f[row, "EmployYear"]) + 1) * 8000
  }
}

# Подсчитайте число сотрудников с зарплатой, большей 15000.
count_with_slary_15000 <- length(which(f["Salary"] > 15000))

# Добавьте в таблицу поле, соответствующее суммарному подоходному налогу (ставка 13%), выплаченному
# сотрудником за время работы в организации, если его зарплата за каждый год начислялась согласно
# формулам для Salary, где вместо 2007 следует последовательно подставить каждый год работы
# сотрудника в организации.
f$Tax <- double(20)
for (row in seq_len(nrow(f))) {
  f[row, "Tax"] <- ((2007 - f[row, "EmployYear"]) * f[row, "Salary"] * 0.13)
}
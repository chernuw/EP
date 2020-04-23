# Среди ядер "polynomial", "radial" и "sigmoid" выберите оптимальное в плане количества ошибок на
# тестовой выборке. Изменяя значение параметра gamma, продемонстрируйте эффект переобучения,
# выполните при этом визуализацию разбиения пространства признаков на области.
area.pallete <- function(n = 3)
{
  cols <- rainbow(n)
  cols[1:3] = c("PaleGreen", "PaleTurquoise", "Pink")
  return(cols)
}
symbols.pallete <- c("Green", "Blue", "Red")

dataIris <- iris[c("Petal.Width", "Petal.Length", "Species")]

set.seed(0)

index <- sample(nrow(dataIris), nrow(dataIris) / 2, replace = FALSE)

dataIrisTrain <- dataIris[index, ]
dataIrisTest <- dataIris[-index, ]

svmModelSigmoid <- svm(Species ~ ., data = dataIrisTest, type ="C-classification", cost = 5, kernel = "radial", gamma = 5)
plot(svmModelSigmoid, dataIrisTest, grid = 250, symbolPalette = symbols.pallete, color.palette = area.pallete)

svmModelSigmoid <- svm(Species ~ ., data = dataIrisTest, type ="C-classification", cost = 5, kernel = "radial", gamma = 150)
plot(svmModelSigmoid, dataIrisTest, grid = 250, symbolPalette = symbols.pallete, color.palette = area.pallete)

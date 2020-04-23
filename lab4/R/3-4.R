# Среди ядер "polynomial", "radial" и "sigmoid" выберите оптимальное в плане количества ошибок на
# тестовой выборке. Попробуйте различные значения параметра degree для полиномиального ядра

# Среди ядер "polynomial", "radial" и "sigmoid" выберите оптимальное в плане количества ошибок на
# тестовой выборке
dataIris <- iris[c("Petal.Width", "Petal.Length", "Species")]

set.seed(0)

index <- sample(nrow(dataIris), nrow(dataIris) / 2, replace = FALSE)

dataIrisTrain <- dataIris[index, ]
dataIrisTest <- dataIris[-index, ]

for (kern in c("polynomial", "radial", "sigmoid")) {
  print(kern)
  
  svmModel <- svm(Species ~ ., data = dataIrisTrain, type ="C-classification", cost = 5, kernel = kern)

  predictionsTest <- predict(svmModel, dataIrisTestObjects)
  print(table(dataIrisTest $"Species", predictionsTest)) 
}

for (degree in c(3, 10, 25, 50)) {
  print(degree)
  
  svmModel <- svm(Species ~ ., data = dataIrisTrain, type ="C-classification", cost=5, kernel="polynomial", degree=degree)
  
  predictionsTest <- predict(svmModel, dataIrisTestObjects)
  print(table(dataIrisTest $"Species", predictionsTest)) 
}



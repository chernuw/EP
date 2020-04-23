# Используя машину опорных векторов типа "C-classification" с линейным ядром, добейтесь нулевой
# ошибки сначала на обучающей выборке, а затем на тестовой, путем изменения параметра C. Выберите
# оптимальное значение данного параметра и объясните свой выбор. Всегда ли нужно добиваться
# минимизации ошибки на обучающей выборке?
dataIris <- iris[c("Petal.Width", "Petal.Length", "Species")]

set.seed(1)

index <- sample(nrow(dataIris), nrow(dataIris) / 2, replace = FALSE)

dataIrisTrain <- dataIris[index, ]
dataIrisTrainObjects <- dataIris[index, c("Petal.Width", "Petal.Length")]
dataIrisTest <- dataIris[-index, ]
dataIrisTestObjects <- dataIris[-index, c("Petal.Width", "Petal.Length")]

for (c in c(1, 5, 25, 50, 100, 200)) {
  print(c)
  
  svmModelLinear <- svm(Species ~ ., data = dataIrisTrain, type = "C-classification", cost = c, kernel = "linear")
  
  predictionsTrain <- predict(svmModelLinear, dataIrisTrainObjects)
  print(table(dataIrisTrain$"Species", predictionsTrain))
  
  predictionsTest <- predict(svmModelLinear, dataIrisTestObjects)
  print(table(dataIrisTest$"Species", predictionsTest)) 

}

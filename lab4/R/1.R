area.pallete <- function(n = 3) {
  cols <- rainbow(n)
  cols[1:3] = c("PaleGreen", "PaleTurquoise", "Pink")
  return(cols)
}
symbols.pallete <- c("Green", "Blue", "Red")
dataIris <- iris[c("Petal.Width", "Petal.Length", "Species")]
plot(Petal.Width ~ Petal.Length, dataIris, col = Species)
set.seed(0)
index <- sample(nrow(dataIris), nrow(dataIris) / 2, replace = FALSE)

dataIrisTrain <- dataIris[index,]
dataIrisTest <- dataIris[-index,]
svmModelLinear <- svm(Species ~ ., data = dataIrisTrain, type = "C-classification", cost = 1, kernel = "linear")

plot(svmModelLinear, dataIrisTrain, grid = 250, symbolPalette = symbols.pallete, color.palette = area.pallete)

dataIrisTrainObjects <- dataIris[index, c("Petal.Width", "Petal.Length")]
dataIrisTestObjects <- dataIris[-index, c("Petal.Width", "Petal.Length")]

predictionsTrain <- predict(svmModelLinear, dataIrisTrainObjects)
table(dataIrisTrain$"Species", predictionsTrain)

predictionsTest <- predict(svmModelLinear, dataIrisTestObjects)
table(dataIrisTest$"Species", predictionsTest)



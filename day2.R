gifts <- as.matrix(read.table("input2.txt", sep="x"))

sides <- function(v)
  v * v[c(3, 1, 2)]

paperNeeded <- function(sides)
  2 * sum(sides) + min(sides)

result <- sum(apply(gifts, 1, function(g) paperNeeded(sides(g))))

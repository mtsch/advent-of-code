gifts <- as.matrix(read.table("input2.txt", sep="x"))

paperNeeded <- function(v) {
  sides <- v * v[c(3, 1, 2)]
  2 * sum(sides) + min(sides)
}

result <- sum(apply(gifts, 1, paperNeeded))

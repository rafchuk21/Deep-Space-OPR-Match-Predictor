createMatchResultsFile <- function(eventKey) {
  filePath <- paste(getwd(), "/matches/", eventKey, ".json", sep="")
  json <- readChar(filePath, file.info(filePath)$size)
  data <- fromJSON(json)
  
  sink(paste(getwd(), "/matches/", eventKey, ".csv", sep = ""))
  for (i in 1:length(data$key)) {
    red <- data$alliances$red$team_keys[i]
    red <- gsub("\"|frc|c|\\(|\\)", "", red)
    blue <- data$alliances$blue$team_keys[i]
    blue <- gsub("\"|frc|c|\\(|\\)", "", blue)
    l <- paste(gsub(paste(eventKey,"_", sep = ""),"",data$key[i]), red, blue, data$alliances$red$score[i], data$alliances$blue$score[i],
               data$winning_alliance[i], sep = ", ")
    l <- paste(l, "\n", sep = "")
    cat(l)
  }
  sink()
}
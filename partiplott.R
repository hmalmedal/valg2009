source("data.R")
library(ggplot2)
partiplott <- function(parti, fylke = "Hele landet") {
  A <- filter(kommuneresultater, Parti == parti)
  if (fylke == "Hele landet") {
    Partiprosent <- filter(landsresultater, Parti == parti)$Prosent
  } else {
    A <- filter(A, Fylke == fylke)
    Partiprosent <- filter(fylkesresultater, Fylke == fylke,
                           Parti == parti)$Prosent
  }
  p <- ggplot(data = A, aes(xmin = 0, ymin = 0))
  p <- p + geom_point(aes(y = sort(Prosent),
                          x = seq_along(Prosent)))
  p <- p + labs(title = paste(parti, fylke, sep = "\n"),
                x = NULL,
                y = "Prosent")
  p <- p + geom_abline(intercept = Partiprosent, slope = 0)
  p <- p + geom_text(aes(x, y, label = label, hjust = 1.1, vjust = 0.2),
                     data.frame(x = length(A$Prosent), y = max(A$Prosent),
                                label = A$Kommune[which.max(A$Prosent)]))
  print(p)
}
fylkesparti <- function(fylke) {
  filter(fylkesresultater, Fylke == fylke)$Parti
}
fylkesplott <- function(fylke) {
  f <- fylkesparti(fylke)
  invisible(lapply(f, partiplott, fylke))
}
fylker18 <- levels(fylkesresultater$Fylke)[-3]

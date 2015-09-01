source("partiplott.R")
sidelinje <- function(i) {
  return(paste0("\\res{", i, "}"))
}
kapittellinje <- function(fylke) {
  return(paste0("\\section{", fylke, "}"))
}
fylkespartiantall <- function(fylke) {
  return(length(fylkesparti(fylke)))
}
fylkesstartnummer <- cumsum(c(length(partier$Parti),
                              sapply(fylker18,
                                     fylkespartiantall))) + 1
length(fylkesstartnummer) <- length(fylkesstartnummer) - 1
fylkeslinjer <- function(fylke) {
  startnummer <- fylkesstartnummer[match(fylke, fylker18)]
  return(c(kapittellinje(fylke),
           sapply(seq.int(from = startnummer,
                          length.out = fylkespartiantall(fylke)),
                  sidelinje)))
}
skrivresultatlinjerfil <- function() {
  resultatlinjer <- c(kapittellinje("Hele landet"),
                      sapply(1:length(partier$Parti), sidelinje))
  for (fylke in fylker18) {
    resultatlinjer <- append(resultatlinjer, fylkeslinjer(fylke))
  }
  fileConn <- file("resultater.tex")
  writeLines(resultatlinjer, fileConn)
  close(fileConn)
}
skrivresultatlinjerfil()

source("partiplott.R")
sidelinje <- function(i) {
  return(paste("\\res{", i, "}", sep = ""))
}
kapittellinje <- function(fylke) {
  return(paste("\\section{", fylke, "}", sep = ""))
}
fylkespartiantall <- function(fylke) {
  return(length(fylkesparti(fylke)))
}
fylkesstartnummer <- cumsum(c(length(Partiliste$Partinavn),
                              sapply(Fylkesliste$Fylkesnavn[-3],
                                     fylkespartiantall))) + 1
length(fylkesstartnummer) <- length(fylkesstartnummer) - 1
fylkeslinjer <- function(fylke) {
  startnummer <- fylkesstartnummer[match(fylke, Fylkesliste$Fylkesnavn[-3])]
  return(c(kapittellinje(fylke),
           sapply(seq.int(from = startnummer,
                          length.out = fylkespartiantall(fylke)),
                  sidelinje)))
}
skrivresultatlinjerfil <- function() {
  resultatlinjer <- c(kapittellinje("Hele landet"),
                      sapply(1:length(Partiliste$Partinavn), sidelinje))
  for (fylke in Fylkesliste$Fylkesnavn[-3]) {
    resultatlinjer <- append(resultatlinjer, fylkeslinjer(fylke))
  }
  fileConn<-file("resultater.tex")
  writeLines(resultatlinjer, fileConn)
  close(fileConn)
}
skrivresultatlinjerfil()

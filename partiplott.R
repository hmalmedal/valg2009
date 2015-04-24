Valgresultat_2009_kommuner <-
  read.csv("Valgresultat_2009_kommuner.csv",
           sep = ",", dec = ".",
           colClasses = c("factor", "factor", "factor", "factor",
             "factor", "integer", "integer", "numeric", "integer",
             "numeric", "integer", "numeric"))
Valgresultat_2009_statistikk <-
  read.csv("Valgresultat_2009_statistikk.csv", sep = ",", dec = ".",
           colClasses = c("factor", "factor", "factor", "integer",
             "integer", "integer", "integer", "integer"))
Partiliste <-
  data.frame(rbind(c("A", "Det norske Arbeiderparti"),
                   c("SV", "Sosialistisk Venstreparti"),
                   c("RV", "Rødt"),
                   c("SP", "Senterpartiet"),
                   c("KRF", "Kristelig Folkeparti"),
                   c("V", "Venstre"),
                   c("H", "Høyre"),
                   c("FRP", "Fremskrittspartiet"),
                   c("DEM", "Demokratene"),
                   c("DLF", "Det Liberale Folkepartiet"),
                   c("KSP", "Kristent Samlingsparti"),
                   c("KYST", "Kystpartiet"),
                   c("MDG", "Miljøpartiet De Grønne"),
                   c("NKP", "Norges Kommunistiske Parti"),
                   c("PP", "Pensjonistpartiet"),
                   c("SFP", "Samfunnspartiet"),
                   c("TPF", "Tverrpolitisk Folkevalgte"),
                   c("ABORT", "Abortmotstanderne"),
                   c("ES", "Ett (skrift)språk"),
                   c("NPAT", "NorgesPatriotene"),
                   c("NRA", "Norsk Republikansk Allianse"),
                   c("SALL", "Sentrumsalliansen"),
                   c("SAMT", "Samtidspartiet"),
                   c("VIGRID", "Vigrid")))
names(Partiliste) <- c("Parti", "Partinavn")
Fylkesliste <-
  data.frame(cbind(as.vector(unique(Valgresultat_2009_kommuner$Fylke)),
                   as.vector(unique(Valgresultat_2009_kommuner$Fylkesnavn))))
names(Fylkesliste) <- c("Fylke", "Fylkesnavn")
TotaltAntallStemmerLandet <-
  sum(as.numeric(Valgresultat_2009_statistikk$GodkjenteStemmer))
library(ggplot2)
partiplott <- function(fork = "A", fylke = "Hele landet") {
  navn <- as.character(subset(Partiliste, Parti == fork)$Partinavn)
  A <- subset(Valgresultat_2009_kommuner, Parti == fork)
  A <- A[order(A$KommuneID), ]
  if (fylke != "Hele landet")
    A <- subset(A, Fylkesnavn == fylke)
  a <- merge(A, Valgresultat_2009_statistikk, by = "KommuneID")
  if (fylke == "Hele landet") {
    TotaltAntallStemmer <- TotaltAntallStemmerLandet
  } else {
    TotaltAntallStemmer <- sum(as.numeric(a$GodkjenteStemmer))
  }
  A$Prosent <- A$StemmerTotalt / a$GodkjenteStemmer*100
  TotaltAntallPartistemmer <- sum(as.numeric(A$StemmerTotalt))
  Partiprosent <- TotaltAntallPartistemmer/TotaltAntallStemmer*100
  p <- ggplot(data = A)
  p <- p + geom_point(aes(y = sort(Prosent),
                          x = 1:length(Prosent)))
  p <- p + scale_x_continuous(limits = c(0, length(A$Prosent)))
  p <- p + scale_y_continuous(limits = c(0, max(A$Prosent)))
  p <- p + labs(title = paste0(navn, "\n", fylke),
                x = NULL,
                y = "Prosent")
  p <- p + geom_abline(intercept = Partiprosent, slope = 0)
  p <- p + geom_text(aes(x2, y2, label = texthere, hjust = 1.1, vjust = 0.2),
                     data.frame(x2 = length(A$Prosent), y2 = max(A$Prosent),
                                texthere = A$Kommune[which.max(A$Prosent)]))
  print(p)
}
fylkesparti <- function(fylke) {
  return(intersect(Partiliste$Parti, subset(Valgresultat_2009_kommuner,
                                            Fylkesnavn == fylke)$Parti))
}
fylkesplott <- function(fylke) {
  f <- fylkesparti(fylke)
  invisible(lapply(f, partiplott, fylke))
}

source("partiplott.R")
as.null(lapply(as.vector(Partiliste$Parti),partiplott))
fylke="Møre og Romsdal"
fylkesparti <- as.vector(unique(subset(Valgresultat_2009_kommuner,
                                       Fylkesnavn==fylke)$Parti))
fylkesparti <- fylkesparti[1:length(fylkesparti)-1]
as.null(lapply(fylkesparti,partiplott,fylke))

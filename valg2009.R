source("partiplott.R")
as.null(lapply(as.vector(Partiliste$Parti),partiplott))
fylkesplott("Møre og Romsdal")
as.null(lapply(as.vector(Fylkesliste$Fylkesnavn),fylkesplott))

source("partiplott.R")
as.null(lapply(as.vector(Partiliste$Parti), partiplott, pdfut = TRUE))
as.null(lapply(as.vector(Fylkesliste$Fylkesnavn), fylkesplott, pdfut = TRUE))

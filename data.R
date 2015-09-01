library(dplyr)
library(readr)
partier <- read_csv("partier.csv")
kommuneresultater <- read_csv("Valgresultat_2009_kommuner.csv",
                              col_names = c("Fylke", "Kommune", "Parti",
                                            "Stemmer"),
                              col_types = "_cc_c_i_____", skip = 1) %>%
  mutate(Fylke = factor(Fylke, unique(Fylke)),
         Kommune = factor(Kommune, unique(Kommune)),
         Parti = factor(Parti, partier$Partiforkortelse, partier$Parti)) %>%
  group_by(Kommune) %>%
  mutate(Prosent = Stemmer / sum(Stemmer) * 100) %>%
  ungroup()
fylkesresultater <- kommuneresultater %>%
  group_by(Fylke, Parti) %>%
  summarise(Stemmer = sum(Stemmer)) %>%
  mutate(Prosent = Stemmer / sum(Stemmer) * 100) %>%
  ungroup()
landsresultater <- fylkesresultater %>%
  group_by(Parti) %>%
  summarise(Stemmer = sum(Stemmer)) %>%
  mutate(Prosent = Stemmer / sum(Stemmer) * 100)

library(dplyr)
library(readr)
library(readxl)
library(stringr)
partier <- read_csv("partier.csv", col_types = "cc")
kommuneresultater <- read_excel("Valgresultat_2009.xls") %>%
  mutate(Fylke = str_c(str_pad(Fylke, 2, pad = 0), Fylkenavn, sep = " "),
         Kommune = str_c(KommuneID, Kommune, sep = " ") %>%
           str_replace(" Og ", " og "),
         Parti = factor(Parti, partier$Partiforkortelse, partier$Parti)) %>%
  filter(!is.na(Parti)) %>%
  select(Fylke, Kommune, Parti, Stemmer = StemmerTotalt) %>%
  arrange(Fylke, Kommune, Parti) %>%
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

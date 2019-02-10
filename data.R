library(tidyverse)
library(readxl)
kommuneduplikater <- c("Bø", "Herøy", "Nes", "Os", "Sande", "Våler")
partier <- read_csv("partier.csv")
kommuneresultater <- read_excel("Valgresultat_2009.xls") %>%
  arrange(KommuneID) %>%
  mutate(Parti = factor(Parti, partier$Partiforkortelse, partier$Parti)) %>%
  filter(!is.na(Parti)) %>%
  mutate(Fylke = as_factor(Fylkenavn)) %>%
  mutate(i = Kommune %in% kommuneduplikater,
         Kommune = Kommune %>%
           str_replace(" Og ", " og ") %>%
           replace(i, str_c(.[i], " i ", Fylke[i])) %>%
           as_factor()) %>%
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

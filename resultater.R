import::from(magrittr, "%$%")
source("data.R")
library(dplyr)
library(forcats)
library(ggplot2)
library(stringr)
p <- kommuneresultater %>%
  bind_rows(mutate(., Fylke = "Hele landet"), .) %>%
  filter(Fylke != "03 Oslo") %>%
  mutate(Fylke = fct_inorder(Fylke)) %>%
  group_by(Fylke) %>%
  mutate(Fylkesstemmer = sum(Stemmer)) %>%
  do(group_by(., Parti) %>%
       arrange(Prosent) %>%
       mutate(x = seq_along(Prosent)) %>%
       mutate(Fylkesprosent = sum(Stemmer) / Fylkesstemmer * 100) %>%
       do(p = ggplot(., aes(x = x, y = Prosent)) +
            geom_point() +
            geom_abline(slope = 0, intercept = .$Fylkesprosent[1]) +
            geom_text(aes(label = Kommune, hjust = 1.1, vjust = 0.2),
                      top_n(., 1, Prosent)) +
            labs(title = str_c(.$Parti[1], .$Fylke[1], sep = "\n"),
                 x = NULL, y = "Prosent") +
            expand_limits(x = 0, y = 0)
       )
  ) %>%
  ungroup()

p %>%
  mutate(i = seq_along(Fylke)) %>%
  group_by(Fylke) %>%
  summarise(s = str_c("\\section{", first(Fylke), "}\n",
                      str_c("\\res{", i, "}", collapse = "\n"))) %$%
  cat(s, file = "resultater.tex", sep = "\n")

pdf("resultater.pdf", height = 0.87 * 7)
purrr::walk(p$p, print)
dev.off()

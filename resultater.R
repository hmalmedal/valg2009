library(tidyverse)

source("data.R")

d <- kommuneresultater %>%
  bind_rows(mutate(., Fylke = "Hele landet"), .) %>%
  filter(Fylke != "Oslo") %>%
  mutate(Fylke = as_factor(Fylke)) %>%
  group_by(Fylke) %>%
  mutate(Total = sum(Stemmer)) %>%
  group_by(Fylke, Parti) %>%
  arrange(Prosent) %>%
  mutate(x = seq_along(Prosent)) %>%
  mutate(Fylkesprosent = sum(Stemmer) / Total * 100)

p <- d %>%
  group_split() %>%
  map(~ggplot(., aes(x = x, y = Prosent)) +
        geom_point() +
        geom_abline(slope = 0, intercept = .$Fylkesprosent[1]) +
        geom_text(aes(label = Kommune, hjust = 1.1, vjust = 0.2),
                  top_n(., 1, Prosent)) +
        labs(title = .$Parti[1], subtitle = .$Fylke[1],
             x = NULL, y = "Prosent") +
        expand_limits(x = 0, y = 0)
  )

d %>%
  group_keys() %>%
  mutate(i = seq_along(Fylke)) %>%
  group_by(Fylke) %>%
  summarise(s = str_c("\\section{", first(Fylke), "}\n",
                      str_c("\\res{", i, "}", collapse = "\n"))) %>%
  pluck("s") %>%
  write_lines("resultater.tex")

pdf("resultater.pdf", height = 0.87 * 7)
walk(p, print)
dev.off()

library(tidyverse)

words <- "(?i)\\b(Palestin(e|ian|ians)?|Israel(i|ite|ites)?|Gaz(a|an)?|Rafah|Jew(ish|s)?|Zio(nist|nazi|nism)?|Naz(i|is|ism)?|Aryan|Goy|Qanon|Heil|Supremacis(t|m)|Ant(i-?semit(ic|ism)|i-?Israel|i-?Zionist)|Apartheid|Israhell|Holocaust\\s*denial|Intifada|BDS|Boycott\\s*Israel|Kike|Holohoax|Hamas|Hezbollah|West\\s*Bank|Fatah|Al\\s*Aqsa|Temple\\s*Mount|Jerusalem|Occupation|Settler(s|ment)?|Checkpoints|Two-state\\s*solution|Golan\\s*Heights|Yom\\s*Kippur\\s*War|Six-Day\\s*War|Lebanon|Sabra\\s*and\\s*Shatila|Oslo\\s*Accords|Camp\\s*David|Peace\\s*Process)\\b"


classify_data <- function(df) {
  l <- (
    unlist(with(df, map(notes, function(x) grepl(words, x, ignore.case=TRUE)))) |
    unlist(with(df, map(actor1, function(x) grepl(words, x, ignore.case=TRUE)))) |
    unlist(with(df, map(actor2, function(x) grepl(words, x, ignore.case=TRUE)))) |
    unlist(with(df, map(assoc_actor_1, function(x) grepl(words, x, ignore.case=TRUE)))) |
    unlist(with(df, map(assoc_actor_2, function(x) grepl(words, x, ignore.case=TRUE))))
  ) %>%
  as.numeric()
  df$auto <- l
  df
}

df1 <- read.csv("../../../datasets/acleddata/experiment-4/sample.csv") %>%
  select(event_id_cnty, actor1, actor2, assoc_actor_1, assoc_actor_2, notes) %>%
  classify_data %>% select(event_id_cnty, auto)

df2 <- read.csv("../../../datasets/acleddata/experiment-4/classification-1.csv") %>%
  select(event_id_cnty, manual)

merge(df1, df2) %>%
  write.csv("../../../datasets/acleddata/experiment-4/classification-2.csv", row.names=FALSE)




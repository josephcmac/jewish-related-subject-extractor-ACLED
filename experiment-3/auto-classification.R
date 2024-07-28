library(tidyverse)

words <- "\\b(Palestine|Israel|Gaza|Rafah|Jew|Zio|Nazi|Aryan|Goy|Qanon|Heil|supremacist|supremacism|antisemitic|anti-Semitic|zionism|apartheid|israhell|holocaust\\s*denial|free\\s*palestine|intifada|bds|boycott\\s*israel|zionist|kike|holohoax|zionazi|anti\\s*israel|anti\\s*zionist|\\bnazi\\b|\\bzion\\b|\\bjew\\b|\\bqanon\\b)\\b"


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

df1 <- read.csv("../../../datasets/acleddata/experiment-3/sample.csv") %>%
  select(event_id_cnty, actor1, actor2, assoc_actor_1, assoc_actor_2, notes) %>%
  classify_data %>% select(event_id_cnty, auto)

df2 <- read.csv("../../../datasets/acleddata/experiment-3/classification-1.csv") %>%
  select(event_id_cnty, manual)

merge(df1, df2) %>%
  write.csv("../../../datasets/acleddata/experiment-3/classification-2.csv", row.names=FALSE)




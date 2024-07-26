library(tidyverse)

words <- "Palestine|Israel|Gaza|Rafah|Jew|Zio|Nazi|Aryan|Goy"

classify_data <- function(df) {
  l <- (
	unlist(with(df, map(notes, function(x) grepl(words, x, ignore.case=T)))) |
	unlist(with(df, map(actor1, function(x) grepl(words, x, ignore.case=T)))) |
	unlist(with(df, map(actor2, function(x) grepl(words, x, ignore.case=T)))) |
	unlist(with(df, map(assoc_actor_1, function(x) grepl(words, x, ignore.case=T)))) |
	unlist(with(df, map(assoc_actor_2, function(x) grepl(words, x, ignore.case=T))))
	) %>%
	as.numeric()
  df$auto <- l
  df
}

df1 <- read.csv("../../../datasets/acleddata/experiment-2/sample.csv") %>%
    	select(event_id_cnty, actor1, actor2,assoc_actor_1, assoc_actor_2, notes) %>%
    	classify_data %>% select(event_id_cnty, auto)

df2 <- read.csv("../../../datasets/acleddata/experiment-2/classification-1.csv") %>%
	select(event_id_cnty, manual)

merge(df1, df2) %>%
	write.csv("../../../datasets/acleddata/experiment-2/classification-2.csv", row.names=FALSE)



library(tidyverse)

FILENAME <- "clean0.csv"


set.seed(100)
read.csv(paste0("../../../datasets/acleddata/clean/", FILENAME)) %>%
    	select(event_id_cnty, actor1, actor2,assoc_actor_1, assoc_actor_2, notes) %>%
	slice_sample(n = 100, replace = FALSE) %>%
    	write.csv("../../../datasets/acleddata/experiment-3/sample.csv", row.names=FALSE)



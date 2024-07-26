library(tidyverse)
library(spacyr)

# Initialize spacyr with the specified model
spacy_initialize(model = "en_core_web_sm")

extract_organizations <- function(text) {
  # Parse the text using spacy_parse with entity recognition
  parsed_text <- spacy_parse(text, entity = TRUE)
  
  # Filter tokens labeled as organizations
  org_tokens <- parsed_text %>% filter(entity == "ORG_B" | entity == "ORG_I")
  
  # Initialize an empty vector to store organizations
  organizations <- c()
  current_org <- ""
  
  # Check if org_tokens is not empty
  if (nrow(org_tokens) > 0) {
    # Loop through organization tokens
    for (i in 1:nrow(org_tokens)) {
      if (!is.na(org_tokens$entity[i])) {
        if (org_tokens$entity[i] == "ORG_B") {
          # Start of a new organization entity
          if (current_org != "") {
            organizations <- c(organizations, current_org)
          }
          current_org <- org_tokens$token[i]
        } else if (org_tokens$entity[i] == "ORG_I") {
          # Continuation of the current organization entity
          current_org <- paste(current_org, org_tokens$token[i])
        }
      }
    }
    
    # Add the last detected organization if any
    if (current_org != "") {
      organizations <- c(organizations, current_org)
    }
  }
  
  # Return unique organizations
  return(unique(organizations))
}

# Read the dataset
df <- read.csv("../../../datasets/acleddata/clean/clean1.csv", 
               sep=",", 
               header=TRUE, 
               quote = "\"") %>% 
  na.omit()

# Check if the 'notes' column exists and is not empty
if ("notes" %in% colnames(df) && !all(is.na(df$notes))) {
  # Apply the extract_organizations function to each row
  df <- df %>%
    rowwise() %>%
    mutate(`anti-Israel organization` = list(extract_organizations(notes))) %>%
    unnest(`anti-Israel organization`) %>%
    select(event_id_cnty, `anti-Israel organization`)

  
  # Write the results to a CSV file
  write.csv(df, "../../../datasets/acleddata/clean/clean2.csv", row.names=FALSE)
}

# Finalize spacyr
spacy_finalize()


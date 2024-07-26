# Load necessary libraries
library(caret)
library(dplyr)

# Read the dataset
data <- read.csv("../../../datasets/acleddata/experiment-1/classification-2.csv")

# Extract the classifications
y_true <- data$manual
y_pred <- data$auto

# Create confusion matrix
conf_matrix <- confusionMatrix(factor(y_pred), factor(y_true))

# Extract metrics from confusion matrix
tn <- conf_matrix$table[1,1]
tp <- conf_matrix$table[2,2]
fn <- conf_matrix$table[1,2]
fp <- conf_matrix$table[2,1]

# Calculate accuracy
accuracy <- conf_matrix$overall['Accuracy']

# Calculate precision
precision <- conf_matrix$byClass['Pos Pred Value']

# Calculate recall
recall <- conf_matrix$byClass['Sensitivity']

# Calculate F1 Score
f1_score <- 2 * (precision * recall) / (precision + recall)

# Print results
cat("Confusion Matrix:\n")
print(conf_matrix$table)

cat("\nMetrics:\n")
cat("True Positives (TP):", tp, "\n")
cat("True Negatives (TN):", tn, "\n")
cat("False Positives (FP):", fp, "\n")
cat("False Negatives (FN):", fn, "\n")
cat("Accuracy:", accuracy, "\n")
cat("Precision:", precision, "\n")
cat("Recall:", recall, "\n")
cat("F1 Score:", f1_score, "\n")


# Experiment Design 1: Classification of ACLED Dataset Rows Related to Jewish People

## Overview

This experiment aims to evaluate an algorithm designed to classify rows of the ACLED dataset based on their relevance to Jewish people (including Israel). The dataset `USA_Canada_2020_2024_Jul12.csv` contains 70,203 datapoints about the USA. We will take a random sample of 100 datapoints for manual classification and then apply our algorithm to the same sample. The results will be compared to measure the algorithm's accuracy.

## Objectives

- To manually classify 100 randomly selected rows from the ACLED dataset regarding their relevance to Jewish people.
- To apply an algorithm to classify the same 100 rows.
- To compare the manual classification results with the algorithm's results to evaluate its performance.

## Methodology

### Step 1: Data Sampling

1. **Random Sampling**:
    - Extract a random sample of 100 rows from the ACLED dataset containing 70,203 datapoints.

### Step 2: Manual Classification

1. **Manual Review**:
    - Each row in the sample will be manually reviewed by experts to determine if it is related to Jewish people (including Israel).
    - Classification will be binary: "Related" (1) or "Not Related" (0).

2. **Criteria for Classification**:
    - Events, incidents, or activities explicitly mentioning Jewish people, Israel, or related entities will be classified as "Related" (1).
    - All other rows will be classified as "Not Related" (0).

### Step 3: Algorithmic Classification

1. **Algorithm Application**:
    - Apply the pre-designed algorithm to classify the same 100 sampled rows.

### Step 4: Evaluation and Comparison

1. **Result Comparison**:
    - Compare the results of manual classification with those obtained from the algorithm.
    - Metrics to be used for comparison include accuracy, precision, recall, and F1 score.

2. **Analysis**:
    - Identify discrepancies between manual and algorithmic classifications.
    - Analyze the reasons for any mismatches to improve the algorithm.

## Expected Outcome

- A detailed comparison of manual and algorithmic classifications.
- Metrics and analysis highlighting the algorithm's performance.
- Insights into areas where the algorithm can be improved.


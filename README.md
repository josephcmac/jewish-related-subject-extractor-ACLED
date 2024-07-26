# Jewish-Related Subject Extractor for the ACLED Dataset

## Overview

This tool is designed to extract events related to Jewish topics from the ACLED (Armed Conflict Location & Event Data Project) dataset, with a focus on demonstrations and incidents involving Jewish people, Israel, and antisemitism. The goal is to support research on antisemitism by providing a method to identify relevant events within a large dataset. The tool includes performance testing through sampling methods to ensure accuracy and reliability.

## Table of Contents
1. [Experiment Design](#experiment-design)
2. [Objectives](#objectives)
3. [Methodology](#methodology)
   - [Data Sampling](#data-sampling)
   - [Manual Classification](#manual-classification)
   - [Algorithmic Classification](#algorithmic-classification)
   - [Evaluation and Comparison](#evaluation-and-comparison)
4. [Expected Outcome](#expected-outcome)
5. [How to Use](#how-to-use)
6. [Getting the ACLED Dataset](#getting-the-acled-dataset)
7. [Contributing](#contributing)
8. [License](#license)

# Experiment Design

## Overview

The experiment aims to evaluate an algorithm designed to classify rows of the ACLED dataset based on their relevance to Jewish people and related topics (including Israel). The dataset `USA_Canada_2020_2024_Jul12.csv` contains 70,203 data points about the USA. A random sample of 100 data points will be manually classified and compared against the algorithm's classification to measure its accuracy.

## Objectives

- Manually classify 100 randomly selected rows from the ACLED dataset regarding their relevance to Jewish people.
- Apply an algorithm to classify the same 100 rows.
- Compare the manual classification results with the algorithm's results to evaluate its performance.

## Methodology

### Data Sampling

1. **Random Sampling**:
    - Extract a random sample of 100 rows from the ACLED dataset containing 70,203 data points.

### Manual Classification

1. **Manual Review**:
    - Each row in the sample will be manually reviewed by experts to determine if it is related to Jewish people (including Israel).
    - Classification will be binary: "Related" (1) or "Not Related" (0).

2. **Criteria for Classification**:
    - Events, incidents, or activities explicitly mentioning Jewish people, Israel, or related entities will be classified as "Related" (1).
    - All other rows will be classified as "Not Related" (0).

### Algorithmic Classification

1. **Algorithm Application**:
    - Apply the pre-designed algorithm to classify the same 100 sampled rows.

### Evaluation and Comparison

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

## How to Use

1. **Installation**:
    - Clone the repository: `git clone https://github.com/yourusername/Jewish-Related-Subject-Extractor.git`
    - Navigate to the directory: `cd Jewish-Related-Subject-Extractor`
    - Install required dependencies: `pip install -r requirements.txt`

2. **Running the Tool**:
    - Ensure the ACLED dataset is in the appropriate directory.
    - Run the script: `python extract_jewish_related_events.py`

3. **Viewing Results**:
    - Results will be saved in the `results` directory as CSV files and performance metrics as a report.

## Getting the ACLED Dataset

To use this tool, you need to download the ACLED dataset. Follow these steps:

1. Visit the [ACLED USA and Canada dataset page](https://acleddata.com/united-states-and-canada/usa/).
2. Click on the "Download" button to access the dataset.
3. Save the dataset file (e.g., `USA_Canada_2020_2024_Jul12.csv`) to your local machine.
4. Place the dataset file in the directory where the tool is located.



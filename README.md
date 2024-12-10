# BIA-IoMT-Cyber-HES24
A repository for exploring Bio-Inspired Algorithms (BIA) in cybersecurity, applying them to the IoMT 2024 dataset as part of a Data Science Master's project at HES, culminating in December 2024. The repository includes all necessary scripts to reproduce the work presented in the paper, including data preprocessing, algorithm implementation, model training and evaluation, and performance benchmarking against traditional methods.

Steps to reproduce:
1) Download raw data from Kaggle
2) Run __dataset_labelling.R__ to prepare data
3) Run __benchmark_only.ipynb__ to get baseline comparison results based on classic ML and full dataset
4) Run __pso_feature_selection_random_forest_only.ipynb__ feature reduction with PSO and RF classification
5) Run __GA_feature_selection_random_forest.ipynb__ feature reduction with GA and RF classification
6) Run __AIS_v5_with_IoMT_visualizations.ipynb__ semi-supervised classificaton with AIS

**Dataset:** the CIC IoMT 2024 Dataset, prepared by the Canadian Institute for Cybersecurity (CIC), contains labeled network traffic data simulating IoMT devices and cyberattacks, supporting research in threat detection and algorithm development (https://www.unb.ca/cic/datasets/iomt-dataset-2024.html). A combined dataset containing both training and test subsets is available for download in CSV and/or Parquet formats on Kaggle for convenience: https://www.kaggle.com/datasets/limamateus/cic-iomt-2024-wifi-mqtt

**Environment:** the description of the environment, including instance type, storage, and other configurations, along with details on the notebooks executed in AWS SageMaker, is provided in the paper.

**Authors:** Alex Coward, Dmitry Gavrilkoff, Jessica Kotini, Greg Meinert, Christopher Tam






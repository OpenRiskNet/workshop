

Jaqpot predictions 15+5
Philip Doganis and Pantelis Karatzas (NTUA)
Prerequisites
Install Anaconda or other method for executing Jupyter notebooks.   
Outline
Download the Blood-brain barrier dataset from Lazar, calculate mordred descriptors, curate the results to produce a dataset usable for modelling. Build a model in Jupyter notebooks, evaluate model performance. Upload newly created model to Jaqpot and get predictions from web service.

Exercise
Get the Blood-brain barrier dataset from Lazar
Convert Smiles to Mol representation
Calculate mordred descriptors
Join the compounds with their descriptors
Preprocessing
Build a model with the most important variables by Recursive Feature Elimination
Cross-validation of logistic regression model
Evaluation of model performance
Deploy the model to Jaqpot service (from model to web service in 1 line of code)
Get a prediction from the newly created model

Lazar predictions  7+2
Denis Gebele (JGU)
Prerequisites
Command line cURL (examples) or any kind of API tool that supports REST requests e.g. Postman . Jupyter notebook (examples) or simply using the SwaggerUI.
Outline
Lazar service comes with pre-trained models. For this use case the service provides the training dataset for the consensus model. This part of the workshop explains how to get to the dataset to use it for other services.
Exercise (Postman collection)
Find existing model of interest
GET and inspect endpoints list
GET and inspect endpoint of interest
Inspect model details
GET and inspect model
GET and inspect model validation statistics
POST a compound to predict with model
GET dataset ID for next step 
Get model training dataset
GET and inspect dataset
GET and store dataset

Create WEKA Models 13+5
Atif Raza (JGU)
Prerequisites
Basic Docker usage (pull and run images). Download the jguweka/chem_descriptor_miner image from Docker hub. Submission of REST queries using Postman or a similar tool or using the web interface of JGU Weka REST API for model creation/evaluation.
Outline
The JGU Weka REST API exposes machine learning algorithms from the Weka framework for creating such models based on user-provided data. A feature-based version of a given dataset will be created which can then be used for creating a model using some exposed algorithms.
Exercise
Create a feature-based transformation of a dataset
Basics of ARFF datasets
Preprocess and transform a dataset based on different extracted features
Create a model
POST and inspect task
GET task status, etc.
GET resulting model
Inspect model statistics

Integrating multiple predictions 15+5
Tomaž Mohorič (EwC) and Jonathan Alvarsson (UU)
Prerequisites
Jupyter notebooks for the consensus predictions. 
Outline
Introduction to Conformal and Cross Venn-Abers Predictors (10 min): demonstration of Service for individual prediction + hands-on with the graphical UI. 
Consensus prediction (10 min):
Intro to Dempster-Shafer theory
Application of DST for the blood-brain barrier prediction: comparison of individual predictive models (Jaqpot, JGU Weka, Lazar, CPSign) and the consensus using ROC and AUC.
Hands-on: making a consensus prediction for a single compound: online version (access web API of Lazar, CPSign) or offline version (using precalculated predictions of Jaqpot, JGU Weka, Lazar, CPSign.

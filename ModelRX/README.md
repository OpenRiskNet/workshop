## EXERCISES 

  

### Lectures and demonstrations

  

#### Jaqpot predictions

Philip Doganis and Pantelis Karatzas (NTUA)

##### Prerequisites

Install [Anaconda](https://www.anaconda.com/downloads) or other method for executing [Jupyter notebooks](https://jupyter.org/install).   

##### Outline

Download the Blood-brain barrier dataset from Lazar, calculate mordred descriptors, curate the results to produce a dataset usable for modelling. Build a model in Jupyter notebooks, evaluate model performance. Upload newly created model to Jaqpot and get predictions from web service.

  

##### Exercise

1. Get the Blood-brain barrier dataset from Lazar 
2. Convert Smiles to Mol representation 
3. Calculate mordred descriptors 
4. Join the compounds with their descriptors 
5. Preprocessing 
6. Build a model with the most important variables by Recursive Feature Elimination 
7. Cross-validation of logistic regression model 
8. Evaluation of model performance 
9. Deploy the model to Jaqpot service (from model to web service in 1 line of code) 
10. Get a prediction from the newly created model 
  

#### Lazar predictions

Denis Gebele (JGU)

##### Prerequisites

Command line [cURL](https://curl.haxx.se/) ([examples](https://github.com/OpenRiskNet/home/tree/master/openshift/deployments/lazar#curl-examples)) or any kind of API tool that supports REST requests e.g. [Postman](https://www.getpostman.com/) . [Jupyter notebook](https://jupyter.org/install) ([examples](https://github.com/OpenRiskNet/workshop/blob/master/ModelRX/Blood-brain%20barrier%20-%20Lazar/lazar-workflow-get-model-training-data.ipynb)) or simply using the [SwaggerUI](https://lazar.prod.openrisknet.org/).

##### Outline

Lazar service comes with pre-trained models. For this use case the service provides the training dataset for the consensus model. This part of the workshop explains how to get to the dataset to use it for other services.

##### Exercise (Postman[collection](https://raw.githubusercontent.com/OpenRiskNet/workshop/master/ModelRX/lazar_workflow_workshop.postman_collection.json))

1. Find existing model of interest 
    1. GET and inspect endpoints list 
    2. GET and inspect endpoint of interest 

2. Inspect model details 
    1. GET and inspect model 
    2. GET and inspect model validation statistics 
    3. POST a compound to predict with model 
    4. GET dataset ID for next step  

3. Get model training dataset 
    1. GET and inspect dataset 
    2. GET and store dataset 

  

Create WEKA Models

Atif Raza (JGU)

##### Prerequisites

Basic Docker usage (pull and run images). Download the [jguweka/chem_descriptor_miner](https://hub.docker.com/r/jguweka/chem_descriptor_miner) image from Docker hub. Submission of REST queries using Postman or a similar tool or using the web interface of [JGU Weka REST API](https://jguweka.prod.openrisknet.org/) for model creation/evaluation.

##### Outline

The JGU Weka REST API exposes machine learning algorithms from the Weka framework for creating such models based on user-provided data. A feature-based version of a given dataset will be created which can then be used for creating a model using some exposed algorithms.

Exercise

1. Create a feature-based transformation of a dataset 
    1. Basics of ARFF datasets 
    2. Preprocess and transform a dataset based on different extracted features 

2. Create a model 
    1. POST and inspect task 
    2. GET task status, etc. 
    3. GET resulting model 
    4. Inspect model statistics 

  

#### Integrating multiple predictions

Tomaž Mohorič (EwC) and Jonathan Alvarsson (UU)

##### Prerequisites

[Jupyter notebooks](https://github.com/OpenRiskNet/workshop/tree/master/ModelRX/Blood-brain%20barrier%20-%20Consensus) for the consensus predictions. 

##### Outline

- Introduction to Conformal and Cross Venn-Abers Predictors (10 min): demonstration of Service for individual prediction + hands-on with the graphical UI.  
- Consensus prediction (10 min): 
    - Intro to Dempster-Shafer theory 
    - Application of DST for the blood-brain barrier prediction: comparison of individual predictive models (Jaqpot, JGU Weka, Lazar, CPSign) and the consensus using ROC and AUC. 
    - Hands-on: making a consensus prediction for a single compound: online version (access web API of Lazar, CPSign) or offline version (using precalculated predictions of Jaqpot, JGU Weka, Lazar, CPSign. 

  
  

 

## Create WEKA Models

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

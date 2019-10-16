## Lazar predictions

Denis Gebele (JGU)

### Prerequisites

Command line [cURL](https://curl.haxx.se/) ([examples](https://github.com/OpenRiskNet/home/tree/master/openshift/deployments/lazar#curl-examples)) or any kind of API tool that supports REST requests e.g. [Postman](https://www.getpostman.com/) . [Jupyter notebook](https://jupyter.org/install) ([examples](https://github.com/OpenRiskNet/workshop/blob/master/ModelRX/Blood-brain%20barrier%20-%20Lazar/lazar-workflow-get-model-training-data.ipynb)) or simply using the [SwaggerUI](https://lazar.prod.openrisknet.org/).

### Outline

Lazar service comes with pre-trained models. For this use case the service provides the training dataset for the consensus model. This part of the workshop explains how to get to the dataset to use it for other services.

### Exercise (Postman [collection](https://raw.githubusercontent.com/OpenRiskNet/workshop/master/ModelRX/lazar_workflow_workshop.postman_collection.json))

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

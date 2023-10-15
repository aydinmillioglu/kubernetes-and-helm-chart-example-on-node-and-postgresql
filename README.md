## Definition
CI/CD Pipeline for Node API with Express and Postgres

Origin app:
  https://github.com/ishan-is-me/Node_API

## About the Application
This application can be used for API Integrations to an external POSTGRESQL database. It is working on kubernetes clusters and deployment is done via Helm.

There are two databases on the postgresql external db: foodie and foodie_test

## Installation
For deployment, Helm is used for package managing. Following command is used for create a new helm chart
   ```sh
    helm create deploy
   ```
   
To install the chart, following command is used.
   ```sh
    helm install deploy ./deploy 
   ```  
   
As Kubernetes Cluster, minikube is used. The service started with the following command.
  ```sh
    minikube service start deploy
  ```    
Then we can check our services on the url that is shown on the output of the command.

New deployments can be easily done by the following commands if needed.
  ```sh
   helm upgrade deploy ./deploy
  ``` 
  
## Helm Chart
  - In the chart, main variables are set in the values.yaml.
    * The number of pods is set to 2. It can be changed for the requirements of the project or deleted if autoscaling is wanted.
    * The image that is deployed is defined in this file.
    * Also the service variables for connection is defined.
  - On the templates/deployment.yaml file, the environment variables of the containers are set. 
    * Port of the container, connection strings and the environment value can change from here.
    * By this way, Environment changes can be applied over the cluster. It can be set production or test. This will change the connection string to the database.
    * Also if you want to change the DB that is connected, you can directly do it from the chart.

## Usage Notes
  1. If the application is going to be used on different databases. The changes that required can be done on the helm chart itself. By this way, there is no need to re-build the source code.
  2. If updates done on the application, the image needed to be updated and pushed to dockerhub with a new version. To apply it to the application, Just change the version under the service in the values.yaml file and deploy it with deploy command. If you want this process to be automatically done, change the image tag to latest and pullPolicy to Always in the values.yaml file. This will update the pods.

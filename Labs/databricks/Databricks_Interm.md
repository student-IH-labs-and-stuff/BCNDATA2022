

# Lab | DataBricks - intermediate

In this second lab we will work with data science methods on small and big data sources in the cloud and complete some steps which help us think about the production deployment processes and methods in DataBricks. 



## steps 


1) ensure you have a running cluster - you will possibly have to recreate your cluster from yesterday if there is no active cluster. On the community edition clusters are deleted if unused for a period of time. 

2) next import your data for your first data science approach - small data - this is going to be the Strokes data set we used on previous lessons. You will find this in the class materials on GitHub. 
It is important when creating and working with this data table that you do the following steps : 

- create Table, Preview in the UI and open table in a Notebook
- the data table stored is populated from the strokes_data.csv and should be stored under a DFBS target directory '/strokes/' so it is easy for you to locate in the file store
- set the headers from the first row - you can specify that at creation point, or in the first python cell of the notebook(this will be first if the notebook is default python!) or when previewing the table through the UI. Hint: change one parameter/ headers are in first row = true 
- name your notebook eg. strokes_import_csv to differentiate this notebook from others that you may later upload

3) run your ML model - 

4) Import the existing Jupiter notebook you had for this data source (hint : we worked on this in class during week 4 - to understand data imbalance) 

5) Deploy models and manage production deployment stages -in the community edition we don't have a full production job capacity or git integration :( however we will set up a production flow using folders in our workspace AND we can use a simple managed MLflow experience for lightweight experimentation in the Community Edition too. For more information on ML flow see the documentation https://docs.databricks.com/applications/mlflow/index.html and https://www.mlflow.org/




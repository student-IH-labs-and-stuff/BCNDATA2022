

# Lab | DataBricks - intermediate

In this second lab we will work with data science methods on small and big data sources in the cloud and complete some steps which help us think about the production deployment processes and methods in DataBricks. 



## steps 


1) ensure you have a running cluster - you will possibly have to recreate your cluster from yesterday if there is no active cluster. On the community edition clusters are deleted if unused for a period of time. 

---------
### Part 1 - quite big data - for this challenge you should be in the Data Science and Engineering mode.

2) you already should have uploaded your 'big' data source, the instacart market basket analysis data collection. Here is a description on Kaggle which may be helpful https://www.kaggle.com/c/instacart-market-basket-analysis/overview. As you can see the data is large and broken over multiple tables, so working with it, analysing and then using data science methods to predict the basket is going to involve data engineering. 
3) next, load the notebook from here https://databricks.com/notebooks/gallery/MarketBasket.html
4) to run the notebook you will need to change the data locations - pointing at the DBFS storage / folders you have saved the files to. 
5) following the notebook cells, you will see the following steps which are familiar to you as your end to end data science flow, but with more focus on engineering the data into a different shape when needed, for which you will see pyspark sql is used  : 
- ingest data 
- review and explore, visualise 
- reshape the data as needed ( in this case by individual basket so we know which food items each order included)
- modeling 
6) the models used here are going to be unfamiliar to you because they are for frequency pattern mining, rather than classification or regression, which we have worked with. Note that the scala.api is used to call the models and we switch language again to [scala](https://www.scala-lang.org/) and choose the model FP growth. 
7) the result of our basket analysis is that we can explore the most frequently purchased items and predict which items will be purchased alongside others (note the degree of confidence in the right column of the last output cell) 


-------------

## part 2 - quite small data but using ML flow - for this challenge you should be in Machine Learning mode

2) our goal is to work with multiple models inside databricks. As an example I am giving you two jupyter notebooks on the Strokes data which we used in week 4. One 
3) next import your data for your first data science approach - small data - this is going to be the Strokes data set we used on previous lessons. You will find this in the class materials on GitHub. 
It is important when creating and working with this data table that you do the following steps : 

- create Table, Preview in the UI and open table in a Notebook
- the data table stored is populated from the strokes_data.csv and should be stored under a DFBS target directory '/strokes/' so it is easy for you to locate in the file store
- set the headers from the first row - you can specify that at creation point, or in the first python cell of the notebook(this will be first if the notebook is default python!) or when previewing the table through the UI. Hint: change one parameter/ headers are in first row = true 
- name your notebook eg. strokes_import_csv to differentiate this notebook from others that you may later upload

3) run your ML model - 

4) Import the existing Jupiter notebook you had for this data source (hint : we worked on this in class during week 4 - to understand data imbalance) 

5) Deploy models and manage production deployment stages -in the community edition we don't have a full production job capacity or git integration :( however we will set up a production flow using folders in our workspace AND we can use a simple managed MLflow experience for lightweight experimentation in the Community Edition too. For more information on ML flow see the documentation https://docs.databricks.com/applications/mlflow/index.html and https://www.mlflow.org/




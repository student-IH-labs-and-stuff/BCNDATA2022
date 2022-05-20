

# Lab | DataBricks - intermediate

In this second lab we will work with data science methods on small and big data sources in the cloud and complete some steps which help us think about the production deployment processes and methods in DataBricks. Try one or all of the databricks flows below.



## steps 

1) ensure you have a running cluster - you will possibly have to recreate your cluster from yesterday if there is no active cluster or restart it. On the community edition clusters are terminated if unused for a period of time. 

---------
### Flow 1 - quite big data - for this challenge you should be in the Data Science and Engineering mode.

2) as we discussed in class, the 'big' data source is the instacart market basket analysis data collection. Here is a description on Kaggle which may be helpful https://www.kaggle.com/c/instacart-market-basket-analysis/overview. As you can see the data is large and broken over multiple tables, so working with it, analysing and then using data science methods to predict the basket is going to involve data engineering. 
3) next, load the notebook from here https://databricks.com/notebooks/gallery/MarketBasket.html
4) to run the notebook you will need to change the data locations - pointing at the DBFS storage / folders you have saved the files to
5) following the notebook cells, you will see the following steps which are familiar to you as your end to end data science flow, but with an additional step for engineering the data into a new shape when that is needed, for which you will see pyspark sql is used  : 
- ingest data 
- review and explore, visualise 
- reshape the data as needed ( in this case by individual basket so we know which food items each order included)
- modeling 
6) the models used here are going to be unfamiliar to you because they are for frequency pattern mining, rather than classification or regression, which we have worked with. Note that the scala.api is used to call the models and we switch language again to [scala](https://www.scala-lang.org/) and choose the model FP growth. 
7) the result of our basket analysis is that we can explore the most frequently purchased items and predict which items will be purchased alongside others (note the degree of confidence in the right column of the last output cell) 


-------------

## Flow 2 - quite small data but using ML flow to understand training and selection of models- for this challenge you should be in Machine Learning mode

1) our goal is to see how to work with multiple models and experiments inside databricks. This approach utilises a new tool to us , called [MLFLow](https://www.mlflow.org/)- extra documentation [here](https://docs.databricks.com/applications/mlflow/index.html). As you work through this challenge, consider how this set up differs to the way you worked on your iterative models during the mid bootcamp project.  
2) Here is the link to the [model training quickstart notebook](https://docs.databricks.com/applications/machine-learning/train-model/ml-quickstart.html), which you will need to import 
3) you will require a ML cluster (you can terminate the existing cluster and create a new one if needed. On the community edition you can have multiple clusters but only one running at any time) - go to the Compute menu to manage this. 
4) You will need to obtain the data either from the UCI ML Repository or Kaggle, upload it to the databricks file storage and then alter the paths in your notebook
[kaggle red wine](https://www.kaggle.com/uciml/red-wine-quality-cortez-et-al-2009)
[kaggle white wine](https://www.kaggle.com/piyushagni5/white-wine-quality)
6) Run through the notebook - you will be training a gradient boost model to predict wine quality, with various experiments (iterations) with hyperparameter tuning - then using ML flow to find the best model. 


## Flow 3 - thinking about how to deploy to production - for this challenge you can be in any databricks mode

as discussed in class, moving machine learning models from development settings, through testing and into a live mode requires some planning and procedures. 

Note:  in the community edition we don't have a full production job capacity, multiple users or git integration :( 
- however we can set up a production flow using folders in our workspace and create the experience of promoting notebooks between these spaces  

1) Create three folders in your shared workspace calling them '<yourinitials>develop' '<yourinitials>test' '<yourinitials>production'
2) Choose any of your notebooks (or create a new one/ upload one from your local machine) and attach it to an appropriate cluster.
3) Move the notebook to the develop folder and run it to ensure you are happy this one is ready to be promoted.
4) OPTIONAL In a BAU (business as usual) environment we would have a separate production and test cluster running! If you want, you can create those clusters one by one, but remember we can only have one running at any time in the Community Edition. 
5) Clone the selected notebook to test - and annotate a MARKDOWN cell at the top of the notebook to confirm the test or UAT criteria you would propose for this notebook. Consider total run time, cluster attached, max cell run time, experiment accuracy etc. 
6)  Review the tests you have devised with a colleague in the classroom - if the tests are passed, then you are ready to promote. In real life this could involve a handover to another team or completion of a [deployment release procedure](https://www.lucidchart.com/blog/release-management-process)
7)  Finally, clone the notebook to the production folder. Send me sian.davies@ironhack.com an email confirming your notebook is live with a screenshot of your folders and the 'live' notebook, to complete the lab: 

<img width="270" alt="image" src="https://user-images.githubusercontent.com/71644535/155672848-f1016cb8-f814-4d94-a2f1-f796e2a1d570.png">




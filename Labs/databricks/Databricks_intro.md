

# Lab | DataBricks - intro 

In this first lab, after setting yourself up to use the DataBricks community edition you will complete some activities to get comfortable with the interface and make some notes on pre prepared notebooks that have been shared with you for import.

You will find documentation about databricks in this lab folder 



## steps 


1) sign up for the [community edition](https://databricks.com/try-databricks)
If you find yourself putting in billing information then you are NOT in the community edition 
https://databricks.com/product/faq/community-edition 

There are limitations to the community edition, including no production grade facilities. 

2) complete the quickstart tutorial https://databricks.com/notebooks/gcp-qs-notebook.html
+ create a cluster called 'Quickstart'
+ link the notebook to the cluster and run 
+ create the table diamonds, manipulate the data and visualise a summary (SQL query)
+ create a pandas dataframe with Python for diamonds (magic command needed) and visualise, following the notebook through and reviewing both the tables and data visuals 
+ try exporting the resulting data from either SQL or Python to csv files locally 

3) from the home menu, import a new data source (csv file 'cars_EV.csv' in our class materials for this week on github) from your local machine to **create a table with UI** and use your QuickStart cluster to preview the table. In specify table attributes, check the columns, and correct the data types as needed, set the first row as header. Then create the table.

4)  Create a new SQL notebook to run a simple sql select query against the data source cars_EV.csv you have imported. This can be any SQL query you like. 

5) from Workspace, import a pre prepared notebook from this url https://databricks.com/notebooks/gallery/PandasToKoalasTutorial.html and follow the notebook steps, running each cell in turn or all cells. Each time you run or review the output of a cell in this notebook, you can pause to annotate on how the koalas code differs from the pandas commands you have seen before, or alternatively annotate any comments to reflect what is similar. 

HINT : https://databricks.com/blog/2019/04/24/koalas-easy-transition-from-pandas-to-apache-spark.html






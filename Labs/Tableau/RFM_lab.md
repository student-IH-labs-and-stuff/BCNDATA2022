## RFM lab 

#### OBJECTIVE 
+ using the [e commerce data set](https://www.kaggle.com/carrie1/ecommerce-data) from Kaggle, you will develop a dashboard which displays the results of a RFM (recency frequency monetary value) analysis 

#### OVERVIEW 
follow the steps and concepts you have learnt in class to: 
+ tag each customer with the number of weeks since their most recent purchase 
+ tag each customer with their lifetime value (the amount they have spent with the retailer overall)
+ tag each customer with the number of purchases from the retailer the customer has made overall
+ using percentiles, tag each customer with a tier 1-4 for R,F,M 
+ assign to each customer their RFM value eg 112 
+ define specific customer behaviour segments 
+ create some simple views which summarise the number of customers per each behaviour segment, or allow a deep dive into customer stats by RFM tiers and segments
+ combine your views in an interactive dashboard, in a visually pleasing way. The idea is to allow the product team to better understand the behaviour of their customers


#### Each step below has a description of what to do, but ask if 

### Steps 
----
1. download the csv from kaggle following the link provided 
2. explore and familiarise yourself with the data at your own pace - identify the columns you will need to keep and any you can drop or hide
3. This data contains returns as well as purchases. To eliminate those, add data source filters on the data source connection page :  Unit Price>0 , Quantity>0 
4. Check the data for nulls ... if you find a column containing lots of nulls you can filter those away or choose to accept some gaps in the data. 
5. Recency: 
- first, use a FIXED Lod to create a calculated field which is the maximum date of the datasource (hint this will be the same for all records),  
- second, use another FIXED Lod to tag each customer id with their latest invoice date , 
- third, create a DATEDIFF calculation inside an LOD to tag each customer with the number of weeks since their last purchase, using the max date of the data set as the benchmark and the date part 'week' 
7. Frequency: use a FIXED LoD to tag each customer with how many purchases they have made. Suggestion: use count of distinct invoice id
8. Monetary Value: 
- create a calculated field which multiples quantity by price to give a value
- in another calculated field, use a FIXED LoD to tag each customer with their worth based on a that value field.
9. create an additional calculated field- the count of customer ids (hint: distinct)- this will be useful for any views you build
10. within a calculated field, using percentiles (0.25, 0.5, 0.75, 1) and and IF ELSEIF statement, divide the customers into R, F and M tiers 1-4 or 4-1, as appropriate. You should end up with 3 new dimension (blue) columns per customer - test these out in a view with a subset of customer ids 
11. within a calculated field combine the three tiers into one string ie '221' and test in the view you created in the previous step
12. finally, create a last calculated field which, with IF-ELSEIF-ELSE logic and the RFM tier, combinations, prescribes a number of interesting customer segments. You can conduct research on commonly used RFM definitions or develop your own. 
13.  you are ready to start building your views! Think about what you would want to show the market insight team and what is simple to understand. You can turn to [this dashboard](https://public.tableau.com/profile/sianedavies#!/vizhome/RFManalysis_16184195515190/RFMDashboard-ECommerceRetailDS) for inspiration but any view that uses your new segments or the tiers you have created to explore patterns in the customer behaviour are valid! 

---- 

When you are ready, save your workbook and dashboard, **with the separate views showing as tabs** to Tableau public and submit your lab via the student portal (tableau public url)




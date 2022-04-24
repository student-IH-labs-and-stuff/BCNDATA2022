## RFM lab 

#### OBJECTIVE 
+ using the [e commerce data set](https://www.kaggle.com/carrie1/ecommerce-data) from Kaggle, you will develop a dashboard which displays the results from a RFM (recency frequency monetary value) analysis of their customers

#### OVERVIEW 
follow the steps and concepts you have learnt in class to: 
+ tag each customer with the number of weeks since their most recent purchase (# weeks difference between this date and the last date in the data)
+ tag each customer with their lifetime value (the amount they have spent with the retailer overall)
+ tag each customer with the number of purchases the customer has made overall
+ using percentiles, tag each customer with a tier 1-4 for individually R,F and M 
+ assign to each customer their combined RFM value eg '114' (very recent purchase, have spent a lot, only 1 or 2 purchases)
+ define specific customer behaviour segments from these RFM values, such as 'big spenders', 'loyal customers', 'hibernating', 'new customers'. You can look at the coloured tree map in this link for more [ideas on segments](https://clevertap.com/blog/rfm-analysis/)
+ create some simple views which either summarise the number of customers per each RFM segment, or deep dive into customer stats for particular RFM tiers and segments 
+ combine your views in an interactive dashboard, in a visually pleasing way. Think about how the views link together through filters and actions. The idea is to allow the product team to better understand the behaviour of their customers by exploring their data. 


#### Each calculation and step below has a brief description of what to do, but ask the teaching team if you need hints and help 

### Steps 
----
1. download the csv from kaggle following the link provided 
2. explore and familiarise yourself with the data at your own pace - identify the columns you will need to keep and any you can drop or hide
3. Review the data 
4. Note: This data contains returns as well as purchases. To eliminate those, add data source filters on the data source connection page : eg Unit Price>0 , Quantity>0 
5. Check the data for other null values ... if you find a column containing lots of nulls you can either filter those away or choose to accept some gaps in the data and take that into account when you create your calculations. 
6. Recency: 
- first, use a FIXED Lod to create a calculated field which is the max date of the datasource (hint this must be the same for all rows),  
- second, use another FIXED Lod to tag each customer id with their latest invoice date. 
- third, create a DATEDIFF calculation inside an LOD to tag each customer with the number of weeks since their last purchase, using the max date of the datasource as the benchmark and the date part 'week'. You could also do the same for 'days'. 
7. Frequency: use a FIXED LoD to tag each customer with the total of how many purchases they have made. Hint: count distinct (COUNTD())                  - It is recommended to check the data for each Lod calculation in a table. Try reviewing customers by date - in this case you should see the same number of purchases next to the every instance of the same customer. 
9. Monetary Value: 
- create a calculated field which multiplies quantity by price to give a total value spent for each transaction. This should not be pre aggregated. 
- in another calculated field, use a FIXED LoD to tag each customer with their "monetary value" based on a that field. This is like a lifetime value. 
10. Number of Customers:
- create an additional calculated field- the distinct count of customer ids -  this will be useful as the measure in the views you will build.
11. within a calculated field, using percentiles (0.25, 0.5, 0.75, 1) and an IF ELSEIF statement, divide the customers into R, F and M tiers. Take note, R percentiles should be calculated in the opposite direction to F,M values  because with recency the more recently a customer purchased, the better rating they should get. Normally R1 is assigned to a customer who bought something in the last week, so the count of weeks could be 0 or 1. Whereas 1 is assigned to customers with a high frequency of purchases or high total spend.
12.  You should end up with 3 new RFM dimension (blue) columns per customer, in a range of 1 to 4. It is suggested to test these out in a view with a small filtered subset of customer ids. 
13. Within a calculated or combined field combine the three tiers into one string ie '2,2,1' and test these. This is the customers RFM tier. 
14. finally, create a last calculated field which, with IF-ELSEIF-ELSE logic and the RFM tier assigns each customer to a customer segment. 
15. You are ready to start building your views! Think about what you would want to show the market insight team and what is simple to understand. IN assembling your final interactive dashboard, you can look at [this dashboard](https://public.tableau.com/profile/sianedavies#!/vizhome/RFManalysis_16184195515190/RFMDashboard-ECommerceRetailDS) by Sian for inspiration or this [student dashboard](https://public.tableau.com/app/profile/marcsoler/viz/RFMAnalysis_16436479133870/RFManalysis) - but any views that use your new segments or the tiers you have created to explore patterns in the customer behaviour are valid! 

---- 

When you are ready, save your workbook and dashboard, **with the separate views showing as tabs** to Tableau public and submit your lab via the student portal (tableau public url)




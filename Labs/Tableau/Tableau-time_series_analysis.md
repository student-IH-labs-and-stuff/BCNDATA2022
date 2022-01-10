
# Lab | Tableau -Time Series Analysis

Build the following charts making use of the date parts/values in tableau and publish them to your tableau public account in order to submit the url via the Student Portal

## Your Challenge

Using the data set [marketing_customer_analysis.csv](marketing_customer_analysis.csv) from your customer analysis labs and Tableau Desktop or Tableau Public, create the following charts to visualise:

(Ensure each chart has the appropriate fit, mark type, title, axis labels and colour scheme.)

This lab is about dates. the data set contains only one date field - effective to date - which you should use in all cases- as a stand in for date of .... 

1. Looking at weekdays only (filter out saturdays and sundays) build a stacked bar chart which shows the proportion of claim amount on each weekday per vehicle class. Is there a big difference in the amount claimed(versus the number of claims, could be interesting!) between vehicle classes on a Monday, for example? use a stacked vertical bar chart, weekday should be on colour. 
3. Over time is there a general trend downwards (using effective to date) on the average lifetime value of customers who respond either yes or no to the insurance offer? Using a line chart, split by no and yes response, make sure your date axis is the full / exact date. Ie you should have data points showing for 1 jan 2011 and 28 feb 2011, and all dates in between. It would be nice if you could add a dotted trend line for the yes ano no responses, separately. 
4. Lets have a comparative view over time (effective to date) trend with the number of open complaints on one axis and on the opposite axis, the number of policies. Overlay the lines as a dual axis and use complementary colours so the points where the lines cross is easy to see. 
5. Does the correlation between average months since last claim and average monthly premium seem fair, when gender, employment status and education are taken into account? Are there some customer demographics who seem to be losing out - ie they havent claimed for a long time but the premium is high? What reasons could be behind this?  Recommend to use a scatter plot with average months since last claim and average monthly premium, to investigate. Try bringing total claim amount in on size - does this answer any concerns? 
6. Create a highlight table or any other chart type to quickly see the pattern between weeks and days of the week in terms of number of open complaints. Both dates come from effective to date. Can we infer anything from this visualisation?
7. BONUS: Have a go at creating sparklines showing the comparative total premiums earned by each sales channel, by day. Sparklines require minimal background noise, and can be used for side by side comparison of time series trend even when the scales vary by giving each trend an independent axis. [Here's a tutorial on sparklines](https://evolytics.com/blog/tableau-201-how-to-make-sparklines/) In my example I am using sales channel on colour and have added a min max value label using the marks card. 
![sians sparklines](https://github.com/student-IH-labs-and-stuff/BEES-DAFT-MAY21/blob/main/Labs/sparkline.png)

----- proprietary content of SED Training Ltd-------

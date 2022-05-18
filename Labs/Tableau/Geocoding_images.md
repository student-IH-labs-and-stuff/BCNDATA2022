

# Lab | Tableau - Geocoding images

We learnt how to combine images with geocoding tools in class and place data over that image, varying the size, shape of the data mark accordingly. 

## Challenge 

This Lab asks you to utilise a london underground (metro) map image, combining the image with [relevant data](https://github.com/student-IH-labs-and-stuff/BCNDATA2022/blob/main/Labs/Tableau/multi-year-station-entry-and-exit-figures.xls), via a [drawing utility](https://tableaudraw.com/), so that the london underground (metro) station locations on the image can be used to display passenger numbers


1) explore the [data](https://github.com/student-IH-labs-and-stuff/BCNDATA2022/blob/main/Labs/Tableau/multi-year-station-entry-and-exit-figures.xls) and decide on your data question. 

Your structured, tabular data source is in this github folder and is named: 
+ multi-year-station-entry-and-exit-figures.xls

Are you going to plot a handful of stations in one part of town, some high profile stations, or a particular line? 
what year of data will you use? 
Are you interested in the difference in passengers over time or simply the latest data? 
Exits or Entries or both ? 
HINT: You might need to use Tableau or Python to be clean and select the data you will use. 


2) find and download your preferred background image 
you can search online for an image to use of the london underground - there is one iconic underground image, but others are also available. Pick a suitable sized image. Take note of the pixel size of the image (width and height) to use as grid references for your geocoding pins.

3) use the drawing utility to plot the points of your chosen stations on the map which will go with the tabular data you have selected. HINT: remember the order you plotted them in, this will help you later - or take the time to edit the shape labels as you go using the editing facility on the right side of the drawing utility. eg, if you were creating a point on the image for baker street station, on the (brown) bakerloo line, give that plot point the label Baker Street or 511, to allow you to join the point to your station data later

4) export and copy the image plot data over to tableau (copy paste into tableau or export as csv/json)  

5) connect the background image to your polygon/point data source using the Map > Background Images menu, as we saw in class and set the x, y min and max to match the dimensions (width, height) of the image you chose. Also, using the Options in that menu, always show the full image. 

6) connect the same tableau workbook to your selected london underground station entry and exit data. You can join the two data sources using the label+station name/Id

7) plot x and y on the rows and columns, shapeid and shape label on the detail/label respectively, in the marks card, before adding suitable data from the station entry and exit data 

8) apply visual best practices carefully, in order to make the most of this technique and ensure that the data points stand out and the tooltips are carefully edited.


----- proprietary content of SED Training Ltd-------

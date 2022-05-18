
## Facebook Movement Data - Storytelling with Data 

### Method

Work collaboratively in groups of 2-3

### Time

You have until tomorrow to get the data, analyse it, and develop a story around the data which can be presented back to the classroom

### Tools 

Tableau (with extra support from Python as needed)

### Introduction

There must have been times during the past 24 months that you have felt like you were living in a dystopian novel or had accidentally auditioned for a surrealist play, where faceless government agencies and an giant spiky virus were making decisions about your personal/ professional life and your freedom of movement. 

It would be silly for us to complete a data analysis course without giving some attention to covid-19, but we will approach it as analysts - start with raw data, then add in our emotions and personal experience to shape it into a data story. You will be working with a database that facebook has gathered and shared for public non-commercial use - HINT : when you can, give some thought to the reliability and quality of the data source, and what portion of the population is going to be  excluded from this data / ie whats the bias..... 

### Objectives and Deliverable

- Collaborate and support each-other, sharing your ideas, brainstorm what is the tale you want to tell and make the most of each of your respective skills to produce a **data story** centred around changes observed in human movement under covid-19 restrictions in specific country(/ies) or Region(s). Ideally the story should have a time element (ie changes in movement over a timeline) and some comparisons - compare cities or countries' experience on respective dates, local and national.
-  Your presentation must take your audience on a journey through the arc of your data story - hint: think about who your story would be targeted at, in order to pitch the visuals, language, descriptions, and technical details appropriately. This [link](https://blog.reedsy.com/narrative-arc) is a good one to get you thinking as a storyteller about narrative structures, the story arc and the various elements of a plot eg inciting incident. 


<p align="center">
    <img width="460" height="300" src="https://github.com/student-IH-labs-and-stuff/BER-DAFT-MAR21/blob/main/Project/Storytelling/arc.jpeg">
</p>
  

-  Your data source(s) can be processed /cleaned, explored in Python or Tableau, but the end output we want to see is simply the Tableau dashboard or story. A very small presentation is required (dont worry about putting together beautiful slides, you can just use the Tableau materials as your visuals) in class to talk through the story - tip: pick the best storyteller in your group to do this, or pair up to do a 'double act'
-  All students will submit a url to their github repo containing a description of the project and url to their team's tableau workbook on tableau public, OR simply the link to tableau public, on the student portal, before the deadline
-  In class you will get feedback from your peers and the teaching team on how much the story interested them, entertained or surprised them, and how well it was researched/ structured as a story

### Resources 

![alt text](https://github.com/student-IH-labs-and-stuff/BER-DAFT-MAR21/blob/main/Project/Storytelling/facebook.jpeg "facebook movement data")

RAW DATA : We are giving you one primary (open/public) data source to work with - other elements of your story can be drawn from 'data' sources you find online or simply taken from your own research - ie key dates and changes in public policy, issues you are familiar with, opinion pieces you find, news articles etc.

+ [movement-range-data](https://data.humdata.org/dataset/movement-range-maps)

This data source is kept up to date, contains data on many (but not all countries) and some guidance on how to use it. It doesnt tell you to apply a filter when working with the data, but we would recommend it, so that Tableau runs faster - either use Python to filter the data source to only the country/countries or region/s you are covering in your story, or apply a data source filter [in the data source screen](https://help.tableau.com/current/pro/desktop/en-us/filtering_datasource.htm)

You will also find some examples online of other data storytellers, data journalists and analysts making use of this data source, for inspiration. 
For example - this one from california : 

![alt text](https://github.com/student-IH-labs-and-stuff/BER-DAFT-MAR21/blob/main/Project/Storytelling/MovementRange_ca.jpeg "california example")

and [this one from Tbilisi](https://oc-media.org/features/analysis-georgia-struggles-to-respond-to-latest-covid-19-surge/)

POLYGON DATA :  If you want to integrate spatial file polygons with your data (particularly if the data covers regional boundaries not covered by the existing geographical hierachy of tableau we would suggest checking the polygon_source of your selected data - most of the time it is GADM - and then downloading the files you need (at the level you need) from this [GADM site](https://gadm.org/data.html)

### Guidance / Tips 

- Start with drafting a storyboard on a whiteboard or paper - think about zooming in on the major story and identifying an interesting/ surprising focus point. Avoid the ones that we know well from the news. This is a bit like when a film has the major plot (eg. covid pandemic) and you also get a few side character plots (eg. whats happening in switzerland, or the region around Prague, during this time?)  
- introduction-visual-insight-conclusion - can be a good simple structure
- Dont try to do too much - think about comparing 2 or 3 places, spotting patterns and variation, rather than looking at lots of countries and regions, looking for multi-vector trends
- Use what you know - if you already have an opinion about a trend in a particular city or country, see if the data we have given you backs this up, that could give you a head start!

**Important! this is not a formal / polished presentation like the mid bootcamp project- you can nominate one person in your team to click through and deliver your group's story to the classroom. Feel free to make it funny, entertaining, bring in memes, images, sound effects, or be controversial - you can entertain and shock us- but it must be informative and structured as a data story. 

## Here are some final project briefs for anyone who doesnt have a firm project in mind - feel free to adopt one of these or adapt it to your own preferences 

each project brief contains a suggested direction, data sources, and would be achievable in the time allowed for the FBP 

--------------------
+ Our class slack workspace- json wrangling,  to discover insights, links posted from the start of the course - it is possible to download the full json code from the beginning of the course - could you build a reusable python tool which would allow any ironhack class to pull the useful (and gdpr compliant) information from their slack workspace data - and pitch it to the ironhack bosses ? for example shared web resources, the most active channels, topics, threads and emojis
+ Data source : request from Sian/TAs

-------------------

+ air pollution levels in cities- comparative analysis paris/ london  - trends and identifying specific places or times of year/day to avoid - can city dwellers make simple lifestyle changes to lower their levels of exposure to harmful air pollutants?
+ Data sources : https://www.globalcleanair.org/data-to-action/london-uk/breathe-london-data/ :   https://www.sciencedirect.com/science/article/pii/S026974911832168
      https://www.eea.europa.eu/themes/air/explore-air-pollution-data 
      https://www.eea.europa.eu/themes/air/air-emissions-data
      
 ------------------     

+ hospital admissions and health interventions by care professionals /doctors / government  - do specific care client interventions for the elderly contribute (in x country) to lower levels of emergency admissions in the same group / overall ? (focus on non covid-19 times) Do government anti smoking campaigns /safe sex campaigns / exercise campaigns have a substantial (statistically significant) effect on the levels of x after 6, 12, 18 months?  I have found some good data sources for UK but I am sure equivalent data can be found for other countries 
+ Data sources : https://www.statista.com/statistics/504012/number-of-nhs-hospital-admissions-england-uk/#:~:text=Between%20July%20and%20September%202019,the%20highest%20number%20of%20admissions    https://digital.nhs.uk/data-and-information/publications/statistical/hospital-admitted-patient-care-activity/2018-19


-----------------

+ beer project - a bit of fun- why not? inspired by a slack conversation mid week on nigerian consumption of guinness - something like 'are certain beers consumed more outside of their native country than at home and what are the conditions that make that happen?' example visualisation for inspiration: https://public.tableau.com/en-us/gallery/beer-europe?tab=featured 
+ Data sources https://www.statista.com/topics/4674/guinness-beer/ https://www.worldstopexports.com/beer-exports-by-country/ https://worldpopulationreview.com/country-rankings/beer-consumption-by-country https://ourworldindata.org/grapher/beer-consumption-per-person
+ https://data.london.gov.uk/dataset/cultural-infrastructure-map

---------------

+ cycling and covid - theres a lot of data available on cycling and the news has been full of the uptake in cycling during covid. Could you scrape data from different sources and see if statistically the data does back these claims up? eg https://www.bbc.com/future/bespoke/made-on-earth/the-great-bicycle-boom-of-2020.html
+ Data sources https://data.world/makeovermonday/2021w1 https://www.bicycle-guider.com/bike-facts-stats/ 
+ what about combining this with the facebook movement data and looking to identify time series and geographical links with bike sales in particular regions ?
+ some countries were already very bike heavy - vietnam, china, the netherlands - can we use those countries to compare to the other countries who have only lately joined the cycling boom?


----------

+ how many people have access to culture ? is there an imbalance in where cultural venues are located and the communities / wealth of surrounding neighbourhoods? are cultural venues easily accessible to people newly arrived to big cities and who do not yet speak the local language? 
+ project will involve scraping, map work, visual analysis, statistical inference, joining data sets together- my data examples are from london but could be extended 
+ Data source example https://data.london.gov.uk/dataset/cultural-infrastructure-map https://data.london.gov.uk/dataset/focus-on-london-population-and-migration

----------

+ **Web scraping project** - internal stakeholder (Ironhack: Pedro Resch) - ask Sian for contact information 
+ **Objective**: I would like to understand what web development technologies employers are currently demanding the most in our target market (Brazil as a whole, and specifically São Paulo state). We would like to analyse the job descriptions of 10k open positions from different sources (Linkedin, recruiting webpages, companies websites, etc). I would like to know what are the most demanded technologies within these 10k positions. Technologies identified may include programming language, operating systems, databases, frameworks, etc. 
+ Currently this is hard for this stakeholder because he only has rudimentary Python skills and no free time to learn. Some of the websites may be behind paywalls, scraping the useful data could also require scraping multiple pages and exploring the html of each site. 
+ **data sources** - websites as indicated above, you may also discover scraped data by other users or useful databases from other sources- just ensure they are recent. 
+ **MVP** : a big table with all the data is good enough for us. We just need to be able to understand our market landscape and if the technologies we teach at Ironhack right now are actually being demanded in our target market. No need for this to be reusable, but that is a very nice plus. Maybe the script used to scrape can be used over and over again so we can check this quarterly? 
+ To summarize, gather the amount of open positions of each specific technology, divided by category (frontend language, backend language, database, framework, operating system, cloud provider), and sorted by quantity of open positions, scraped from recruiting websites and apps, considering our target market (são paulo, brazil). 
+ (summary and analysis / visualisation would be a bonus !) 

----------

+ **data analysis and visualisation project** - internal stakeholder for external project (Ironhack: Dina Gorkmazova - ask Sian for contact information
+ **Objective** : As a Seller on one of the e-commerce platforms ( similar to Amazon), I can generate reports on sales per item, and supply reports, but there is no analytics available - for example trends in sales (per item/per week, etc), how adequate has the restocking been based on sales, what is the projection for upcoming weeks/months... 
+ Currently this is hard for the stakeholder because the data sets are not joined and the information is too granular, rather than an overview 
+ **data sources** - will be provided in excel / csv format, and the files will need to be joined together (python, tableau or mysql)
+ **MVP** : an infographic which summarises the trends and projections
+ (a reusable process to update with new data would be a bonus!)

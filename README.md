# INFO201-CRYM

## General Questions

**Why are you interested in this field/domain?**

We wanted to explore homelessness in Seattle because this is the community that we live in and affects us directly, and homelessness is a fast rising problem in this city because of the rapid gentrification due to the numerous tech companies moving into Seattle. We believe that this is an extremely crucial issue and should be analyzed more in depth because it will only get worse as class division grows.

**What other examples of data driven project have you found related to this domain (share at least 3)?**

- https://www.seattle.gov/innovation-advisory-council/projects/homelessness-data-model
- https://www.seattle.gov/homelessness/creating-more-affordable-housing
- https://www.kingcounty.gov/depts/health/locations/homeless-health/healthcare-for-the-homeless/~/media/depts/health/homeless-health/healthcare-for-the-homeless/documents/2018-HCHN-annual-report.ashx

**What data-driven questions do you hope to answer about this domain (share at least 3)?**

 - What are the primary causes of homelessness in Seattle over the past 10 years?
 - How has the percentage of homeless people grown in Seattle over the past 10 years?
 - What are the demographics of the homeless population in Seattle?

## Questions for Each Database

### _Count Us In Database_

**Where did you download the data (e.g., a web URL)?**

https://data.world/sasha/count-us-in-report-homelessness-data

**How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?**

The data was collected by the Regional Homelessness Authority, a legislation approved by the Seattle City Council that oversees the funding, policy, and services for dealing with the homelessness issue throughout the county. They do a yearly count of the homeless population in King County. The data was generated partly by them, and partly by other organizations like the Puget Sound Regional Council and the Seattle King County Coalition on Homelessness.

**How many observations (rows) are in your data?**

This is a relational database, and it has 13 different tables, all focusing on different topics about homelessness.  
They include:
- total (23 rows, one for each year since 1998)
- shelter (79 rows, one for each year and type of shelter since 1998)
- region (30 rows, one for each region of homelessness since 2017)
- demographics (164 rows, one for each year and type of demographic since 2015)
- duration of homelessness (24 rows, one for each year and length of homelessness since 2017)
- housing willingness (4 rows, one for each year since 2017)
- support needs (10 rows, type of support that would help)
- services used (15 rows, types of services)
- issues accessing service (13 rows, types of issues encountered)
- cause (59 rows, one for each year and type of cause since 2017)
- origin (18 rows, one for each year and county of origin since 2017)
- employment status (8 rows, one for each year and employed or not employed since 2017)
- source (12 rows, sources of where data was collected)


**How many features (columns) are in the data?**

- total (4 columns)
- shelter (5 columns)
- region (5 columns)
- demographics (13 columns)
- duration of homeless (4 columns)
- housing willingness (3 columns)
- support needs (4 columns)
- services used (4 columns)
- issues accessing services (4 columns)
- cause (4 columns)
- origin (4 columns)
- employment status (4 columns)
- source (4 columns)


**What questions (from above) can be answered using the data in this dataset?**

This dataset could help solve a lot of the questions we had, because of how many different tables they have. We could answer questions about the trend of the percentage of homelessness in Seattle, the demographic breakdown of the homeless population, and the causes. There are other questions we could answer, like how long were people homeless for, on average. The only thing that might make it difficult is that not all the columns have data for the same years (some have data from 1998 - 2020, but others only have data from 2017, and some only for one specific year).


### _Our World in Data Database_

**Where did you download the data (e.g., a web URL)?**
https://ourworldindata.org/homelessness

**How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?**
This specific website has a collection of data on homelessness in various
countries displayed on its website. I specifically looked at the data for
the US. According to the website, the US is the Department of Housing and Urban Development, releases the Annual Homeless Assessment Report to
Congress. What they do to present the data is calculate ‘point-in-time’
estimates by counting homeless people in late January of each year.

**How many observations (rows) are in your data?**
There is only one column in the data. But this table is unique because at the
bottom it has a slide for a range of years that changes the data in the
individual columns.

**How many features (columns) are in the data?**
There are a total of 8 columns in the data.

**What questions (from above) can be answered using the data in this dataset?**
- How has homelessness increased throughout a certain range of years
- How has homelessness decreased throughout a certain range of years

**Where did you download the data (e.g., a web URL)?**
https://www.usich.gov/homelessness-statistics/wa

**How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?**
The website shows a visual representation of the United States of America, showing each state with a color coded key corresponding to a range of how many homeless people (approximately) live there. It's easy to visualize the data since it's laid out in a neat and efficient way with easily accessible information.

**How many observations (rows) are in your data?**
There aren't really rows in the data, only numbers as it's purely a visual chart.

**How many features (columns) are in the data?**
There are 11 features, the two main ones being Total Homeless Population and Total Student Homeless population.

**What questions (from above) can be answered using the data in this dataset?**
It answers the question of "How has the percentage of homeless people grown in Seattle over the past 10 years?". You can clearly look at this data and extrapolate a percentage growth/decrease in homeless populations within any given U.S state.

### _Seattle Times_

**Where did you download the data (e.g., a web URL)?**
https://www.seattletimes.com/seattle-news/homeless/new-homeless-count-in-king-county-shows-spike-in-number-of-people-sleeping-outside/

**How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?**
The data was collected due to "Count Us In" (now called Point-in-time Count), which is an annual data collection to assess the needs of the homeless population in Seattle.

**How many observations (rows) are in your data?**
The table has 11 observations of the demographics and identities of the homeless, while the graph has 11 observations being the years of the homeless counts.

**How many features (columns) are in the data?**
There are 2 features in the data table, the demographic and identity, and the graph has 3 features, the year, number of homeless individuals, and their form of shelter (if any).

**What questions (from above) can be answered using the data in this dataset?**
This dataset can answer the questions "How has the percentage of homeless people grown in Seattle over the past 10 years?" and "What are the demographics of the homeless population in Seattle?".

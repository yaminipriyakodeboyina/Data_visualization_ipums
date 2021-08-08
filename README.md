# Data Visualization

## Steps to run the code
1. This project needs R to run the code. open "highered_00001.r" file in the repository
2. set the working directory in R to the folder you downloaded the code. if you don't set the path correctly, code gives error
`setwd("path to the folder")`
4. Install packages tidyverse and plotly.
 `install.packages("plotly")`
 `install.packages("tidyverse")`
3. start from line 6 in highered_00001.r to run the code


## Introduction

#### Data Extraction
1. Data is taken from IPUMS HIGHER ED https://highered.ipums.org/highered/index.shtml
2. Select Data->select sample data (you can select desired sample here) -> submit sample select
3. now select variable which are useful for data analysis

#### Problem Statement
1. In this data we have educational and employment background of people in America in 2013.
2. The problem I am aiming to solve is "Does the higher educations like masters, post doctorate and professional studies helps students to  place them in highly paid jobs.
3. I added few more plots to understand the data I extracted 


## Load data from IPUMS
1. Download "Download.DAT", "R" and "DDI" file in "MY DATA"
2. Download.DAT have the data and R file have few line of code to load data to R DDI has the information about the data in DAT file

## Code Explanation

#### loading packges line 13-14
1. libraries plotly and tidyverse are used in this project.
2. Please ignore the masked warnings, these are due to same method names in both packages.However those methods are not used in this project

#### Plot-1  line 16 to 21
Bar chat gives 2 main details of data
1. Total count of people in that age group (Each bar represents no of people in that age group)
2. count of people in each highest degree attained category(colours represent count of people attained particalr highest degree in each bar)
3. Place the cursor on desired bar to get more details.

#### Plot-2 Line 22-26
Bar chart gives female and male count in each age group
Place the cursor on the chart to get more details

#### Plot-3 Line 27-30
Plot-3 bar chart gives the female and male count of people who atained their highest degree

#### Plot-4 Line 31-46
1.Plot-4 is a pie chart gives the percentage of people in highest degree attained category
2.This plots gives a good idea about how data is distributed amoung highest degrees

#### Plot-5 Line 47-60
1. Average salary of the people in each highest degree attained category.
Here average salary of Professional > Doctorate > Master's > Bachelor's
2. It means people who attained highest degree has more chances to get high paid jobs

#### Plot-6 Line 62-73
1. median of the job satisfaction of the working people in each highest degree attained category
2. Most of the professionals are Very satisfied
3. other categories have median as Somewhat satisfied

#### Plot-7 Line 75-86
1. line graph for Average salary of people in different field of major in highest degree
2. People who did engineering has highest average salary 91040 dollars. So engineering is a place where students are more likely to get highly paid jobs.

#### Conclusion
From the above graphs especially plot 5 says that
1.Higher education helps students to place them in highly paid jobs.




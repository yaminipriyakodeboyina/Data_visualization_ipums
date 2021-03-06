# NOTE: To load data, you must download both the extract's data and the DDI
# and also set the working directory to the folder with these files (or change the path below).


#load data
if (!require("ipumsr")) stop("Reading IPUMS data into R requires the ipumsr package. It can be installed using the following command: install.packages('ipumsr')")

ddi <- read_ipums_ddi("highered_00001.xml")
data <- read_ipums_micro(ddi)
View(data)
names(data)

library(tidyverse)
library(plotly)

#Plot-1  bar chart gives total count people in the age group
age_grp <- cut(data$AGE, breaks = seq(20, 80, 5), include.lowest = TRUE)
data$DGRDG <- haven::as_factor(data$DGRDG)
age_plot<-ggplot(data, aes(x = age_grp,fill = DGRDG),label=DGRDG)+ geom_bar( )+ labs(fill = "Highest Degree")
ggplotly(age_plot)

#Plot-2 bar chart for total male and female in each age group
data$GENDER <- haven::as_factor(data$GENDER)
k<-ggplot(data, aes(x = age_grp,fill=GENDER),label=GENDER)+ geom_bar(position = "dodge")
ggplotly(k)

# Plot-3 bar chart for total male and female count in each Highest degree attained
gender_degree_plot<-ggplot(data, aes(x = DGRDG,fill=GENDER))+ geom_bar(position = "dodge")+xlab("Highest Degree")
ggplotly(gender_degree_plot)

#Plot-4 pie chart gives percentage of people come under in each highest degree they attained
data_pie <- data %>% 
  group_by(DGRDG) %>% 
  count() %>% 
  ungroup() %>% 
  mutate(per=`n`/sum(`n`)) %>% 
  arrange(desc(DGRDG))
data_pie$DGRDG1 <- scales::percent(data_pie$per)
data_pie$DGRDG <- haven::as_factor(data_pie$DGRDG)

fig <- plot_ly(type='pie', labels=data_pie$DGRDG, values=data_pie$per, 
               textinfo='label+percent',
               insidetextorientation='radial',title="percentage of highest degree attained")
fig


#Plot-5 (line chart)avg salary for people grouped with same highest degree 
data$SALARY<-na_if(data$SALARY,9999999)
data$SALARY<-na_if(data$SALARY,9999998)
data$SALARY<-na_if(data$SALARY,0)
data_line <- data %>% 
  group_by(DGRDG) %>% 
  summarise(mean_salary=mean(SALARY,na.rm = T),median_salary=median(SALARY,na.rm = T)) %>%
  ungroup()

line_salary_plot<-ggplot(data=data_line, aes(x=DGRDG, y=mean_salary, group=1)) +
  geom_line()+
  geom_point()+xlab("Highest Degree")
ggplotly(line_salary_plot)


#Plot-6 (line chart)median of job satisfaction rating for people grouped  with same highest degree 
data$JOBSATIS<-na_if(data$JOBSATIS,98)
data_line_jobsat <- data %>% 
  group_by(DGRDG) %>% 
  summarise(median_job_satisfaction=median(JOBSATIS,na.rm = T)) %>%
  ungroup()
yLabs <- c("Very satisfied", "Somewhat satisfied", "Somewhat dissatisfied", "Very dissatisfied", "Logical Skip")
line_job_plot<-ggplot(data=data_line_jobsat, aes(x=DGRDG, y=median_job_satisfaction, group=1)) +
  geom_line()+
  geom_point()+xlab("Highest Degree")+scale_y_continuous(breaks = c(1,2,3,4,5), labels=yLabs)
ggplotly(line_job_plot)


#Plot-7 (line chart)avg salary for people grouped  with same Field of major for highest degree 
data$NDGMEMG <- haven::as_factor(data$NDGMEMG)
data_line_Field <- data %>% 
  group_by(NDGMEMG) %>% 
  summarise(mean_salary=mean(SALARY,na.rm = T),median_salary=median(SALARY,na.rm = T)) %>%
  ungroup()

data_field_plot<-ggplot(data=data_line_Field, aes(x=NDGMEMG, y=mean_salary, group=1)) +
  geom_line()+
  geom_point()+xlab("Field of major for Highest Degree")
ggplotly(data_field_plot)




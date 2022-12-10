library(tidyverse)
library(dplyr)
library(plotly)
library(ggplot2)
library(shiny)


dataset <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
dataset <- na.omit(dataset)
#values for intro

#Where is my variable the highest?
max_co2_result <- dataset %>%
  filter(country == "World")%>%
  filter(co2 == max(co2))%>%
  select(year, co2)
#In 2018, the world co2 production was at a maximum of 36826.51


#Where is my variable the lowest?
min_co2_result <- dataset %>%
  filter(country == "World")%>%
  filter(co2 == min(co2))%>%
  select(year, co2)
#In 1990, the world co2 production was at  minimum of 22757.48


#What is the range of my variable?
range_co2 <- max_co2_result$co2 - min_co2_result$co2
#The range is 14069.028


server <- function(input, output){
  
  # Get World data by year
  world_emissions <- dataset %>% 
    filter(country == "World")%>%
    select(country, year, co2)
  
  updated_world_emissions <- world_emissions
  
  reactive({
    if (input$year != "All") {
      updated_world_emissions = world_emissions %>% filter(co2, year == inp_year)
    }
  })
  
  # Bar chart
  output$world_emissions_bar <- renderPlotly({ggplot(data = updated_world_emissions, aes(x = year, y = co2)) +
    geom_bar(stat = "identity", fill = "lightblue", width = 0.5)+
    theme(aspect.ratio = 2/1) +
    scale_y_continuous(breaks = c(0, 5000, 10000, 15000, 20000, 25000, 30000, 35000))+
    scale_x_continuous(breaks = c(1990, 2000, 2010, 2016, 2017, 2018))+
    labs(y = "Year", x = "Carbon Dioxide Emissions in KT", title = "World CO2 Emissions in Major Years")+  
    theme_minimal()})
    
}
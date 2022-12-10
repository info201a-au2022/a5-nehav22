library(shiny)
library(shinythemes)
library(ggplot2)
library(plotly)



ui <- shinyUI(fluidPage(theme = shinytheme("superhero"),
navbarPage("Introduction", 
           tabPanel("Introduction",
              sidebarLayout(
                  sidebarPanel( 
                    h1("Carbon Dioxide Emissions & Climate Change"),
                    p("Carbon dioxide emissions have risen exponentially in the past century. 
                      Human emissions of carbon dioxide and other greenhouse gases are the primary
                      contributor to global warming. As carbon dioxide emissions continue to rise
                      as a result of human activity, it is important to contextualize and understand
                      the repercussions of emissions and what that means for the future of climate change.
                      Questions we will be exploring include the following."),
                    h2("Questions"),
                    p("How much have CO2 emissions across the world increased between 1990 and 2018?"),
                    p("How do world CO2 emissions compare by major year?"),
                    p("What trends can be seen in CO2 emissions related to years?"),
                    h3("Values"),
                    p("The world CO2 emissions were highest in 2018 with a value of 36826.51 KT"),
                    p("The world CO2 emissions were lowest in 1990 with a value of 22757.48 KT"),
                    p("The difference between the world CO2 emissions in 1990 and 2018 was 14069.028 KT"),
                  ),
                  mainPanel(
                   img(src = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fnay.communitychoices.scot%2Flegislation%2Fprocesses%2F6%2Fdebate&psig=AOvVaw0JLIhRvBg7lu95-dzaWDrw&ust=1670727205061000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCLCw3_6F7vsCFQAAAAAdAAAAABAE")
                  )
                    
              )       
           ),
           tabPanel("Analysis",
                    sidebarLayout(
                      sidebarPanel(
                        selectInput("year", "Year", c("All",
                                                      "1990",
                                                      "2000",
                                                      "2010",
                                                      "2016",
                                                      "2017",
                                                      "2018")),
                        
                        sliderInput("co2", "Range of CO2 Emissions",
                                    min = 0, max = 35000,
                                    value = c(0, 35000))
                        ),
                      
                      mainPanel(
                        plotlyOutput("world_emissions_bar"),
                        p("Caption: This is a bar chart that displays the world CO2 emissions 
                          for each major year (1990, 2000, 2010, 2016, 2017, and 2018). It reveals trends
                          in CO2 emissions across the entire world in 5 major years, allowing users to
                          visually see how emissions have increased overall over time.")
                      ),
                      
                      
                        
                      )
                    )
           ),
         
      )   
    )

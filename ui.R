#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(reshape)
library(ggplot2)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("US Personal Expenditure Data 1940 - 1960"),
  
  # Sidebar with a select input for Expense Type
 
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        selectInput("ExpenseType",
                    "Expense Type", 
                    c("Food and Tobacco","Household Operation","Medical and Health","Personal Care","Private Education")
        ),
        
        selectInput("predYear",
                    "Year to Predict For", 
                    c("1965","1970","1975","1980","1985","1990","1995","2000","2005","2010","2015","2020","2025","2030")
        )
        

    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       h3("Predicted value for selected year:"),
       textOutput("pred1")
    )
  )
))

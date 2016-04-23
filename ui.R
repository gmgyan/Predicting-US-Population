# Author: Gyan GM
# Date: 2016-04-24
#
# User Interface File for US Population Predictor.

library(shiny)

shinyUI(fluidPage(    
    titlePanel("US Population Predictor"),
    fluidRow(includeMarkdown("Intro.Rmd")),
    tabsetPanel(
      tabPanel ("Historical Population",
                tableOutput('table')
      ),
        tabPanel("Predicted Population",
                 sidebarLayout(
                     sidebarPanel(width = 5,
                                  sliderInput('yr', 
                                              label="Select a YEAR in the slider menu below: ",
                                              value = 2020, 
                                              min = 2014, 
                                              max = 2040, 
                                              step = 1,
                                              format='####',
                                              width='350px'
                                  
                     )),
                     
                   
                     mainPanel(# put time series plots here
                       p("in order to see the predicted population for that year below,
                          using data points from the last 34 years (1980 - 2013) and 
                          a simple linear regression method:"),
                       
                       plotOutput('popTrends')
                     )
                 )),
        
        tabPanel("Read Me",
                 # documentation goes here
                 includeMarkdown("ReadMe.Rmd")
                 
        ) 
    )
))


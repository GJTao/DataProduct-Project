#ui.R

library(shiny)

shinyUI(fluidPage(
        titlePanel("Agricultural Pesticide Use in California (2004 - 2014)"),
        
        hr(),
        
        fluidRow(
                column(7,
                       
                       p("This application 
                         is to explore pesticide use and state rank of California 
                         counties in 2004 - 2014. The data is from the California 
                         Department of Pesticide Regulation's", 
                         a("annual summary", 
                           href='http://www.cdpr.ca.gov/docs/pur/purmain.htm'),
                         " of the Pesticide Use Report (PUR)."),
                       
                       p("In 1990, California became the first state to require 
                         full reporting of agricultural pesticide use. PUR is recognized 
                         as the most comprehensive pesticide use data in the world. "),
                       
                       p("California has a broad legal definition of 
                         \"agricultural use\" so the reporting requirements include 
                         pesticide applications to parks, golf courses, 
                         cemeteries, rangeland, pastures, and along roadside 
                         and railroad rights-of-way. In addition, all 
                         postharvest pesticide treatments of agricultural 
                         commodities must be reported along with all pesticide 
                         treatments in poultry and fish production as well as 
                         some livestock applications. The primary exceptions to 
                         the reporting requirements are home-and-garden use and 
                         most industrial and institutional uses.")
                       ),
                
                column(4, 
                       h4("SELECT COUNTY AND YEAR:"),
                       br(),
                       
                       selectInput("county", 
                                   label = "County",
                                   choices = c("Alameda",
                                               "Alpine",
                                               "Amador",
                                               "Butte",
                                               "Calaveras",
                                               "Colusa",
                                               "Contra Costa",
                                               "Del Norte",
                                               "El Dorado",
                                               "Fresno",
                                               "Glenn",
                                               "Humboldt",
                                               "Imperial",
                                               "Inyo",
                                               "Kern",
                                               "Kings",
                                               "Lake",
                                               "Lassen",
                                               "Los Angeles",
                                               "Madera",
                                               "Marin",
                                               "Mariposa",
                                               "Mendocino",
                                               "Merced",
                                               "Modoc",
                                               "Mono",
                                               "Monterey",
                                               "Napa",
                                               "Nevada",
                                               "Orange",
                                               "Placer",
                                               "Plumas",
                                               "Riverside",
                                               "Sacramento",
                                               "San Benito",
                                               "San Bernardino",
                                               "San Diego",
                                               "San Francisco",
                                               "San Joaquin",
                                               "San Luis Obispo",
                                               "San Mateo",
                                               "Santa Barbara",
                                               "Santa Clara",
                                               "Santa Cruz",
                                               "Shasta",
                                               "Sierra",
                                               "Siskiyou",
                                               "Solano",
                                               "Sonoma",
                                               "Stanislaus",
                                               "Sutter",
                                               "Tehama",
                                               "Trinity",
                                               "Tulare",
                                               "Tuolumne",
                                               "Ventura",
                                               "Yolo",
                                               "Yuba"),
                                   selected = "Alameda"),
                       
                       br(),
                       sliderInput("year", 
                                   label = "Year",
                                   min = 2004, max = 2014, 
                                   value = 2009, ticks = FALSE,
                                   sep = "")
                )),       
        
        hr(),
        #        plotOutput("trendPlot")
        fluidRow(column(11, 
                        tabsetPanel(
                                tabPanel("Instruction", includeHTML("Introduction.html")),
                                tabPanel("Trend Plot", plotOutput("trendPlot")),
                                tabPanel("Top 10 County", tableOutput("table"))

                                ) 
                ))
        
        ))
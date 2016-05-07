#server.R

library(shiny)
library(dplyr)
library(ggplot2)

#read data
Pesticide <- read.csv("CA_PesticideUse_byCounty_04-14.csv")

shinyServer(
        function(input, output) {
                #Trendplot for chosen county and year
                output$trendPlot <- renderPlot({
                        
                        county <- input$county
                        year <- input$year
                        
                        #data for trend plot of chosen county
                        plotdata <- Pesticide%>%
                                filter(County == county)
                        
                        #calculate state total use in chosen year
                        statetotal <- Pesticide%>%
                                filter(Year == year)%>%
                                group_by(Year)%>%
                                summarise(lbs = sum(lbs))
                        
                        #Summary of chosen county in chosen year
                        labeldata <- Pesticide%>%
                                filter(County == county, Year==year)
                        
                        #calculate chosen county's use in percentage of state total use
                        percent = round(labeldata$lbs/statetotal$lbs*100,1)
                        
                        #plot titles
                        plot.title <- paste(county, "County", sep=" ")
                        plot.subtitle <- paste("Pesticide use in", year, ":", labeldata$lbs, 
                                               "lbs,", percent, 
                                               "% state total use. State rank:", 
                                               labeldata$Rank, sep = " ")
                        #plot
                        ggplot(plotdata, aes(x=Year, y=lbs))+
                                geom_line(size = 1.5, colour="darkblue") +
                                geom_vline(xintercept=year, color="red", size=1) +
                                labs(x="\nYear",
                                     y="Use (lbs Active Ingredient)\n")+
                                ggtitle(bquote(atop(.(plot.title), atop(italic(.(plot.subtitle)), "")))) +
                                theme(text = element_text(size=20))
                        
                })
                
                #Table of top 10 counties for chosen year
                output$table <- renderTable({
                        tabledata <- Pesticide%>%
                                filter(Year == input$year, Rank %in% 1:10)%>%
                                arrange(Rank)%>%
                                select(County, lbs, Year)
                })
                
        }
        
)
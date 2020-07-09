#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Uniformly Random Numbers Plotting App"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            numericInput("points", "Number of points to be plotted:",value = 1000, min = 1, max = 1000, step=1),
            sliderInput("sliderX","Minimum and Maximum X values" , min=-100, max=100,value = c(-50,50)),
            sliderInput("sliderY","Minimum and Maximum Y values" , min=-100, max=100,value = c(-50,50)),
            checkboxInput("show_xlab","Show or hide X-axis label",value=TRUE),
            checkboxInput("show_ylab","Show or hide X-axis label",value = TRUE),
            checkboxInput("show_main","Show or hide Title label")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Graph of Random points"),
            plotOutput("plot")
        )
    )
))

library(shiny)
shinyServer(function(input, output) {
    output$plot <- renderPlot({
        set.seed(2020-01-26)
        number_of_points <- input$points
        minX <- input$sliderX[1]
        minY <- input$sliderY[1]
        maxX <- input$sliderX[2]
        maxY <- input$sliderY[2]
        dataX <- runif(number_of_points,min = minX, max = maxX)
        dataY <- runif(number_of_points,min = minY, max = maxY)
        xlab <- ifelse(input$show_xlab , "X-axis" , " ")
        ylab <- ifelse(input$show_ylab , "Y-axis" , " ")
        main <- ifelse(input$show_main , "Title" , " ")
        plot(dataX,dataY, xlab = xlab , ylab=ylab , main = main, xlim = c(-100,100),ylim=c(-100,100))    
    })
})

#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

dat<-matrix(c(15.0, 1.0, 2.5, 6.5, 5.0, 5.0, 5.0), ncol = 1, nrow = 7)

shinyServer(function(input, output) {
    output$user_data <- renderText({
        
        paste0("Your weight is ", "<strong>", input$mass, "</strong>", " kg", "<br>", "Your height  ", "<strong>", input$height, "</strong>", " kg")
    })
    
    output$results <- renderText({
        bmi = round(input$mass/(input$height/100)^2, 1)
        if      (bmi <  15.0) cond = "<span style='color: #49852e'>Very severely underweight</span>"
        else if (bmi <= 16.0) cond = "<span style='color: #61bd4f'>Severely underweight</span>"
        else if (bmi <= 18.5) cond = "<span style='color: #99d18f'>Underweight</span>"
        else if (bmi <= 25.0) cond = "<span style='color: #d6ecd2'>Normal</span>"
        else if (bmi <= 30.0) cond = "<span style='color: #99d18f'>Overweight</span>"
        else if (bmi <= 35.0) cond = "<span style='color: #61bd4f'>Obese Class I (Moderately obese)</span>"
        else if (bmi <= 40.0) cond = "<span style='color: #49852e'>Obese Class II (Severely obese)</span>"
        else                  cond = "<span style='color: #3f6f21'>Obese Class III (Very severely obese)</span>"
        paste0("Your BMI is ", "<strong>", bmi, "</strong>","<br>", " And it is ", cond, " according to the categories in ", "<a href='https://en.wikipedia.org/wiki/Body_mass_index#Categories'>", "Wikipedia", "</a>"
        )
    })
    
    output$plot <- renderPlot({
        bmi = round(input$mass/(input$height/100)^2, 1)
        if (bmi>40) {bmi=40}
        barplot(dat, horiz = TRUE, yaxt="n", xlab = "BMI", main="Your BMI", col=c("#49852e", "#61bd4f", "#99d18f", "#d6ecd2", "#99d18f", "#61bd4f", "#49852e", "#3f6f21"))
        lines(x=c(bmi, bmi), y=c(0,1.2), col="#fcdc04", lwd=6)
    })
    
    
})
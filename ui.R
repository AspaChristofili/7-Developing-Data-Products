#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
    titlePanel("Body Mass Index (BMI) Calculator"),
    sidebarLayout(sidebarPanel(
        helpText("In order to calculate your Body Mass Index, please input below your mass and height."),
        sliderInput(
            inputId = "height",
            label = strong("What is your height (in cm)?"),
            min = 140,
            max = 220,
            value = 185
        ), #User height input slider
        sliderInput(
            inputId = "mass",
            label = strong("What is your weight (in kg)?"),
            min = 40,
            max = 120,
            value = 74
        ), #User mass input slider
        h5("Note:"),
        h5("Body Mass Index (BMI) is a convenient rule of thumb used, to broadly categorize a person as:"),
        h5("- Underweight (<18.5)"),
        h5("- Normal (18.5-25.0)"),
        h5("- Overweight (25.0-30.0)"),
        h5("- Obese (>30.0)"),
        h5("based on muscle/fat/bone mass and height.")
    ),
    
    mainPanel(
        uiOutput("user_data"), #Text with the user data
        plotOutput("plot", height = "175px", width = "100%"), #Colorful plot of the user BMI
        uiOutput("results") #Text results
    ))
))
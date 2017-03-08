library(shiny)
ui <- fluidPage(
        sliderInput("obs", "Number of observations:",
                    min = 0, max = 1000, value = 500
        )
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

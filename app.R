
library(shiny)
library(shinycssloaders)
library(shinythemes)
library(shinyWidgets)

vertex_query <- readr::read_file('queries/airport_vertex_query.sql')
routes_query <- readr::read_file('queries/airline_routes_query.sql')

con <- DBI::dbConnect(RSQLite::SQLite(), 'data/airplanes_db.db')
res <- dbSendQuery(con, vertex_query)
vertices <- dbFetch(res)
res <- dbSendQuery(con, routes_query)
edges <- dbFetch(res)
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

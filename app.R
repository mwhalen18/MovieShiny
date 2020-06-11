########## Building a shiny app #################################

library(shiny)
library(tidyverse)
library(lme4)
#str(bcl)
TMDb6000 <- read.csv("TMDb.6000.csv")
moneymodel <- 
  lmer(revenue ~ 1 + genre.1 + genre.2 + genre.3 +
         (1|Director) + (1|actor.1) + (1|actor.2) + (1|actor.3), 
       data = TMDb6000, na.action = na.omit)

ratingsmodel <-
  lmer(vote_average ~ 1 + genre.1 + genre.2 + genre.3 +
         (1|Director) + (1|actor.1) + (1|actor.2) + (1|actor.3), 
       data = TMDb6000, na.action = na.omit)

ui <- fluidPage(titlePanel("Let's Make a Movie!"),
                tabsetPanel(
                  tabPanel("Welcome", br(), fluid = TRUE,
                           mainPanel(
                             strong("This app uses data collected from over 6000 movie titles from 1916 to 2019 and allows the user to input director, cast, and genre information to generate a projected box office score as well as an average critical rating")
                           )),
                  tabPanel("About", br(), fluid = TRUE,
                           mainPanel(
                             strong("The Data"), br(),
                             "Data were collected by scraping data from various wikipedia pages. Some data was supplemented by scraping from Box Office Mojo", br(), 
                             "A new data set is being generated using APIs from the TMDb database. Check back for updates", br(), br(), "Code is available on the my GitHub page (https://github.com/mwhalen18/MovieShiny)", br(), br(),
                             strong("The Model"), br(),
                             "Model Desicriptions coming. Check back for updates.",
                             strong("HOW TO USE THE APP"), br(),
                             "In order for your entries to work in the model, it is important that you spell the names correctly and with correct capitalization.", br(),
                             "For example, entering Leonardo Dicaprio will not work; you must enter it as 'Leonardo DiCaprio'.", br(), 
                             "In addition, many names require special characters. For example, 'Chloe Grace Moretz' will not work; you must enter 'Chloë Grace Moretz'.", br(),
                             "You will find a list of the names of all actors and directors as they appear in the data set.", br(), br(),
                             "Select a '1' for each genre you wish to assign to your movie. Be sure to enter a '0' for any genres you do not wish to include. (This is a weird thing that I could easily fix but I don't feel like it)", br(),
                             "Update: this has been fixed. There is now a drop down menu to select your genres. Trade-off: you only get 3 genres. You still need to specify 'Null' if you wish to exclude a genres. Again, an update will fix this later.", br()
                           )),
                  tabPanel("Make Your Movie", fluid = TRUE,
                           sidebarPanel(textInput("Director", "Director Name", value = ""),
                                          textInput("actor.1", "Lead Actor", value = ""),
                                          textInput("actor.2", "Supporting Actor 1", value = ""),
                                          textInput("actor.3", "Supporting Actor 2", value = ""), br(), br(), br()
                                          ),
                           fluidRow(
                             column(3,
                                    selectInput("genre.1", "Genre 1:", c("NULL", "Action", "Adventure", "Animation", "Comedy", "Crime", "Drama", "Family", "Fantasy",
                                                                         "History", "Horror", "Music", "Mystery", "Romance", "Science Fiction", "Thriller", "War", "Western")),
                                    selectInput("genre.2", "Genre 2:", c("NULL", "Action", "Adventure", "Animation", "Comedy", "Crime", "Drama", "Family", "Fantasy",
                                                                         "History", "Horror", "Music", "Mystery", "Romance", "Science Fiction", "Thriller", "War", "Western")),
                                    selectInput("genre.3", "Genre 3:", c("NULL", "Action", "Adventure", "Animation", "Comedy", "Crime", "Drama", "Family", "Fantasy",
                                                                         "History", "Horror", "Music", "Mystery", "Romance", "Science Fiction", "Thriller", "War", "Western")),
                                    submitButton("SUBMIT"), br(),
                                    "Note: it will take a while to run"
                                    ),
                           ),
                             tabsetPanel(
                               tabPanel("Summary",
                                        "Your movie will make this much money", br(),
                                        textOutput("moneyprediction"), br(),
                                        "Your movie will earn a rating of", br(),
                                        textOutput("ratingprediction"), br(),
                                        "Your data", br(),
                                        tableOutput("user.data"), br(), br()
                               ),
                               tabPanel("List of Directors", br(),
                                        strong("List of Directors in alphabetical order. You may copy and poste the name to ensure accurate spelling."), br(),
                                        tableOutput("directorlist")
                               ),
                               tabPanel("List of Lead Actors", br(),
                                        strong("List of Lead actors in alphabetical order. You may copy and poste the name to ensure accurate spelling."), br(),
                                        tableOutput("actor1list")
                               ),
                               tabPanel("List of Supporting Actors", br(),
                                        strong("List of Lead actors in alphabetical order. You may copy and poste the name to ensure accurate spelling."), br(),
                                        tableOutput("suppactorlist")
                               )
                             )
                           ),
                  tabPanel("Acknowledgements", fluid = TRUE)
                  )
)
server <- function(input, output) {
  newdata <- reactive({
    data.frame(Director = as.factor(input$Director),
    actor.1 = as.factor(input$actor.1),
    actor.2 = as.factor(input$actor.2),
    actor.3 = as.factor(input$actor.3),
    genre.1 = as.factor(input$genre.1),
    genre.2 = as.factor(input$genre.2),
    genre.3 = as.factor(input$genre.3)
    )
  })
  output$user.data <- renderTable({
    newdata()
  })

    output$moneyprediction <- renderText(
      predict(moneymodel,newdata(),allow.new.levels = FALSE)
  )
  
  output$ratingprediction <- renderText(
    predict(ratingsmodel,newdata(),allow.new.levels = FALSE)
  )
 
   output$directorlist <- renderTable(
     TMDb6000 %>% select(Director) %>% unique() %>% arrange(Director)
     )
   output$actor1list <- renderTable(
     TMDb6000 %>% select(actor.1) %>% unique() %>% arrange(actor.1)
   )
   output$suppactorlist <- renderTable(
     TMDb6000 %>% select(actor.2) %>% unique() %>% arrange(actor.2)
   )
}
  
shinyApp(ui = ui, server = server)
 

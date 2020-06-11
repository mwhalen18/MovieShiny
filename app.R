########## Building a shiny app #################################

library(shiny)
library(tidyverse)
library(lme4)
#str(bcl)
bcl <- read.csv("final.movie.data.csv")
moneymodel <- 
  lmer(log(Earnings) ~ 1 + Action + Adventure + Animation + Comedy + Crime + Drama +
         Family + Fantasy + History + Horror + Music + Mystery + Romance + Science.Fiction +
         Thriller + War + Western +
         (1|Director) + (1|actor.1) + (1|actor.2) + (1|actor.3), 
       data = bcl)

ratingsmodel <-
  lmer(vote_average ~ 1 + Action + Adventure + Animation + Comedy + Crime + Drama +
         Family + Fantasy + History + Horror + Music + Mystery + Romance + Science.Fiction +
         Thriller + War + Western +
         (1|Director) + (1|actor.1) + (1|actor.2) + (1|actor.3), 
       data = bcl)

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
                             "Using a novel maching learning algorithm, this app takes user input and determines a 'least squares fit' for each user input. Every time you use this app you increase the computational accuracy of the model and improve the model predictions.", br(), br(),
                             "The base model fits a linear regression on each movie genre to calculate how interactions between different genres preditct movie success. For example, the genres 'action' and 'thriller' may work well together, gaining a movie higher box office success than the genres 'action' and 'romance' might", br(),
                             "Using statistical methods developed for behavioral ecology, I have fit a random regression for each genre interaction with each director and lead actor combination.",
                             strong("HOW TO USE THE APP"), br(),
                             "In order for your entries to work in the model, it is important that you spell the names correctly and with correct capitalization.", br(),
                             "For example, entering Leonardo Dicaprio will not work; you must enter it as 'Leonardo DiCaprio'.", br(), 
                             "In addition, many names require special characters. For example, 'Chloe Grace Moretz' will not work; you must enter 'Chloë Grace Moretz'.", br(),
                             "You will find a list of the names of all actors and directors as they appear in the data set.", br(), br(),
                             "Select a '1' for each genre you wish to assign to your movie. Be sure to enter a '0' for any genres you do not wish to include. (This is a weird thing that I could easily fix but I don't feel like it)"
                           )),
                  tabPanel("Make Your Movie", fluid = TRUE,
                           sidebarPanel(textInput("Director", "Director Name", value = ""),
                                          textInput("actor.1", "Lead Actor", value = ""),
                                          textInput("actor.2", "Supporting Actor 1", value = ""),
                                          textInput("actor.3", "Supporting Actor 2", value = ""), br(), br(), br()
                                          ),
                           fluidRow(
                             column(1,
                                    checkboxGroupInput("Action", "Action", c("1", "0")), 
                                    checkboxGroupInput("Adventure", "Adventure", c("1", "0")),
                                    checkboxGroupInput("Animation", "Animation", c("1", "0")),
                                    checkboxGroupInput("Comedy", "Comedy", c("1", "0"))
                                    ),
                             column(1,
                                    checkboxGroupInput("Crime", "Crime", c("1", "0")),
                                    checkboxGroupInput("Drama", "Drama", c("1", "0")),
                                    checkboxGroupInput("Family", "Family", c("1", "0")),
                                    checkboxGroupInput("Fantasy", "Fantasy", c("1", "0"))
                             ),
                             column(1,
                                    checkboxGroupInput("History", "History", c("1", "0")),
                                    checkboxGroupInput("Horror", "Horror", c("1", "0")),
                                    checkboxGroupInput("Music", "Music", c("1", "0")),
                                    checkboxGroupInput("Mystery", "Mystery", c("1", "0"))
                             ),
                             column(1,
                                    checkboxGroupInput("Romance", "Romance", c("1", "0")),
                                    checkboxGroupInput("Thriller", "Thirller", c("1", "0")),
                                    checkboxGroupInput("Western", "Western", c("1", "0")),
                                    checkboxGroupInput("War", "War", c("1", "0"))
                             ),
                             column(2,
                                    checkboxGroupInput("Science.Fiction", "Science Fiction", c("1", "0")),
                                    numericInput("year", "Release Year", 2012, min = 1916, max = 2020),
                                    submitButton("SUBMIT")
                           )
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
    Action = as.integer(input$Action),
    Adventure = as.integer(input$Adventure),
    Animation = as.integer(input$Animation),
    Comedy = as.integer(input$Comedy),
    Crime = as.integer(input$Crime),
    Drama = as.integer(input$Drama),
    Family = as.integer(input$Family),
    Fantasy = as.integer(input$Fantasy),
    History = as.integer(input$History),
    Horror = as.integer(input$Horror),
    Music = as.integer(input$Music),
    Mystery = as.integer(input$Mystery),
    Romance = as.integer(input$Romance),
    Science.Fiction = as.integer(input$Science.Fiction),
    Thriller = as.integer(input$Thriller),
    War = as.integer(input$War),
    Western = as.integer(input$Western),
    year = as.integer(input$year)
    )
  })
  output$user.data <- renderTable({
    newdata()
  })

    output$moneyprediction <- renderText(
      exp(predict(moneymodel,newdata(),allow.new.levels = FALSE))
  )
  
  output$ratingprediction <- renderText(
    predict(ratingsmodel,newdata(),allow.new.levels = FALSE)
  )
 
   output$directorlist <- renderTable(
     bcl %>% select(Director) %>% unique() %>% arrange(Director)
     )
   output$actor1list <- renderTable(
     bcl %>% select(actor.1) %>% unique() %>% arrange(actor.1)
   )
   output$suppactorlist <- renderTable(
     bcl %>% select(actor.2) %>% unique() %>% arrange(actor.2)
   )
}
  
shinyApp(ui = ui, server = server)
 

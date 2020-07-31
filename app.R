########## Building a shiny app #################################

library(shiny)
library(tidyverse)
library(lme4)
library(shinycssloaders)
library(shinythemes)

set.seed(7106)

#str(bcl)
TMDb6000 <- read.csv("TMDb.6000.csv") %>% mutate(Action = as.factor(Action),
                                                 Adventure = as.factor(Adventure),
                                                 Animation = as.factor(Animation),
                                                 Comedy = as.factor(Comedy),
                                                 Drama = as.factor(Drama),
                                                 Family = as.factor(Family),
                                                 Fantasy = as.factor(Fantasy),
                                                 History = as.factor(History),
                                                 Horror = as.factor(Horror),
                                                 Music = as.factor(Music),
                                                 Mystery = as.factor(Mystery),
                                                 Romance = as.factor(Romance),
                                                 Thriller = as.factor(Thriller),
                                                 War = as.factor(War),
                                                 Western = as.factor(Western),
                                                 Science.Fiction = as.factor(Science.Fiction))
moneymodel <- 
  lmer(sqrt(revenue) ~ 1 + Action + Adventure + Animation + Comedy + Drama +
         Family + Fantasy + History + Horror + Music + Mystery + Romance +
         Thriller + War + Western + Science.Fiction +
         (1|Director) + (1|actor.1) + (1|actor.2) + (1|actor.3), 
       data = TMDb6000)

ratingsmodel <-
  lmer(vote_average ~ 1 + Action + Adventure + Animation + Comedy + Drama +
        Family + Fantasy + History + Horror + Music + Mystery + Romance +
        Thriller + War + Western + Science.Fiction +
        (1|Director) + (1|actor.1) + (1|actor.2) + (1|actor.3), 
      data = TMDb6000, na.action = na.omit)

ui <- fluidPage(theme = shinytheme("spacelab"),
                titlePanel("Let's Make a Movie!"),
                tabsetPanel(
                  tabPanel("Welcome", br(), fluid = TRUE,
                           mainPanel(
                             strong("This app uses data collected from over 6000 movie titles from 1916 to 2019 and allows the user to input director, cast, and genre information to generate a projected box office score as well as an average critical rating")
                           )),
                  tabPanel("About", br(), fluid = TRUE,
                           mainPanel(
                             strong("The Data"), br(),
                             "Data were collected using APIs from the TMDb database. The full dataset includes each film, full cast and crew, genre descriptions, as well as average user ratings from the TMDb website.", br(), br(), "Code is available on the my GitHub page (https://github.com/mwhalen18/MovieShiny)", br(), br(),
                             strong("HOW TO USE THE APP"), br(),
                             "In order for your entries to work in the model, it is important that you spell the names correctly and with correct capitalization.", br(),
                             "For example, entering Leonardo Dicaprio will not work; you must enter it as 'Leonardo DiCaprio'.", br(), 
                             "In addition, many names require special characters. For example, 'Chloe Grace Moretz' will not work; you must enter 'Chloë Grace Moretz'.", br(),
                             "You will find a list of the names of all actors and directors as they appear in the data set.", br(), br(),
                             "There is now a drop down menu to select your genres. Trade-off: you only get 3 genres. You need to specify 'Null' if you wish to exclude a genres. Again, an update will fix this later.", br(), br(),
                             strong("A FEW CAVEATS"), br(),
                             "One big hiccup in the model and soething that will likely pose a big challenge in the future, is the lack of revenue data for streaming service movies. Netflix in particular keeps streaming data extremely tightly controlled so anyone working on modelling revenue will not be able to include netflix titles in their data. 
                             In particular, since Netflix releases some of their movies to theaters for limited release, we have very bad predictions for how much money they make. We could predict revenue from number of streams a movie gets but this data is also kept secret by Netflix. So it goes...", br(), br(),
                             "The ratings data is also pretty spotty. These are not critical reviews, but aggregate scores from TMDb, as voted on by users. It would be possible to pull metacritic data, but there is a bigger issue.
                             RATINGS SYSTEMS STINK. I've posted some graphs on my blog showing just how little variation there is in how movies are reviewed. Early on in Holywood everything was on a 4 or 5 star scale, resulting in very very little variation as most movies got a 75-100% rating.
                             With the introduction of the 10 star scale, there wasn't much change. People tend to feel bad giving a movie a half star rating...sad.", br(),
                             "But, obviously this is all for fun so who cares"
                           )),
                  tabPanel("Make Your Movie", fluid = TRUE,
                           sidebarPanel(textInput("Director", "Director Name", value = ""),
                                          textInput("actor.1", "Lead Actor", value = ""),
                                          textInput("actor.2", "Supporting Actor 1", value = ""),
                                          textInput("actor.3", "Supporting Actor 2", value = ""), br(), br(), br()
                                          ),
                           fluidRow(
                             column(3,
                                    selectInput("genre.1", "Genre 1:", c("Action", "Adventure", "Animation", "Comedy", "Crime", "Drama", "Family", "Fantasy",
                                                                         "History", "Horror", "Music", "Mystery", "Romance", "Science Fiction", "Thriller", "War", "Western")),
                                    selectInput("genre.2", "Genre 2:", c("NULL", "Action", "Adventure", "Animation", "Comedy", "Crime", "Drama", "Family", "Fantasy",
                                                                         "History", "Horror", "Music", "Mystery", "Romance", "Science Fiction", "Thriller", "War", "Western")),
                                    selectInput("genre.3", "Genre 3:", c("NULL", "Action", "Adventure", "Animation", "Comedy", "Crime", "Drama", "Family", "Fantasy",
                                                                         "History", "Horror", "Music", "Mystery", "Romance", "Science Fiction", "Thriller", "War", "Western")),
                                    submitButton("SUBMIT"), br(),
                                    "Note: it will take a second to run. I am working on a better 'loading' visualization."
                                    ),
                           ),
                             tabsetPanel(
                               tabPanel("Summary",
                                        "Your movie will make this much money", br(),
                                        withSpinner(textOutput("moneyprediction"), size = 0.5), br(),
                                        "Your movie will earn a rating of", br(),
                                        textOutput("ratingprediction"), br()
                               ),
                               tabPanel("List of Directors", br(),
                                        strong("List of Directors in alphabetical order. You may copy and poste the name to ensure accurate spelling."), br(),
                                        tableOutput("directorlist")
                               ),
                               tabPanel("List of Lead Actors", br(),
                                        strong("List of Lead actors in alphabetical order. You may copy and poste the name to ensure accurate spelling."), br(),
                                        tableOutput("actor1list")
                               ),
                               tabPanel("List of Primary Supporting Actors", br(),
                                        strong("List of supporting actors in alphabetical order. You may copy and poste the name to ensure accurate spelling."), br(),
                                        tableOutput("suppactorlist")
                               ),
                               tabPanel("List of Secondary Supporting Actors", br(),
                                        strong("List of supporting actors in alphabetical order. You may copy and paste the name to ensure accurate spelling."),
                                        tableOutput("actor3list")
                                        )
                             )
                           ),
                  tabPanel("Model Descriptions and Performance", br(),
                           "Check back at some point in the very distant future ")
                  )
)
server <- function(input, output) {
  newdata <- reactive({
    data.frame(Director = as.factor(input$Director),
    actor.1 = as.factor(input$actor.1),
    actor.2 = as.factor(input$actor.2),
    actor.3 = as.factor(input$actor.3),
    Action = as.factor(ifelse(input$genre.1 == "Action", 1,
                    ifelse(input$genre.2 == "Action", 1,
                           ifelse(input$genre.3 == "Action", 1, 0)))),
    Adventure = as.factor(ifelse(input$genre.1 == "Adventure", 1,
                       ifelse(input$genre.2 == "Adventure", 1,
                              ifelse(input$genre.3 == "Adventure", 1, 0)))),
    Animation = as.factor(ifelse(input$genre.1 == "Animation", 1,
                       ifelse(input$genre.2 == "Animation", 1,
                              ifelse(input$genre.3 == "Animation", 1, 0)))),
    Comedy = as.factor(ifelse(input$genre.1 == "Comedy", 1,
                    ifelse(input$genre.2 == "Comedy", 1,
                           ifelse(input$genre.3 == "Comedy", 1, 0)))),
    Crime = as.factor(ifelse(input$genre.1 == "Crime", 1,
                   ifelse(input$genre.2 == "Crime", 1,
                          ifelse(input$genre.3 == "Crime", 1, 0)))),
    Drama = as.factor(ifelse(input$genre.1 == "Drama", 1,
                   ifelse(input$genre.2 == "Drama", 1,
                          ifelse(input$genre.3 == "Drama", 1, 0)))),
    Family = as.factor(ifelse(input$genre.1 == "Family", 1,
                    ifelse(input$genre.2 == "Family", 1,
                           ifelse(input$genre.3 == "Family", 1, 0)))),
    Fantasy = as.factor(ifelse(input$genre.1 == "Fantasy", 1,
                     ifelse(input$genre.2 == "Fantasy", 1,
                            ifelse(input$genre.3 == "Fantasy", 1, 0)))),
    History = as.factor(ifelse(input$genre.1 == "History", 1,
                     ifelse(input$genre.2 == "History", 1,
                            ifelse(input$genre.3 == "History", 1, 0)))),
    Horror = as.factor(ifelse(input$genre.1 == "Horror", 1,
                    ifelse(input$genre.2 == "Horror", 1,
                           ifelse(input$genre.3 == "Horror", 1, 0)))),
    Music = as.factor(ifelse(input$genre.1 == "Music", 1,
                   ifelse(input$genre.2 == "Music", 1,
                          ifelse(input$genre.3 == "Music", 1, 0)))),
    Mystery = as.factor(ifelse(input$genre.1 == "Mystery", 1,
                     ifelse(input$genre.2 == "Mystery", 1,
                            ifelse(input$genre.3 == "Mystery", 1, 0)))),
    Romance = as.factor(ifelse(input$genre.1 == "Romance", 1,
                     ifelse(input$genre.2 == "Romance", 1,
                            ifelse(input$genre.3 == "Romance", 1, 0)))),
    Science.Fiction = as.factor(ifelse(input$genre.1 == "Science Fiction", 1,
                             ifelse(input$genre.2 == "Science Fiction", 1,
                                    ifelse(input$genre.3 == "Science Fiction", 1, 0)))),
    Thriller = as.factor(ifelse(input$genre.1 == "Thriller", 1,
                      ifelse(input$genre.2 == "Thriller", 1,
                             ifelse(input$genre.3 == "Thriller", 1, 0)))),
    War = as.factor(ifelse(input$genre.1 == "War", 1,
                 ifelse(input$genre.2 == "War", 1,
                        ifelse(input$genre.3 == "War", 1, 0)))),
    Western = as.factor(ifelse(input$genre.1 == "Western", 1,
                     ifelse(input$genre.2 == "Western", 1,
                            ifelse(input$genre.3 == "Western", 1, 0))))
    )
  })
  
    output$moneyprediction <- renderText(
      (predict(moneymodel,newdata(),allow.new.levels = FALSE))^2
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
   output$actor3list <- renderTable(
     TMDb6000 %>% select(actor.3) %>% unique() %>% arrange(actor.3)
   )
}
  
shinyApp(ui = ui, server = server)
 

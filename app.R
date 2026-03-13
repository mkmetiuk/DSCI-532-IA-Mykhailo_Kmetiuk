library(shiny)
library(dplyr)
library(readr)
library(ggplot2)

df <- read_csv("data/StudentPerformanceFactors.csv", show_col_types = FALSE) |>
  filter(!is.na(School_Type), !is.na(Exam_Score), !is.na(Hours_Studied))

ui <- fluidPage(
  titlePanel("Academic Performance Dashboard"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "school_type",
        "Select School Type",
        choices = c("Public", "Private"),
        selected = "Public"
      )
    ),
    
    mainPanel(
      h3("Average Exam Score"),
      textOutput("avg_score"),
      
      h3("Study Hours vs Exam Score"),
      plotOutput("scatter_plot")
    )
  )
)

server <- function(input, output, session) {
  filtered_data <- reactive({
    df |> filter(School_Type == input$school_type)
  })
  
  output$avg_score <- renderText({
    paste0(round(mean(filtered_data()$Exam_Score, na.rm = TRUE), 1), "%")
  })
  
  output$scatter_plot <- renderPlot({
    ggplot(filtered_data(), aes(x = Hours_Studied, y = Exam_Score)) +
      geom_point(alpha = 0.5, color = "steelblue") +
      geom_smooth(method = "loess", se = FALSE, color = "red") +
      labs(
        title = paste("Study Habits for", input$school_type, "Schools"),
        x = "Hours Studied",
        y = "Exam Score"
      ) +
      theme_minimal()
  })
}

shinyApp(ui, server)
library(shiny)
library(shinydashboard)
library(googlesheets)

shinyUI(
  dashboardPage(
    dashboardHeader(
      title = "useR 2018 Application Review",
      titleWidth = "450px"
    ),
    dashboardSidebar(
      width = "450px",
      uiOutput("auth"),
      uiOutput("sync"),
      radioButtons("net_mode", "Operation Mode", c("Online", "Offline"), inline = TRUE),
      sidebarMenu(
        tags$li(
          actionLink("btn_debug",
                     style = "margin: 0;",
                     label = NULL,
                     class = "",
                     icon("bug"),
                     span("Debug")
          )
        ),
        tags$li(
          actionLink("btn_sync",
                     style = "margin: 0;",
                     label = NULL,
                     class = "",
                     icon("refresh"),
                     span("Synchronise")
          )
        )
      ),
      # uiOutput("n_entries"),
      hr(),
      fluidRow(
        column(6, radioButtons("show_personal", "Personal information", c("Shown", "Hidden"), inline = TRUE)),
        column(6, radioButtons("filter_rejections", "Rejection filter", c("On", "Off"), inline = TRUE))
      ),
      textInput("text_match", "Fuzzy text sorting"),
      DT::dataTableOutput("tbl_applicants")
    ),
    dashboardBody(
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
      ),
      uiOutput("abstract"),
      uiOutput("review")
    )
  )
)


library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   #titlePanel(h1("Gemmatria Caclulator/Converter")),
   
   # Sidebar with a slider input for number of bins 
      verticalLayout( h1("Gemmatria Caclulator/Converter"),
                      h4("Developed with functions from the",em("gemmatria"),"package"),
                         img(src="gemmatria.png",height=180,width=180,align="center"),
                      h5("Created by Benjamin Smith (GitHub Username:", 
                         a(href="https://github.com/benyamindsmith",
                           "benyamindsmith"),")."),
                           textInput(inputId="hb",
                           label="Hebrew Text/Number (to Convert to Gemmatria)"),
                 selectInput("ts","Compute",c("Standard Gemmatria",
                                          "AtBash Gemmatria",
                                          "Roshei Taivos Gemmatria",
                                          "Sofei Taivos Gemmatria",
                                          "AtBash Form","Convert to Gemmatria")),
                 submitButton(text="Compute"),
                 br(),
                 br(),
                 textOutput("gem"),
                 
                 br(),
                 br(),
                 p(em("Questions? Comments? Contact the Author via email: benyamindsmith@gmail.com or Github:",
                   a(href="https://github.com/benyamindsmith/gemmatria",
                     "https://github.com/benyamindsmith/gemmatria"),". Read more at:",
                   a(href="https://benyamindsmith.github.io/gemmatria/",
                     "https://benyamindsmith.github.io/gemmatria/")))
                 
                 )
      )

# Define server logic required to draw a histogram
server <- function(input, output) {
   output$gem<-renderText(
     {
    if(input$ts=="Standard Gemmatria") {
      gemmatria::get_gemmatria(input$hb)
    }else if (input$ts=="AtBash Gemmatria"){
        gemmatria::get_gemmatria_atbash(input$hb)
    }else if(input$ts=="Roshei Taivos Gemmatria"){
        gemmatria::get_gemmatria_rt(input$hb)
    }else if(input$ts=="Sofei Taivos Gemmatria"){
        gemmatria::get_gemmatria_st(input$hb)
    }else if(input$ts=="AtBash Form"){
        gemmatria::as_atbash(input$hb)
    }else if(input$ts=="Convert to Gemmatria"){
      gemmatria::as_gemmatria(as.numeric(input$hb))
    }
     })
}

# Run the application 
shinyApp(ui = ui, server = server)


library(shiny) 
library(datasets)

# Define the overall UI 
ui<- fluidPage (                     # Use a fluid Bootstrap layout
  titlePanel("Dataset Explorer"),    # Give the page a title
  sidebarLayout (                    # Generate a row with a sidebar
    sidebarPanel(
      helpText("These built-in dataset are from the R Datasets Package"),
      selectInput("dataset", "Select a dataset :", 
                  choices = c("attitude", "iris", "mtcars", "Orange", "pressure","sleep", "women")),                # Define the sidebar with one input
      
      sliderInput("obs", "No. of observations to view :", 
                  min=0, max=100, value=10),  # Define the sidebar with slider input
      helpText("Press the refresh button when you choose another dataset or to update view."),
      submitButton("Refresh")
    ),
    mainPanel(                      # Create the space for multi-tab results
      tabsetPanel(                
        tabPanel(h5("Dimension"),helpText("The output of dim( ) function shows the   number of rows/columns of the selected dataset."),verbatimTextOutput("dim")),
        tabPanel(h5("Structure"),helpText("The output of str( ) function displays the internal structure of the selected dataset."),verbatimTextOutput("str")),
        tabPanel(h5("Summary"), helpText("The output of the summary( ) function shows you for every variable a set of descriptive statistics, depending on the type of the variable."), verbatimTextOutput("summary")),
        tabPanel(h5("Observations"),helpText ("The View( ) function opens a data frame, matrix, or other table like object in a new window in a spreadsheet style format that can be scrolled for viewing the data."),tableOutput("view")),
        tabPanel(h5("Scatter Plot"), helpText ("The pairs( ) enables you to visually check possible correlated variables."),plotOutput("plot")),
        tabPanel(h5("Documentation"), 
                 helpText ("This Shiny application, called Dataset Explorer helps user to understand the dataset or data frame before any detailed analysis can be performed by providing useful functions for exploring data."), 
                 helpText ("A dataset is a collection of several pieces of information called variables, usually arranged by columns."),
                 helpText ("Data in R are often stored in data frames, because they can store multiple types of data."),
                 helpText ("The dim( ) function returns the dimensions of the data frame that is number of rows and number of columns.  The output is a vector."),
                 helpText ("The str( ) function returns many useful pieces of information, including the above useful outputs and the types of data for each column."),
                 helpText ("The summary ( ) function provides basic descriptive statistics and frequencies."),
                 helpText ("The View( ) function opens a data frame in a new window in a spreadsheet style format that can be scrolled for viewing the data. The head ( ) and tail ( ) functions also allow us to view the first few and last few rows of the data."),
                 helpText ("The pairs( ) enables us to visually check possible correlated variables."),
                 helpText ("The names( ) function returns the column headers."),
                 helpText ("The levels( ) function returns the categories or levels of a categorical variable."))
      )
    )
  )
) 
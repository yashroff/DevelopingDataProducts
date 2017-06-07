#
# This is the server logic of a Shiny web application to predict US personal expenditure for years after 1960
# based on data from 1940 to 1960, using linear regression.
# View the running shiny app here: https://yashroff.shinyapps.io/DevelopingDataProducts/

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    modelPred <- reactive ({
        mdata<-melt(USPersonalExpenditure,id=c("1940","1945","1950","1955","1960"))
        mdata<-subset(mdata,X1==input$ExpenseType)
        fit<-lm(value~X2,data=mdata)  
        pred<-predict(fit,data.frame(X2=as.numeric(input$predYear)))
        newrow<- c(input$ExpenseType,input$predYear,pred)
        mdata<-rbind(mdata,newrow)
        pred
    })
 
       output$distPlot <- renderPlot({
           
           mdata<-melt(USPersonalExpenditure,id=c("1940","1945","1950","1955","1960"))
           mdata<-subset(mdata,X1==input$ExpenseType)
           fit<-lm(value~X2,data=mdata)  
           pred<-predict(fit,data.frame(X2=as.numeric(input$predYear)))
           newrow<- c(input$ExpenseType,as.numeric(input$predYear),round(pred,1))
           mdata<-rbind(mdata,newrow)
           
           #ggplot(data=mdata,aes(x=X2,y=value)) + geom_bar(stat="identity") + xlab("Year") + ylab("Expenditure in Billions of Dollars")
           plot(mdata$X2,mdata$value, xlab="Year",ylab="Expenditure in Billions of Dollars",type="b",col="red")
           
        })
    
    
    output$pred1 <- renderText ({
        modelPred()
   })
    
})

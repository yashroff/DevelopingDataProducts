#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

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

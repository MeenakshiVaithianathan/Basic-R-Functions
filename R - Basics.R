## BASIC R Functions FOR ANALYTICS ##



# Setting up the working directory
setwd("C:/Users/User/Desktop/OneDrive/Desktop/Course Documents/2.Fall 2022/DA/Lab") 
getwd()   



#Variable & vector assignment
university <- "University of Windsor"
faculty <- c("MOM","Nursing")
university_age <- 60

length(university)           #returns only the length of the vector
nchar(university)            #retuns the number of characters
typeof(university_age)       #retunrs the datatype 
is.integer(university_age)   #checks for the datatype mentioned

university_founding <- as.Date("12/19/1962", format = '%m/%d/%Y')   #date formating
                                                                    #lowercase %y for 2 digits and uppercase %y for 4 digits



# Assigning a range of values to the variable
academicyears <- 1956:2022
academicyears[7]             #to get a specific data point
rm(academicyears)            #remove function



# LISTS (can store values of different datatype)
faculties <- c("Odette","Nursing","Science")
str(faculties)               #to view the structue, function capability varies according the parameter passed 

#List for having a vectors of diff datatypes
faculty_data <- list(faculties = c("Odette","Nursing","Science"),
                     enrolment = c(959, 2375, 893))



# VECTORS (can store values of same datatype only)
finalgrade <- vector(mode = "integer",length = 50)
finalgrade[1:3] <- c(1,2,3)  #assigning new values 
finalgrade[51] <- 43         #adding extra values to the vector



# VECTOR ARITHMETICS
studentcounts <- c(959, 2375, 893)
totalstudents <- sum(studentcounts)
doublestudents <- studentcounts*2
budgetperstudent <- facultybudgets/studentcounts
largeenrolments <- (studentcounts > 2000)
outlierenrolments <- (studentcounts > 2000 | studentcounts<900)



# Converting list to a data frame
faculty_df <- as.data.frame(faculty_data)



# Factors (used to specify levels/ranks;for ordinal type of data)
faculty_factors <- as.factor(faculties)



# LOAD A CSV FILE 
salescsv <- read.csv("yearly_sales.csv")
salescsv
View(salescsv)

head(salescsv)               #to see first few rows

# selecting particular rows
salescsv[2:5, ]              #to view rows 2 to 5

salescsv[1:6,c(1,3,4)]       #to view rows 1-6 & columns 1,3,4

salescsv[salescsv$gender == "F", ] #where function to print table for F only

table(salescsv$gender)

f <- sum(sales$sales_total,sales$gender == "F")
m <- sum(sales$sales_total,sales$gender == "M")

# Inserting a NA and fixing it by manual entry
missingsales <- sales
missingsales[missingsales$cust_id =="100004",] $sales_total <- NA

fix(missingsales)            #allows us to inject manual value into the cells

# LOAD AN EXCEL FILE 
library(readxl)
sales <- read_excel("yearly_sales.xlsx", sheet = "yearly_sales")




# DESCRIPTIVE ANALYTICS
str(sales)                    #returns structure
summary(sales)                #returns mean,median,mode of all the columns

table(sales$gender)           #NOT SUM,gives the total no. of M & F in the sales table

table(sales$num_of_orders)

quantile(sales$sales_total,0.75)
quantile(sales$sales_total,0.25)
interquartilerange <- as.numeric(quantile(sales$sales_total,0.75)-
                                   quantile(sales$sales_total,0.25))
interquartilerange

var(sales$sales_total)   
max(sales$sales_total)
sd(sales$sales_total)



# AGGREGATE FUNCTIONS
table(sales$sales_total,sales$gender) #only prints all the rows

tapply(sales$sales_total,sales$gender,sum) #tapply() applies the function on the subset
tapply(sales$sales_total,sales$gender,var)
tapply(sales$sales_total,sales$gender,sd)



# SKEWNESS and KURTOSIS

library(moments)

skewness(sales$sales_total) 

#measure of asymmetry of the distribution or data set
#returned 5.9 - POSITIVELY SKEWED, NOT NORMALLY DISTRIBUTED

# > 0 - positively(Right) skewed, majority of data values less than mean & concentrated on the left side of the graph.
# = 0 - or close to 0,  symmetric and data is normally distributed
# < 0 - negatively(left) skewed, majority of data values greater than mean & concentrated on the right side of the graph.

kurtosis(sales$sales_total)

#measure of sharpness of the peak in the data distribution
#measure of whether or not a distribution is heavy-tailed or light-tailed relative to a normal distribution

# > 3 - data distribution is leptokurtic, shows a sharp peak on the graph
# = 3 - distribution is mesokurtic. For normal distribution, kurtosis value is approximately equal to 3.
# < 3 - data distribution is platykurtic, not entirely flat topped though


## END ##
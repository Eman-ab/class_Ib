#create subfloders
dir.create("data") #storing raw or cleaned data
dir.create("script") #saving scripts
dir.create("results") #saving analysis output
dir.create("plots") #visualizations
#import data
data <- read.csv(file.choose())
#view data
View(data)
#structure dataset
str(data)
#convert character into factor
#gender to factor
data$gender_fac <- as.factor(data$gender)
#gender to numeric factor
data$gender_num <- ifelse(data$gender_fac == "Male",0,1)
#class gender
class(data$gender_num)
#convert diagnosis into factor
diagnosis <- as.factor(data$diagnosis)
class(diagnosis)
diagnosis
#set factor level
diagnosis <- factor(diagnosis, levels = c("Normal","Cancer"))
diagnosis
#smoker binary factor
data$smoker_fac <- as.factor(data$smoker)
data$smoker_num <- ifelse(data$smoker_fac == "Yes",1,0)
class(data$smoker_num)
# Save file  as CSV in results folder
write.csv(patient_info, file = "results/patient_info_clean.csv")

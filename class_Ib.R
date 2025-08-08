#create subfloders
dir.create("data") #storing raw or cleaned data
dir.create("script") #saving scripts
dir.create("results") #saving analysis output
dir.create("plots") #visualizations
#import data
data <- read.csv(file.choose())
#view data
View(data)
#save raw data
write.csv(data, file = "data/patient_info.csv")
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
diagnosis_fac <- as.factor(data$diagnosis)
class(diagnosis_fac)
#set factor level
diagnosis_fac <- factor(data$diagnosis_fac, levels = c("Normal","Cancer"))
levels(data$diagnosis_fac)
#smoker binary factor
data$smoker_fac <- as.factor(data$smoker)
data$smoker_num <- ifelse(data$smoker_fac == "Yes",1,0)
class(data$smoker_num)
#clean data
#gender col
data <- data[-3]
#diagnosis col
data <- data[-3]
#smoker col
data <- data[-4]
# Save file  as CSV in results folder
write.csv(data, file = "results/patient_info_clean.csv")
# Save the entire R workspace
save.image(file = "full_workspace.RData")
# Save selected objects only
save(gender, diagnosis_fac, file = "workspace.RData")
# Load workspace
load("workspace.RData")
load("full_workspace.RData")

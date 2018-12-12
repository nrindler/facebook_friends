# FACEBOOK FRIENDS FROM HTML

#

# INSTALL RVEST PACKAGE
# Set working directory to the folder where this R script is stored
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# LOAD REQUIRED PACKAGES
# R version 3.4.1 (2017-06-30)
packages <- c("rvest")

# CHECK IF ALL REQUIRED PACKAGES ARE INSTALLED - IF NOT, INSTALL THEM
new.packages <- packages[!(packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

#load packages
lapply(packages, require, character.only = TRUE)





# IMPORT FRIENDS LIST FROM FACEBOOK DATA EXTRACT
friend_list <- read_html("C:\\Users\\nadav.rindler\\Pictures\\facebook-nrindler\\friends\\friends.html")

# SELECT FRIEND NAMES FROM HTML GOBBLEDYGOOK
friends = friend_list %>%
  html_nodes("div._3-96._2pio._2lek._2lel") %>% 
  html_text()
friends

# RANDOMLY SELECT 30 FRIENDS TO TAG IN POST
set.seed(123)
selected_friends = sample(friends,40)
selected_friends

# ADD "@" SYMBOL TO FRIENDS' NAMES FOR FACEBOOK TAGGING
paste_fun = function(i){
  i = paste0("@",i)
}

at_friends = sapply(selected_friends, paste_fun)
at_friends = unname(at_friends)
at_friends

# EXPORT FRIENDS LIST
write.csv(at_friends, file="facebook_friends.csv", row.names=F)

# END
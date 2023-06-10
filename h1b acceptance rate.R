# Relationship-of-STEM-majors-and-H-1B-Visa-Acceptance-rate
library(tidyverse)
library(readxl)
library(tidyr)

#load data
data <- read_excel(file.choose())
data

#summary statistics
summary(data)

#pivot data1
data_long <- data %>% 
  pivot_longer(cols = c(Stem, Non.Stem), names_to = "Major", values_to = "Count")

#perform t-test
result <- t.test(Count ~ Major, data = data_long, var.equal = TRUE)
list(result)

#graph data
ggplot(data_long, aes(x = Major, y = Count, fill = Major)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal()

#load second data
data2 <- read_excel(file.choose())
data2

# graph second data
ggplot(data2, aes(x = Count, y = Industry, fill = Industry)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("#FFA07A", "#20B2AA", "#9370DB", "#87CEFA")) +
  xlab("Count") +
  ylab("Industry") +
  theme_minimal()

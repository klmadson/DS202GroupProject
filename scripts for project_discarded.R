library(tidyverse)
library(readr)

library(learningtower)

Pisa_2018 <- load_student(year = "2018")

Pisa_2018

summary(Pisa_2018$country)
library(dplyr)
USA_students <- Pisa_2018 %>% filter(`country` == "USA")

View(USA_students)

write.csv(USA_students, file="some-file.csv", row.names = FALSE)

data <- read.csv(file = "USA_students.csv")

View(data)

install.packages("reshape2")
library(reshape2)

USA_long <- USA_students %>%
  pivot_longer(cols = math:science,
               names_to = "Test_type",
               values_to = "score")

USA_long %>%
  ggplot(aes(x = gender, y = score)) +
  geom_boxplot() +
  facet_wrap(~Test_type)

USA_long %>%
  ggplot(aes(x = score, fill = gender, colour = gender)) +
  geom_histogram(alpha = 0.5, position = "identity") +
  facet_wrap(~Test_type)

View(USA_long)

download.file("https://raw.githubusercontent.com/kevinwang09/learningtower/master/LICENSE.md", "learningtower09license.md")


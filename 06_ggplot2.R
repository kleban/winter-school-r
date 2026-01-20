library(tidyverse)

interviews_plotting <- read_csv("data_output/interviews_plotting.csv")
interviews_plotting

dim(interviews_plotting)

# simple plot
plot(interviews_plotting$no_membrs, interviews_plotting$liv_count,
     main = "Base R Scatterplot",
     xlab = "Number of Household Members",
     ylab = "Number of Livestock Owned")

library(lattice)
xyplot(liv_count ~ no_membrs | village, data = interviews_plotting,
       main = "Lattice Plot: Livestock Count by Household Members",
       xlab = "Number of Household Members",
       ylab = "Number of Livestock Owned")

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items))

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_point() ### added

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_point(alpha = 0.5) # added

# трошки зсуваємо точки, ефект струшування
interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter() # added

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.5,
              width = 0.2,
              height = 0.2)

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter(alpha = 0.5,
              color = "blue",
              width = 0.2,
              height = 0.2)

# add legend + color for each village
interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items)) +
  geom_jitter(aes(color = village), size=4, alpha = 0.8, width = 0.2, height = 0.2)

interviews_plotting %>%
  ggplot(aes(x = no_membrs, y = number_items, color = village)) +
  geom_count()


interviews_plotting %>%
  ggplot(aes(x = village, y = rooms)) +
  geom_jitter(aes(color = respondent_wall_type),
              alpha = 0.8,
              size = 5,
              width = 0.2,
              height = 0.2)

my_plot <- percent_items %>%
  ggplot(aes(x = village, y = percent)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ items) +
  labs(title = "Percent of respondents in each village \n who owned each item",
       x = "Village",
       y = "Percent of Respondents") +
  theme_bw() +
  theme(axis.text.x = element_text(color = "grey20", size = 12, angle = 45,
                                   hjust = 0.5, vjust = 0.5),
        axis.text.y = element_text(color = "grey20", size = 12),
        text = element_text(size = 16),
        plot.title = element_text(hjust = 0.5))

ggsave("fig_output/name_of_file.png", my_plot, width = 15, height = 10)
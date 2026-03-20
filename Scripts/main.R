library(tidyverse)
load("Data/Results.RData")


# Use a LaTeX-like serif font for plot text.
plot_font <- "Latin Modern Roman"
theme_set(theme_grey(base_size = 14, base_family = plot_font))

filtered_data <- Results |>
  filter(Season %in% c(2021, 2022, 2023))

# Calcaulte the lambda for the poisson distribution
# by using the mean of the home goals
home_goals_mean <- mean(filtered_data$HomeGoals)
away_goals_mean <- mean(filtered_data$AwayGoals)

print(paste("Home goals mean:", home_goals_mean))
print(paste("Away goals mean:", away_goals_mean))


home_goals_model <- tibble(
  # Use the max number of goals otherwise
  # we cannot compare the model to the data
  x = 0:max(filtered_data$HomeGoals),
  poisson = dpois(x, home_goals_mean)
)

away_goals_model <- tibble(
  x = 0:max(filtered_data$AwayGoals),
  poisson = dpois(x, away_goals_mean)
)

# Plot home goals model
ggplot() +
  geom_bar(data = filtered_data, aes(x = HomeGoals, y = after_stat(prop))) +
  geom_point(data = home_goals_model, aes(x = x, y = poisson), cex = 2) +
  scale_x_continuous(breaks = seq(0, 9, 1)) +
  labs(x = "Number of goals", y = "Proportion of games", title = "Home goals")

# Save the plot
ggsave(
  "Plots/Question1/HomeGoals.pdf",
  width = 10,
  height = 8,
  scale = 0.55,
  device = grDevices::cairo_pdf,
  create.dir =  TRUE,
)

# Plot away goals model
ggplot() +
  geom_bar(data = filtered_data, aes(x = AwayGoals, y = after_stat(prop))) +
  geom_point(data = away_goals_model, aes(x = x, y = poisson), cex = 2) +
  scale_x_continuous(breaks = seq(0, 9, 1)) +
  labs(x = "Number of goals", y = "Proportion of games", title = "Away goals")

# Save the plot
ggsave(
  "Plots/Question1/AwayGoals.pdf",
  width = 10,
  height = 8,
  scale = 0.55,
  device = grDevices::cairo_pdf,
  create.dir =  TRUE,
)
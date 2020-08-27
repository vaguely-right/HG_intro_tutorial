# https://hockey-graphs.com/2019/10/08/exploratory-data-analysis-using-tidyverse/

library("tidyverse")

# Load the data
game_data <- read_csv("https://raw.githubusercontent.com/hockey-graphs/hg-data-cleaning/master/game_data.csv")

view(game_data)

game_data %>%
  count(game_id)

game_data %>%
  group_by(game_id,event_type) %>%
  summarize(n())

# Get the powerplay data
PP <- game_data %>%
  filter(game_strength_state %in% c("5v4","4v5") & (event_length > 0 | event_type %in% c("SHOT","GOAL","MISS","BLOCK")))

PP %>%
  group_by(game_id,event_type) %>%
  summarize(n())

# Pivot the data
PP_on_ice <- PP %>%
  pivot_longer(cols=home_on_1:away_on_7, names_to="on_ice", values_to="player") %>%
  mutate(team = ifelse(str_detect(on_ice,"home"),home_team,away_team))

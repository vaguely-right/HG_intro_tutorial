# https://hockey-graphs.com/2019/12/11/an-introduction-to-r-with-hockey-data/

library("tidyverse")

# Load data
PHI_tutorial_data <- read_csv("https://raw.githubusercontent.com/hockey-graphs/HG_intro_tutorial/master/PHI_tutorial_data.csv")

# Some looks at the data
PHI_tutorial_data %>%
  count(event_type) %>%
  arrange(desc(n))

PHI_tutorial_data %>%
  group_by(event_type) %>%
  summarize(n())

view(PHI_tutorial_data)

# Filter and subset the data rows
goals <- PHI_tutorial_data %>%
  filter(event_type == "GOAL")

goals_5v5 <- PHI_tutorial_data %>%
  filter(event_type == "GOAL" & game_strength_state == "5v5")

goals_special_teams <- PHI_tutorial_data %>%
  filter(event_type =="GOAL" & game_strength_state %in% c("5v4","4v5"))

# Filter out specific columns
goals_small <- goals %>%
  select(game_id,game_date,event_type,event_detail,event_team,event_player_1)

# Calculate a new variable
goal_variable <- PHI_tutorial_data %>%
  mutate(goal = ifelse(event_type == "GOAL",1,0))

sum(goal_variable$goal)

goal_variable %>% count(event_type)

# Group and summarize
goals_by_game <- goal_variable %>%
  group_by(game_id) %>%
  summarize(total_goals = sum(goal))

goals_by_game_team <- goal_variable %>%
  filter(!is.na(event_team)) %>%
  group_by(game_id, event_team) %>%
  summarize(goals = sum(goal))

# Arrange
goals_by_game_team <- goals_by_game_team %>%
  arrange(desc(goals))


# Make a bar chart
ggplot(data = PHI_tutorial_data) +
  geom_bar(aes(x = event_zone))

ggplot(data = PHI_tutorial_data) +
  geom_bar(aes(x=event_zone, fill=event_zone)) +
  labs(y = "Number of Events")







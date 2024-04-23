library(tidyverse)
library(jsonlite)

data = read_csv("C:/Users/Orion Wilcox/Documents/Personal/Blog/Projects/svelte-dataviz-course/nba-scatter-plot/src/data/nba_hometowns.csv")
states = read_csv("C:/Users/Orion Wilcox/Documents/Personal/Blog/Projects/svelte-dataviz-course/nba-scatter-plot/src/data/states_pop.csv")

nba = data %>%
  filter(To == 2024,
         Country == "US") %>%
  group_by(State) %>%
  summarize(players = n())

nba = left_join(nba, states, by = c("State" = "code")) %>%
  select(state, region, pop2020, players) %>%
  mutate(players_per_million= (players/pop2020)*1000000)

nba_json = toJSON(nba, pretty = T)


write_json(nba, "C:/Users/Orion Wilcox/Documents/Personal/Blog/Projects/svelte-dataviz-course/nba-scatter-plot/src/data/nba_per_cap.js")
  

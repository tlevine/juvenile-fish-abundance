library(ggplot2)
library(scales)
library(reshape2)

if (!('raw' %in% ls())) {
  raw <- read.csv('fish.csv')
}

fish <- raw[c('Migration.Year', 'Species', 'Abundance')]
p <- ggplot(fish) + aes(x = Migration.Year, y = Abundance, group = Species, color = Species) +
  geom_line() + scale_y_log10('Abundance (number of fish in the river)', labels = comma)

two.fish <- subset(fish,
  (Species == 'Skykomish River Chinook Salmon' | Species == 'Puyallup River Chinook Salmon'))
two.fish.cast <- na.omit(dcast(two.fish, Migration.Year ~ Species,))

df <- read.csv('Economist_Assignment_Data.csv')

head(df)

pl <- ggplot(df, aes(x = CPI, y = HDI)) + 
  geom_point(aes(color = Region), shape = 1, size = 3) +
  geom_smooth(aes(group=1), method = 'lm', formula = y ~ log(x), se = FALSE, color = 'red')



points.to.label <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                     "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                     "India", "Italy", "China", "South Africa", "Spane",
                     "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                     "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                     "New Zealand", "Singapore")

p2 <- pl + geom_text(aes(label=Country), color = 'gray20',
                     data = subset(df, Country %in% points.to.label), check_overlap = TRUE) +
           theme_bw()

p3 <- p2 + 
  scale_x_continuous(name = "Corruption Perceptions Index, 2011 (10 = least corrupt)",
                              limits = c(1,10),
                              breaks= 1:10) +
  scale_y_continuous(name = "Human Development Index, 2011 (1=Best)",
                     limits = c(.2,1.0),
                     breaks = seq(0,1,.2)) +
  ggtitle("Corruption and Human development", ) +
  theme(plot.title = element_text(hjust = 0.5))


  

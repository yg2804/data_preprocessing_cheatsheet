x = c(50, 51, 53, 55, 56, 60, 65, 65, 68)
df <- data.frame(x)
hist(df$x)

library(ggvis)
library(ggplot2)
library(gridExtra)


df <- data.frame(x)
ggplot(df, aes(x)) + 
  geom_histogram(color = "blue", fill = "lightblue", binwidth = 5, center = 52.5) + 
  theme_grey(14)

# Cumulative frequency histogram 
df <- data.frame(x = rnorm(1000))
g1 <- ggplot(df, aes(x = x)) + 
  geom_histogram(color = "blue", fill = "lightblue") +
  ggtitle ("Frequency")
g2 <- ggplot(df, aes(x = x)) + 
  geom_histogram(aes(y = cumsum(..count..)),
                 color = "blue", fill = "lightblue") +
  ggtitle("Cumulative Frequency")
grid.arrange(g1, g2, nrow = 1)


# ggvis and interactive graphs with binwidth change 

faithful %>% ggvis(~eruptions) %>% 
  layer_histograms(fill := "lightblue", 
                   width = input_slider(0.1, 2, 
                                        value = .1, 
                                        step = .1,
                                        label = "width"))

# Center 
df <- data.frame(x = c(50, 51, 53, 55, 56, 60, 65, 65, 68))
df %>% ggvis(~x) %>% 
  layer_histograms(fill := "red", 
                   width = input_slider(1, 10,
                                        value = 5, 
                                        step = 1,
                                        label = "width"),
                   center = input_slider(50, 55, 
                                         value = 52.5,
                                         step = .5,
                                         label = "center"))


# Center with data values shown 
df <- data.frame(x = c(50, 51, 53, 55, 56, 60, 65, 65, 68), y = c(.5, .5, .5, .5, .5, .5, .5, 1.5, .5))
df %>% ggvis(~x, ~y) %>% 
  layer_histograms(fill := "lightcyan", 
                   width = 5,
                   center = input_slider(45, 55, value = 45, step = 1, label = "center")) %>% 
  layer_points(fill := "blue", size := 200) %>% 
  add_axis("x", properties = axis_props(labels = list(fontSize = 20))) %>% 
  scale_numeric("x", domain = c(46, 72)) %>% 
  add_axis("y", values = 0:3, properties = axis_props(labels = list(fontSize = 20)))

# get the boxplot stats 
g <- ggplot(mtcars, aes(y=mpg)) +
  geom_boxplot()
ggplot_build(g)$data[[1]][,1:6]


# Data Visualizasion using ggplot2 library

#install.packages("ggplot2")
library(ggplot2)

ggplot(data = mtcars, aes(x = wt, y = mpg) ) +
  geom_point()
  labs(title = "Automobile Data", x = "weight", y = "Miles Per Gallon")

ggplot(data = mtcars, aes(x = wt, y = mpg) ) +
  geom_point(pcn = 18, color = "blue", size = 2) +
  geom_smooth(method = "lm", color = "red", linetype = 2)
  labs(title = "Automobile Data", x = "weight", y = "Miles Per Gallon")

#copy dataframe
mtcars_df <- mtcars

#copy datat type from numeric to factor
mtcars_df$am <- factor(mtcars_df$am, levels = c(0,1),
                       labels = c("Automatic", "Manual"))

mtcars_df$vs <- factor(mtcars_df$vs, levels = c(0,1),
                       labels = c("V-Engine", "Straight Engine"))

mtcars_df$cyl <- factor(mtcars_df$cyl)

ggplot(data = mtcars_df, aes(x=hp, y=mpg, 
                              shape = cyl, color=cyl)) +
  geom_point(size = 3) +
  facet_grid(am~vs) +
  labs (title = "Automobile data by Engine type",
  x = "horsepower", y = "Miles Per Gallon")

# plot type

data(singer, package = "lattice")
singer_df <- singer

#Histogram
ggplot(singer_df, aes(x = height)) +
  geom_histogram()

# box plot and point
ggplot(singer_df, aes(x = voice.part, y = height)) +
  geom_boxplot() +
  geom_point(position = "jitter", color = "blue", alpha = 0.5)

# Working with Salaries Data

#install.packages("car")
library(car)
data(Salaries, package = "car")

ggplot(Salaries, aes(x=rank, y=salary)) +
  geom_point()

ggplot(Salaries, aes(x=rank, y=salary)) +
  geom_boxplot(color = "red", notch = TRUE) +
  geom_point(position = "jitter", color = "blue", alpha = 0.5) +
  geom_rug(color = "black")

ggplot(Salaries, aes(x=salary, fill=rank)) +
  geom_density(alpha = 0.5)

ggplot(Salaries, aes(x=yrs.since.phd, y=salary, 
                     color = rank, shape = sex)) +
  geom_point() 

ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color = sex)) +
  geom_point() +
  facet_grid(~rank)

ggplot(Salaries, aes(x=yrs.since.phd, y=salary, color = rank)) +
  geom_point() +
  facet_grid(~sex)

ggplot(Salaries, aes(x=yrs.since.phd, y=salary)) +
  geom_point() +
  facet_grid(sex~rank)

# Bar Chart

ggplot(Salaries, aes(x=rank, fill = sex)) +
  geom_bar(position = "stack") +
  stat_count(geom = "text", color = "white", size = 3.5,
              aes(label = ..count..), position=position_stack(vjust = 0.5))

ggplot(Salaries, aes(x=rank, fill = sex)) +
  geom_bar(position = "dodge")

ggplot(Salaries, aes(x=rank, fill = sex)) +
  geom_bar(position = "fill")

# Smoothed lines

ggplot(Salaries, aes(x=yrs.since.phd, y=salary,)) +
  geom_point() +
  geom_smooth()

ggplot(Salaries, aes(x=yrs.since.phd, y=salary,
                     shape = sex, color = sex)) +
  geom_point() +
  geom_smooth(method = lm, formula = y ~ poly(x,2),
              se = FALSE)

# Modify appearance


# axes

ggplot(Salaries, aes(x = rank, y = salary, fill = sex)) +
  geom_boxplot() +
  scale_x_discrete(breaks = c("AsstProf", "AssocProf", "Prof"),
                   labels = c("Assistant\nProfessor",
                              "Associate\nProfessor",
                              "Full\nProfessor")) +
  scale_y_continuous(breaks = c(50000, 100000, 150000, 200000),
                     labels = c("$50k", "$100k", "$150k", "$200k")) +
  labs(title = "Faculty Salary by Rank and Sex",
       x = "Rank", y = "Salaries")

# Legend

ggplot(Salaries, aes(x = rank, y = salary, fill = sex)) +
  geom_boxplot() +
  scale_x_discrete(breaks = c("AsstProf", "AssocProf", "Prof"),
                   labels = c("Assistant\nProfessor",
                              "Associate\nProfessor",
                              "Full\nProfessor")) +
  scale_y_continuous(breaks = c(50000, 100000, 150000, 200000),
                     labels = c("$50k", "$100k", "$150k", "$200k")) +
  labs(title = "Faculty Salary by Rank and Sex",
       x = "Rank", y = "Salaries") +
  theme(legend.position = c(0.2, 0.8))

# Scales

ggplot(mtcars_df, aes(x=wt, y=mpg, 
                      size = disp, shape = am, color = vs)) +
  geom_point() +
  labs(x = "weight", y = "Miles per Gallon",
       title = "Bubble Chart",
       size = "Engine\nDisplacement", shape = "Transmission",
       color = "Engine Type")

data(Salaries, package = "car")
# install.packages("car")
library(car)
# install.packages("gridExtra")
library(ggplot2)
library(gridExtra)

# Multiple Graph 

p1 <- ggplot(Salaries, aes(x=rank)) + geom_bar()
p2 <- ggplot(Salaries, aes(x=sex, y=salary)) + geom_boxplot()
p3 <- ggplot(Salaries, aes(x=salary, fill =  rank)) + geom_density(alpha = 0.5)
p4 <- ggplot(Salaries, aes(x=yrs.service, y=salary)) + geom_point()

grid.arrange(p1,p2,p3, p4, nrow = 2, ncol = 3)


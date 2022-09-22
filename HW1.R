# Load libraries
library(ggplot2)
library(ggthemes)
library(dplyr)

# Load data
data(Titanic)
Titanic <- as.data.frame(Titanic)

# Plot data
Graph <- ggplot(data = Titanic,
								mapping = aes(x = Survived,
															y = Freq,
															color = Sex,
															fill = Sex)) +
	geom_bar(position = "dodge",
					 stat = "identity") +
	geom_bar(position = "dodge",
					 stat = "identity") +
	geom_text(mapping = aes(label = Freq),
						color = "black",
						size = 2.5,
						vjust = -0.5,
						alpha = 0.4) +
	facet_grid(Class ~ Sex + Age) +
	theme_tufte() +
	ggtitle(label = "A Look at Titanic Survival Based on Class, Sex, and Age",
					subtitle = "Not Great for Men") +
	theme(axis.ticks.x=element_blank(),
				axis.text.y=element_blank(),
				axis.ticks.y=element_blank()) +
	theme(legend.position = "bottom") +
	theme(legend.title=element_blank()) +
	ylim(c(0, 1000))

ggsave("HW1.pdf",
			 scale = 3,
			 dpi = 300)

# Display plot
Graph

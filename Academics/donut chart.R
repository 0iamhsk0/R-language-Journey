library(ggplot2)
library(gridExtra)
data <- data.frame(
  Category = c("A", "B", "C", "D"),
  Value = c(20, 30, 40, 10)
)
data

pie_chart <- ggplot(data, aes(x = "", y = Value, fill = Category)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  geom_text(aes(label = paste(Category, round(Value/sum(Value) * 100), "%")),
            position = position_stack(vjust = 0.5)) + 
  scale_fill_brewer(palette = "Dark2") +
  theme_void()
pie_chart

donut_chart <- pie_chart +
  geom_bar(data = data, aes(x = "", y = Value),
           stat = "identity",
           width = 0.5, fill = "lightblue") +
  geom_text(data = data,
            aes(label = paste(Category, Value, "%")))
donut_chart




# file     : es_05_p_value.R
# title    : p值法
# author   : Ming-Chang Lee
# date     : 2024.3.12
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

library(ggplot2)
library(ggpubr)

mu = 0
std = 1

xmin <- -3
xmax <- 3

# 雙尾檢定
score = 1.96
two_tail <- ggplot(data.frame(x = c(xmin, xmax)), aes(x = x)) + 
  ggtitle("雙尾檢定") +
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_function(fun = dnorm, args = list(mean = mu, sd = std)) + 
  stat_function(fun = dnorm, args = list(mean = mu, sd = std), xlim = c(score, xmax),
                geom = "area", fill = "blue", alpha = .2) +
  stat_function(fun = dnorm, args = list(mean = mu, sd = std), xlim = c(xmin, -score),
                geom = "area", fill = "blue", alpha = .2) +
  scale_x_continuous(name = "x", breaks = seq(xmin, xmax, std)) +
  scale_y_continuous(name = "Probability density") +
  geom_segment(aes(x = 2.5, y = 0.1, xend = 2.2, yend = 0.01), 
               arrow = arrow(length = unit(0.2, "cm")),
               lwd = 0.8) +
  annotate("text", x = 2.5, y = 0.12, label = "p/2值", size = 6) +
  geom_segment(aes(x = -2.5, y = 0.1, xend = -2.2, yend = 0.01), 
               arrow = arrow(length = unit(0.2, "cm")),
               lwd = 0.8) +
  annotate("text", x = -2.5, y = 0.12, label = "p/2值", size = 6)

# 單尾檢定(左尾檢定)
score = -1.645
left_tail <- ggplot(data.frame(x = c(xmin, xmax)), aes(x = x)) + 
  ggtitle("單尾檢定(左尾檢定)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_function(fun = dnorm, args = list(mean = mu, sd = std)) + 
  stat_function(fun = dnorm, args = list(mean = mu, sd = std), xlim = c(xmin, score),
                geom = "area", fill = "blue", alpha = .2) +
  scale_x_continuous(name = "x", breaks = seq(xmin, xmax, std)) +
  scale_y_continuous(name = "Probability density") +
  geom_segment(aes(x = -2.5, y = 0.1, xend = -2.2, yend = 0.01), 
               arrow = arrow(length = unit(0.2, "cm")),
               lwd = 0.8) +
  annotate("text", x = -2.5, y = 0.12, label = "p值", size = 6)

# 單尾檢定(右尾檢定)
score = 1.645
right_tail <- ggplot(data.frame(x = c(xmin, xmax)), aes(x = x)) + 
  ggtitle("單尾檢定(右尾檢定)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  stat_function(fun = dnorm, args = list(mean = mu, sd = std)) + 
  stat_function(fun = dnorm, args = list(mean = mu, sd = std), xlim = c(score, xmax),
                geom = "area", fill = "blue", alpha = .2) +
  scale_x_continuous(name = "x", breaks = seq(xmin, xmax, std)) +
  scale_y_continuous(name = "Probability density") +
  geom_segment(aes(x = 2.5, y = 0.1, xend = 2.2, yend = 0.01), 
               arrow = arrow(length = unit(0.2, "cm")),
               lwd = 0.8) +
  annotate("text", x = 2.5, y = 0.12, label = "p值", size = 6)

# 設定上下圖以1行顯示, 上圖為雙尾檢定, 下圖左側為左尾檢定, 下圖右側為右尾檢定
ggarrange(two_tail, ggarrange(left_tail, right_tail), ncol = 1)
# end

# file     : regression_model.R
# title    : regression model and 3D plot
# author   : Ming-Chang Lee
# date     : 2025.05.25
# YouTube  : https://www.youtube.com/@alan9956
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Email    : alan9956@gmail.com

# 步驟1 安裝R
# 步驟2 安裝RStudio

# 安裝 car 套件, 按右側 [Run]
# install.packages("car")

# 載入 car 套件
library(car)

# 設定檔案位置
myfile <- "https://raw.githubusercontent.com/rwepa/DataDemo/master/CaveCreek_precipitation.csv"

# 使用 read.csv 匯入 CSV 檔案
df <- read.csv(myfile)

# 顯示物件
df

# 使用 lm (y~x, data = ...) 建立迴歸模型
df_lm <- lm(formula = runoff ~ precipitation, data = df)

# 顯示lm 線上說明
?lm

# 模型摘要
summary(df_lm)
# Call:
#   lm(formula = runoff ~ precipitation, data = df)
# 
# Residuals:
#      Min       1Q   Median       3Q      Max 
# -11.5050  -0.8624   0.2184   2.5697   6.5684 
# 
# Coefficients:
#               Estimate Std. Error t value Pr(>|t|)   
# (Intercept)   -10.2625     7.8842  -1.302  0.21404   
# precipitation   0.5651     0.1819   3.107  0.00772 **
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 4.342 on 14 degrees of freedom
# Multiple R-squared:  0.4082,	Adjusted R-squared:  0.3659 
# F-statistic: 9.655 on 1 and 14 DF,  p-value: 0.00772

# 獨立性檢定
# H0 觀測值具有獨立性,暨觀測值之間沒有自我相關,符合迴歸之獨立性假設.
# H1 觀測值具有自我相關性.

# 建立 Durbin-Watson 檢定
set.seed(168)
durbinWatsonTest(df_lm)
# lag Autocorrelation D-W Statistic p-value
#   1       0.4006555      1.156043   0.072
# Alternative hypothesis: rho != 0

# p-value = 0.072, p-value > 0.05 接受H0, 觀察值符合獨立性假設.

# 3d-regression plot
# install.packages("rgl")
library(rgl)

df <- read.csv("https://raw.githubusercontent.com/rwepa/DataDemo/master/marketing.csv")
RegModel.1 <- lm(sales~facebook+youtube, data=df)
summary(RegModel.1)
scatter3d(sales~facebook+youtube, data=df, fit="linear", residuals=TRUE, bg="white", axis.scales=TRUE, grid=TRUE, ellipsoid=FALSE)
# end

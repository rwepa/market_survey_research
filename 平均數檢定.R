# file     : 平均數檢定.R
# author   : Ming-Chang Lee
# email    : alan9956@gmail.com
# RWEPA    : http://rwepa.blogspot.tw/
# GitHub   : https://github.com/rwepa
# Encoding : UTF-8

# 匯入檔案: 單一母體平均數檢定.sav
# 下載至 C:/rdata
# https://github.com/rwepa/market_survey_research/blob/main/spss_datasets/%E5%96%AE%E4%B8%80%E6%AF%8D%E9%AB%94%E5%B9%B3%E5%9D%87%E6%95%B8%E6%AA%A2%E5%AE%9A.sav

library(foreign)
myfile <- "C:/rdata/單一母體平均數檢定.sav"
score <- read.spss(myfile)
class(score) # list
score$成績
mytest <- t.test(x = score$成績, alternative = c("two.sided"), mu = 70)
mytest
mytest$p.value # 0.01334634
# p.value <= 0.05, Reject H0 and accept H1.
# end

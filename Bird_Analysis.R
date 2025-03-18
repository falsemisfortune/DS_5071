library(MASS)
library(class)
library(e1071)
library("Hmisc")
library(boot)
library(performance)

grouse <- read.csv('SootyGrouseRainier')
warbler <- read.csv('WilsonsWarblerRainier')

grouse_corr <- rcorr(as.matrix(grouse))
warbler_corr <- rcorr(as.matrix(warbler))

flattenCorrMatrix <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
  )
}

res <- rcorr(as.matrix(grouse[,2:11]))
flattenCorrMatrix(res$r, res$P)

summary(grouse)
plot(grouse$SpeciesTotal, grouse$EMNT)
plot(grouse$SpeciesTotal, grouse$EMXT)

set.seed(42)
train_i <- sample(1:nrow(grouse), 0.7 * nrow(grouse))
train <- grouse[train_i, ]
test <- grouse[-train_i, ]

# Fit a simple linear regression model
lm.fit <- lm(SpeciesTotal ~ TAVG, data = train)
lm.pred <- predict(lm.fit, test)

# Compute mean of predicted values
mean(grouse$SpeciesTotal)
mean(lm.pred)

# Fit multiple linear regression
lm.fit2 <- glm(SpeciesTotal ~ Obs_Temp + TAVG + EMNT + EMXT + PRCP + TMIN + TMAX, data = train)
lm.pred2 <- predict(lm.fit2, test)

# Compute mean prediction for multiple regression
summary(lm.fit2)
mean(lm.pred2)


# Fit multiple linear regression
lm.fit3 <- glm(SpeciesTotal ~ Obs_Temp + TAVG+ EMNT + TMIN, data = train)
lm.pred3 <- predict(lm.fit3, test)
summary(lm.fit3)
mean(lm.pred3)

lm.fit3 <- glm(SpeciesTotal ~ Obs_Temp + I(TAVG^2) + EMNT + TMIN, data = train)
lm.pred3 <- predict(lm.fit3, test)
summary(lm.fit3)
mean((lm.pred3 - test$SpeciesTotal)^2)
r2(lm.fit3)

cv.error <- cv.glm(grouse, glm(SpeciesTotal ~ Obs_Temp + I(TAVG^2) + EMNT + TMIN, data = grouse), K = 7)  
mean(cv.error$delta)
mean(grouse$SpeciesTotal)







# Warbler 

set.seed(42)
train_i <- sample(1:nrow(warbler), 0.7 * nrow(warbler))
train <- warbler[train_i, ]
test <- warbler[-train_i, ]

# Fit a simple linear regression model
lm.fit <- glm(SpeciesTotal ~ TAVG, data = train)
lm.pred <- predict(lm.fit, test)

# Compute mean of predicted values
summary(lm.fit)
mean(warbler$SpeciesTotal)
mean(lm.pred)

# Fit multiple linear regression
lm.fit2 <- glm(SpeciesTotal ~ TAVG + EMNT + PRCP + TMIN +
               I(TAVG^2) + I(EMXT^2) + I(PRCP^2) + I(TMIN^2), data = train)
lm.pred2 <- predict(lm.fit2, test)
summary(lm.fit2)
mean((lm.pred2 - test$SpeciesTotal)^2)
r2(lm.fit2)

cv.err <- cv.glm(warbler, glm(SpeciesTotal ~ TAVG + EMNT + PRCP + TMIN +
                 I(TAVG^2) + I(EMXT^2) + I(PRCP^2) + I(TMIN^2), data = warbler), K = 8)
mean(cv.err$delta)
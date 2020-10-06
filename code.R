geochem_ap <- read.delim2("~/Rconsole/Apatita_Data_Analysis/geochem_ap.csv")
install.packages("ggplot2")
library(ggplot2)
attach(geochem_mag)

#Boxplots
qplot(Nature, F_pct, data=geochem_ap, geom="boxplot")
qplot(CL, Eu_ppm, data=geochem_ap, geom="boxplot")
qplot(Deposit, Mn_pct, data=geochem_ap, geom="boxplot")

qplot(CL, SumLREE, data=geochem_ap, geom="boxplot", colour=Sample) #apatite
qplot(Nature, Al_ppm, data=geochem_mag, geom="boxplot", colour=Deposit) #magnetite

attach(plu)
tapply(Fe_pct,list(Deposit,Nature),median,na.rm=TRUE) #Median for individual deposits
quantile(plu$Fe_pct,na.rm=TRUE)


#Removing Mg outliers
outliers <- boxplot(geochem_ap$Mg_ppm)$out # You can get the actual values of the outliers with this
print(outliers)
outap_Mg <- geochem_ap[-which(geochem_ap$Mg_ppm %in% outliers),]
qplot(Zone, Mg_ppm, data=outap_Mg, geom="boxplot", colour=Deposit)

#Removing Sr outliers
outliers <- boxplot(geochem_ap$Sr_ppm)$out # You can get the actual values of the outliers with this
print(outliers)
outap_Sr <- geochem_ap[-which(geochem_ap$Sr_ppm %in% outliers),]
qplot(Zone, Sr_ppm, data=outap_Sr, geom="boxplot", colour=Deposit)

#Removing Ba outliers
outliers <- boxplot(geochem_ap$Ba_ppm)$out # You can get the actual values of the outliers with this
print(outliers)
outap_Ba <- geochem_ap[-which(geochem_ap$Ba_ppm %in% outliers),]
qplot(Zone, Ba_ppm, data=outap_Ba, geom="boxplot", colour=Deposit)

#Removing Pb outliers
outliers <- boxplot(geochem_ap$Pb_ppm)$out
print(outliers)
outap_Pb <- geochem_ap[-which(geochem_ap$Pb_ppm %in% outliers),]
qplot(Zone, Pb_ppm, data=outap_Pb, geom="boxplot", colour=Deposit)

#Removing Ti outliers
outliers <- boxplot(geochem_ap$Ti_ppm)$out
print(outliers)
outap_Ti <- geochem_ap[-which(geochem_ap$Ti_ppm %in% outliers),]
qplot(Zone, Ti_ppm, data=outap_Ti, geom="boxplot", colour=Deposit)

#Removing V outliers
outliers <- boxplot(geochem_ap$V_ppm)$out
print(outliers)
outap_V <- geochem_ap[-which(geochem_ap$V_ppm %in% outliers),]
qplot(Zone, V_ppm, data=outap_V, geom="boxplot", colour=Deposit)

#Removing As outliers
outliers <- boxplot(geochem_ap$As_ppm)$out
print(outliers)
outap_As <- geochem_ap[-which(geochem_ap$As_ppm %in% outliers),]
qplot(Zone, As_ppm, data=outap_As, geom="boxplot", colour=Deposit)


#Removing more outliers
outliers <- boxplot(out$Ba_ppm)$out # You can get the actual values of the outliers with this
print(outliers)
out <- out[-which(out$Ba_ppm %in% outliers),]
qplot(Nature, F_pct, data=out, geom="boxplot", colour=CL)
qplot(Cl_pct, F_pct, data=geochem_ap, colour=Deposit)
qplot(La_ppm, Sm_ppm, data=geochem_ap, colour=CL)

  #3d plotting -- tutorial at http://www.sthda.com/english/wiki/impressive-package-for-3d-and-4d-graph-r-software-and-data-visualization
install.packages("plot3D")
library("plot3D")
# x, y and z coordinates
x <- Mn <- geochem_ap$Y_ppm
y <- Yb <- geochem_ap$Yb_ppm
z <- Lu <- geochem_ap$La_ppm
scatter3D(x, y, z, colvar = z, xlab ="Y", ylab="Yb", zlab="La",
          theta = 40, phi = 40,
          ticktype="detailed", col = NULL, add = FALSE) #theta is azimuth, phi is co-latitude
scatter3D(x, y, z, colvar = NULL, col = "blue",
          pch = 19, cex = 0.5) #changes point colors, shapes, sizes
text3D(x, y, z, labels, colvar = NULL, add = FALSE)
points3D(x, y, z)
lines3D(x, y, z)
scatter2D(x, y, colvar = NULL, col = NULL, add = FALSE)
text2D(x, y, labels, colvar = NULL, col = NULL, add = FALSE)

# Create his3D using plot3D
his3D_fancy(out$Mn_ppm, out$Yb_ppm, out$Lu_ppm, colvar=as.numeric(out$Nature))
# Make the rgl version
install.packages("plot3Drgl")
library("plot3Drgl")
plotrgl()

#Regression plane
fit <- lm(z ~ x + y)
# predict values on regular xy grid
grid.lines = 26
x.pred <- seq(0, 3000, length.out = grid.lines)
y.pred <- seq(0, 500, length.out = grid.lines)
xy <- expand.grid( x = x.pred, y = y.pred)
z.pred <- matrix(predict(fit, newdata=xy), 
                 nrow = grid.lines, ncol = grid.lines)

fitpoints <- predict(fit)

scatter3D(x, y, z, pch = 18, cex = 2, 
          theta = 20, phi = 20, ticktype = "detailed",
          xlab = "Mn", ylab = "Yb", zlab = "Lu",  
          surf = list(x = x.pred, y = y.pred, z = z.pred,  
                      facets = NA))

#Harkers
pairs(~Mn_ppm +	Sr_ppm +	Th232_ppm +	U238_ppm, 
      geochem_ap)
#Most interesting: Mn-La, Mn-Eu, La-Ce, La-Eu
qplot(V_ppm, Pb_ppm, data=geochem_ap, colour=Deposit)
qplot(log(Yb_ppm), log(Pb_ppm), data=geochem_ap, colour=Deposit)

#Know summary on the basis of factor levels / remove NA values

median <- aggregate(geochem_ap[,c(5,9,10,11,17,18,19,22,23,24,25,26,27,28,29,30,
                        31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,
                        46,47,48,49,50,51,52,53,54)],
          by=list(Deposit),median,na.rm=T)

#Export table
write.table(median, file="apatite_median_deposit.csv", row.names=F, sep=",")

#overall median apatite
summary <- summary(geochem_ap)
write.table(summary, file="apatite_summary.csv", row.names=F, sep=",")


install.packages("pls") #forPCA
library (pls)

# log transform is advisable
log.ap <- log(pca)

sum(is.na(geochem_ap$P_pct)) #how many NA
names(geochem_ap)
pca <- geochem_ap[,c(25,31,32,36,37,41,44,48,52,53,54)] #Take out columns
pca = na.omit(pca)
dim(pca)
pr.out =prcomp (pca, center=TRUE,scale =TRUE)

biplot(pr.out,scale=0)

summary(pr.out)
plot(pr.out,main="") #scree plot

pr.out$center
pr.out$scale
pr.out$rotation
pr.out$sdev
pr.var =pr.out$sdev ^2 #variance
pr.var
pve=pr.var/sum(pr.var ) #proportion of variance
pve

#elaborated scree plot
plot(pve , xlab=" Principal Component ", ylab=" Proportion of Variance Explained ", 
     ylim=c(0,1) ,type='b')
plot(cumsum (pve ), xlab=" Principal Component ", 
     ylab ="Cumulative Proportion of Variance Explained ", ylim=c(0,1) ,
       type='b') #cumsum() computes the cumulative sum of the elements of a numeric vector.

#Design PCA biplot
install.packages("devtools")
library(devtools)
install_github("ggbiplot", "vqv")


#Linear Regression
library(MASS)
install.packages("ISLR")
library(ISLR)
names(geochem_ap)
attach(geochem_ap)
lm.fit =lm(Mn_ppm~Sr_ppm +	Y_ppm	+ La_ppm +	Ce_ppm + Pr_ppm +
             Nd_ppm + Sm_ppm + Eu_ppm +	Gd_ppm + Tb_ppm + Dy_ppm +	
             Ho_ppm + Er_ppm + Tm_ppm + Yb_ppm	+	Lu_ppm + Pb_ppm +	
             Th232_ppm +	U238_ppm,data=geochem_ap)
summary(lm.fit)
summary(lm.fit)$r.sq #gives the R²
summary(lm.fit)$sigma #RSE
names(lm.fit)
coef(lm.fit)
confint (lm.fit) #confidence intervals
plot(Mn_ppm, La_ppm)
abline(lm.fit)

#compute variance inflation factors
install.packages("car")
library (car)
vif(lm.fit)

#split screen
par(mfrow =c(2,2))
plot(lm.fit)
plot(predict (lm.fit), residuals (lm.fit))
plot(predict (lm.fit), rstudent (lm.fit))

#regularization
install.packages("glmnet")
library (glmnet)
x=model.matrix (Ca_pct∼.,reg )[,-1] #predict element
y=reg$Ca_pct
grid =10^ seq (10,-2, length =100)

#ridge regression
ridge.mod =glmnet (x,y,alpha=0, lambda =grid)
dim(coef(ridge.mod ))
coef(ridge.mod)
ridge.mod$lambda [50]
coef(ridge.mod)[,50]
sqrt(sum(coef(ridge.mod)[ -1 ,50]^2) )
ridge.mod$lambda [60] #coefficients when lambda=705
coef(ridge.mod)[,60]
sqrt(sum(coef(ridge.mod)[ -1 ,60]^2) ) #smaller the lambda, the higher the l2
predict (ridge.mod ,s=50, type ="coefficients")[1:20 ,]

#Ramdomly split dataset
set.seed (1)
train=sample (1: nrow(x), nrow(x)/2)
test=(- train )
y.test=y[test]
#Fit ridge regression into training dataset
ridge.mod=glmnet (x[train ,],y[train],alpha =0, lambda =grid ,
                  thresh=1e-12)
ridge.pred=predict (ridge.mod ,s=4, newx=x[test ,]) #using lambda=4 
mean(( ridge.pred -y.test)^2) #test MSE
mean(( mean(y[train ])-y.test)^2)
ridge.pred=predict (ridge.mod ,s=1e10 ,newx=x[test ,]) #1e10 means 10^10
mean(( ridge.pred -y.test)^2) 
#So, lambda=4 gives much lower test MSE than fitting a model with just an intercept

#Instead of artitrarily choose lambda=4, we use cross-validation to choose lambda
set.seed (1)
cv.out =cv.glmnet (x[train ,],y[train],alpha =0) #cross-validation function
plot(cv.out)
bestlam=cv.out$lambda.min
bestlam  #we see that value of lambda that offers the least MSE is...

#So, we use that to improve MSE
ridge.pred=predict(ridge.mod ,s=bestlam ,newx=x[test ,])
mean(( ridge.pred -y.test)^2)

#finally, we refit our ridge regression on the full data set
out=glmnet (x,y,alpha =0)
predict (out ,type="coefficients",s=bestlam )[1:50 ,]


#let's do the lasso
lasso.mod =glmnet (x[train ,],y[train],alpha =1, lambda =grid)
plot(lasso.mod)

set.seed (1)
cv.out =cv.glmnet (x[train ,],y[train],alpha =1)
plot(cv.out)
bestlam =cv.out$lambda.min
lasso.pred=predict (lasso.mod ,s=bestlam ,newx=x[test ,])
mean(( lasso.pred -y.test)^2) #is it substantially lower than ridge regression?

#which coefs are zero?
out=glmnet (x,y,alpha =1, lambda =grid)
lasso.coef=predict (out ,type ="coefficients",s=bestlam )
lasso.coef

geochem_ap <- read.delim2("~/Rconsole/Apatita_Data_Analysis/geochem_ap.csv")
install.packages("ggplot2")
library(ggplot2)
attach(geochem_ap)
geochem_ap <- geochem_ap[-c(11),]
geochem_ap_tp <- geochem_ap[-c(31:39),]
levels(geochem_ap_tp$Class)
geochem_ap_tp$Class <- factor(geochem_ap_tp$Class, 
                              levels=c("Teles Pires Intrusive Suite",
                                        "Francisco deposit",
                                        "Luizão deposit", 
                                        "Pé Quente deposit (type 1)", 
                                        "Pé Quente deposit (type 2)",
                                        "Pé Quente deposit (type 3)",
                                        "X1 deposit"))
levels(geochem_ap_tp$Class)

#wholesome boxplot
library(reshape2)
box.ap <- melt(geochem_ap_tp, id.vars='Class', measure.vars=c("Mg_ppm","Mn_ppm", "Ge_ppm", "Sr_ppm", "SumLREE", "Eu_ppm", "SumHREE", "Pb_ppm", "Th232_ppm", "U238_ppm"))
ggplot(box.ap) + geom_boxplot(aes(x=variable, y=value, colour=Class)) + 
  scale_y_log10() + annotation_logticks(sides="lb") #+ theme(legend.position = "none")

#Boxplots
qplot(Nature, Mn_ppm, data=geochem_ap, log="y", geom="boxplot")
qplot(Sample, Y_ppm, data=geochem_ap, geom="boxplot", colour=Zone, ylab="V (ppm)")
qplot(Deposit, Na_pct, data=geochem_ap, geom="boxplot", ylab="Na (wt. %)")

qplot(CL, (Mn_pct/(SumLREE+SumHREE+Eu_ppm+Y_ppm)), data=geochem_ap, geom="boxplot", colour=Deposit, 
      ylab="Mn ", xlab="") #apatite

qplot(Nature, Fe_ppm, data=mag, geom="boxplot", colour=Deposit,
      ylab="Fe (wt. %)", xlab="") #magnetite

qplot((Ca_pct)/40, (Si_pct)/28, data=geochem_mag, colour=Sample, shape=Nature,
      xlab="Ca (wt. %)/m.w.", ylab="Si (wt. %)/m.w.",
      xlim=c(0,0.0025), ylim=c(0,0.007))

qplot((Ca_pct)/40, (Si_pct)/28, data=mag, colour=Deposit, shape=Nature,
      xlab="Ca (wt. %)/m.w.", ylab="Si (wt. %)/m.w.",
      xlim=c(0,0.0025), ylim=c(0,0.007))

qplot((Ca_pct)/40, (Si_pct)/28, data=mag, colour=Deposit, shape=Nature,
      xlab="Ca (wt. %)/m.w.", ylab="Si (wt. %)/m.w.",
      xlim=c(0,0.0025), ylim=c(0,0.007))

#Eliminate X1
geochem_X1 <- geochem_mag[-c(1),]

#Eliminating plutonic Francisco
vc_fr <- geochem_mag[-c(17:30),]

ap_fr <-geochem_ap[-c(12),]

#Separating Pe Quente
pq <-geochem_mag[-c(1:10,17:30,55:65,85:98),]

#Separating Plutonic
plu <-geochem_mag[-c(93:115),]

#what exactly
plufr <- geochem_mag[-c(1,11:16,31:83,98:116),]

#Separating Francisco volcaniclastic
fr <- geochem_mag[-c(1:92),]


attach(vc_fr)
attach(ap_fr)
attach(geochem_ap)
attach(geochem_mag)
attach(fr)
attach(plu)
attach(out)
attach(pq)
tapply(V_ppm,list(Deposit,Zone),median,na.rm=TRUE)
summary(geochem_mag$W_ppm,list(Sample),na.rm=TRUE)
quantile(plu$Fe_pct,na.rm=TRUE)


#Making plots
install.packages("cowplot")
library(cowplot)
library(ggplot2)
library(grid)

require(ggplot2);require(gridExtra)

theme_set(theme_minimal())

#Apatite pg1
give.n <- function(x){return(c(y = mean(x), label = length(x)))}


p11 <- qplot(Zone, Ca_pct, data=geochem_ap, geom="boxplot", colour=Class, ylab="Ca (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p21 <- qplot(Zone, P_pct, data=geochem_ap, geom="boxplot", colour=Class, ylab="P (wt. %)") + 
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")
         
p31 <- qplot(Zone, Cl_pct, data=geochem_ap, geom="boxplot", colour=Class, ylab="Cl (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p41 <- qplot(Zone, F_pct, data=geochem_ap, geom="boxplot", colour=Class, ylab="F (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p51 <- qplot(Zone, Na_pct, data=geochem_ap, geom="boxplot", colour=Class, ylab="Na (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")
   
p61 <- qplot(Zone, Si_pct, data=geochem_ap, geom="boxplot", colour=Class, ylab="Si (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p71 <- qplot(Zone, Mg_ppm, data=outap_Mg, geom="boxplot", colour=Class, ylab="Mg (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p81 <- qplot(Zone, Mn_ppm, data=geochem_ap, geom="boxplot", colour=Class, ylab="Mn (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p91 <- qplot(Zone, Sr_ppm, data=outap_Sr, geom="boxplot", colour=Class, ylab="Sr (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p101 <- qplot(Zone, Ba_ppm, data=outap_Ba, geom="boxplot", colour=Class, ylab="Ba (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p111 <- qplot(Zone, Pb_ppm, data=outap_Pb, geom="boxplot", colour=Class, ylab="Pb (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p112 <- qplot(Zone, Ba_ppm, data=outap_Ba, geom="boxplot", colour=Class, ylab="Ba (ppm)")

#Apatite pg2

p121 <- qplot(Zone, Ti_ppm, data=outap_Ti, geom="boxplot", colour=Class, ylab="Ti (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p131 <- qplot(Zone, Fe_pct, data=geochem_ap, geom="boxplot", colour=Class, ylab="Fe (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p141 <- qplot(Zone, SumLREE, data=geochem_ap, geom="boxplot", colour=Class, ylab="LREE (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p151 <- qplot(Zone, SumHREE, data=geochem_ap, geom="boxplot", colour=Class, ylab="HREE (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p161 <- qplot(Zone, Eu_ppm, data=geochem_ap, geom="boxplot", colour=Class, ylab="Eu (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p171 <- qplot(Zone, Y_ppm, data=geochem_ap, geom="boxplot", colour=Class, ylab="Y (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p181 <- qplot(Zone, V_ppm, data=outap_V, geom="boxplot", colour=Class, ylab="V (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p191 <- qplot(Zone, As_ppm, data=outap_As, geom="boxplot", colour=Class, ylab="As (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p201 <- qplot(Zone, Th232_ppm, data=geochem_ap, geom="boxplot", colour=Class, ylab="Th (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p211 <- qplot(Zone, U238_ppm.1, data=geochem_ap, geom="boxplot", colour=Class, ylab="U (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p221 <- qplot(Zone, Ge_ppm, data=geochem_ap, geom="boxplot", colour=Class, ylab="Ge (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

p231 <- qplot(Zone, Ge_ppm, data=geochem_ap, geom="boxplot", colour=Class, ylab="Ge (ppm)")

#Magnetite pg1

q11 <- qplot(Zone, Fe_pct, data=plu, geom="boxplot", colour=Deposit, ylab="Fe (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q21 <- qplot(Zone, Ti_pct, data=plu, geom="boxplot", colour=Deposit, ylab="Ti (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q31 <- qplot(Zone, Al_pct, data=plu, geom="boxplot", colour=Deposit, ylab="Al (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q41 <- qplot(Zone, Na_pct, data=plu, geom="boxplot", colour=Deposit, ylab="Na (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q51 <- qplot(Zone, Si_pct, data=plu, geom="boxplot", colour=Deposit, ylab="Si (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q61 <- qplot(Zone, Ca_pct, data=plu, geom="boxplot", colour=Deposit, ylab="Ca (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q71 <- qplot(Zone, K_pct, data=plu, geom="boxplot", colour=Deposit, ylab="K (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q81 <- qplot(Zone, Mn_pct, data=plu, geom="boxplot", colour=Deposit, ylab="Mn (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q91 <- qplot(Zone, Mg_ppm, data=plu, geom="boxplot", colour=Deposit, ylab="Mg (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q101 <- qplot(Zone, Co_ppm, data=plu, geom="boxplot", colour=Deposit, ylab="Co (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q111 <- qplot(Zone, Ni_ppm, data=plu, geom="boxplot", colour=Deposit, ylab="Ni (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q112 <- qplot(Zone, Ni_ppm, data=plu, geom="boxplot", colour=Deposit, ylab="Ni (ppm)") 


#Magnetite pg2

q121 <- qplot(Zone, Ga_ppm, data=plu, geom="boxplot", colour=Deposit, ylab="Ga (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q131 <- qplot(Zone, Cr_ppm, data=plu, geom="boxplot", colour=Deposit, ylab="Cr (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q141 <- qplot(Zone, Zn_ppm, data=plu, geom="boxplot", colour=Deposit, ylab="Zn (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q151 <- qplot(Zone, Pb_ppm, data=plu, geom="boxplot", colour=Deposit, ylab="Pb (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q161 <- qplot(Zone, Sn_ppm, data=plu, geom="boxplot", colour=Deposit, ylab="Sn (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q171 <- qplot(Zone, Ba_ppm, data=plu, geom="boxplot", colour=Deposit, ylab="Ba (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q181 <- qplot(Zone, Se_ppm, data=plu, geom="boxplot", colour=Deposit, ylab="Se (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

q191 <- qplot(Zone, Zr_ppm, data=plu, geom="boxplot", colour=Deposit, ylab="Zr (ppm)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

#Magnetite vulcaniclastic

r1 <- qplot(Zone, Fe_pct, data=fr, geom="boxplot", colour=Deposit, ylab="Fe (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

r2 <- qplot(Zone, Ti_pct, data=fr, geom="boxplot", colour=Deposit, ylab="Ti (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

r3 <- qplot(Zone, Al_pct, data=fr, geom="boxplot", colour=Deposit, ylab="Al (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

r4 <- qplot(Zone, Na_pct, data=fr, geom="boxplot", colour=Deposit, ylab="Na (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

r5 <- qplot(Zone, Si_pct, data=fr, geom="boxplot", colour=Deposit, ylab="Si (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

r6 <- qplot(Zone, Ca_pct, data=fr, geom="boxplot", colour=Deposit, ylab="Ca (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

r7 <- qplot(Zone, K_pct, data=fr, geom="boxplot", colour=Deposit, ylab="K (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

r8 <- qplot(Zone, Mg_pct, data=fr, geom="boxplot", colour=Deposit, ylab="Mg (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

r9 <- qplot(Zone, Ni_pct, data=fr, geom="boxplot", colour=Deposit, ylab="Ni (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

r10 <- qplot(Zone, Cr_pct, data=fr, geom="boxplot", colour=Deposit, ylab="Cr (wt. %)") +
   theme(legend.position = "none") + stat_summary(fun.data = give.n, geom = "text")

multiplot <- align_plots(p1,p2,p3,p4,p5,p6, align = "hv", greedy=FALSE)

library(gtable)

#Deposit
grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, nrow = 4)

grid.arrange(p12, p13, p14, p16, p15, p17, p18, p19, p20, p21, p22, nrow = 4)

grid.arrange(q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, nrow = 4)

grid.arrange(q12, q13, q14, q15, q16, q17, q18, q19, nrow = 3)


#Correct for outliers: data=outap_Ti
#Sample
grid.arrange(p11, p21, p31, p41, p51, p61, p71, p81, p91, p101, p111, p112, nrow = 4)

grid.arrange(p121, p131, p141, p161, p151, p171, p181, p191, p201, p211, p221, p231, nrow = 4)

grid.arrange(q11, q21, q31, q41, q51, q61, q71, q81, q91, q101, q111, q112, nrow = 4)

grid.arrange(q121, q131, q141, q151, q161, q171, q181, q191, nrow = 3)


#Volcaniclastic
grid.arrange(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, nrow = 2)


gdraw() + draw_grob(multiplot[[1]], 0,0.5,.5,.5) +
   draw_grob(multiplot[[2]], 0.5,0.5,0.5,0.5) + 
   draw_grob(multiplot[[3]], 0, 0.3, 0.5,0.5) +
   draw_grob(multiplot[[4]], 0.3, 0.25, 0.5, 0.5) +
   draw_grob(multiplot[[5]], 0,0.004, 0.5, 0.5) +
   draw_grob(multiplot[[6]], 0.3,0.004,0.5,0.5) +
   theme_minimal()

gA <- ggplot_gtable(ggplot_build(p1))
gB <- ggplot_gtable(ggplot_build(p2))
maxWidth = grid::unit.pmax(gA$widths[2:3], gB$widths[2:3])
gA$widths[2:3] <- as.list(maxWidth)
gB$widths[2:3] <- as.list(maxWidth)
grid.arrange(gA, gB, ncol=1) + theme_minimal()



#Removing outliers
outliers <- boxplot(geochem_mag$Mg_pct)$out # You can get the actual values of the outliers with this
print(outliers)
outmag_Mg <- geochem_mag[-which(geochem_mag$Mg_pct %in% outliers),]
qplot(Zone, Mg_pct, data=outmag_Mg, geom="boxplot", colour=Deposit, ylab="Mg (wt%)")
attach(out)
qplot(As_ppm, P_pct, data=out, colour=Nature)

#Removing more outliers
outliers <- boxplot(out$Fe_pct)$out # You can get the actual values of the outliers with this
print(outliers)
out <- out[-which(out$Fe_pct %in% outliers),]
qplot(Zone, Fe_pct, data=out, geom="boxplot", colour=CL, ylab="Fe (wt. %)")
qplot(Cl_pct, F_pct, data=geochem_ap, colour=Deposit)
fcl <- qplot(Cl_pct, F_pct/Cl_pct, data=geochem_ap, colour=Deposit) 
fcl + scale_y_log10() + scale_x_log10()
qplot(La_ppm, Sm_ppm, data=geochem_ap, colour=CL) #apatite
qplot((Ni_pct)/(Cr_pct),Ti_pct, data=geochem_mag, colour=Nature) #magnetite

#recreating those discriminating plots NOT GOOD
library(scales)
p2 <- ggplot(geochem_mag, 
             aes(x = Ti_pct+V_ppm/10000, y = Al_pct+Mn_pct,colour=Deposit)) + geom_point()
p2 + scale_y_log10() +scale_x_log10()
p2
p2 + annotation_logticks() 

#3d plotting -- tutorial at http://www.sthda.com/english/wiki/impressive-package-for-3d-and-4d-graph-r-software-and-data-visualization
install.packages("plot3D")
library("plot3D")
# x, y and z coordinates
x <- Y <- geochem_ap$Y_ppm
y <- Yb <- geochem_ap$Yb_ppm
z <- Dy <- geochem_ap$Dy_ppm
scatter3D(x, y, z, colvar = z, xlab ="Y", ylab="Yb", zlab="Dy",
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
qplot(Mn_ppm, Lu_ppm, data=geochem_ap, colour=Zone,
      xlab="Mn (ppm)", ylab="Lu (ppm)")
qplot(log(Yb_ppm), log(Pb_ppm), data=geochem_ap, colour=Deposit)

qplot(Ca42_ppm, Si_ppm, data=mag, colour=Deposit, shape=Nature)

#Know summary on the basis of factor levels / remove NA values
#apatite
setwd("C:/Users/Pedro/Documents/Rconsole/Apatita_Data_Analysis/")
attach(geochem_ap)
median <- aggregate(geochem_ap[,c(5,9,10,11,17,18,19,22,23,24,25,26,27,28,29,30,
                        31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,
                        46,47,48,49,50,51,52,53,54)],
          by=list(Deposit),median,na.rm=T)

#Export table
write.table(median, file="apatite_median_deposit.csv", row.names=F, sep=",")

#overall median apatite
summary <- summary(geochem_ap)
write.table(summary, file="apatite_summary.csv", row.names=F, sep=",")

#for magnetite now
attach(geochem_mag)
setwd("C:/Users/Pedro/Documents/Rconsole/Apatita_Data_Analysis/")
median_mag <- aggregate(geochem_mag[,c(4,5,6,7,8,9,10,11,12,13,14,15,21,25,27,31,
                                  33,34,35,36,37,38,39,40,41,42,43,44,45,46,
                                  47,48,49,50,51,52,53,54,55,56,57,58,59,60,
                                  61,62,63,64,65,66,67)],
                    by=list(Nature),median,na.rm=T)
#Export table
write.table(median_mag, file="magnetite_median_nature.csv", row.names=F, sep=",")

#overall median magnetite
summary_mag <- summary(geochem_mag)
write.csv(summary_mag, file="magnetite_summary.csv", row.names=FALSE, sep=",")


install.packages("pls") #forPCA
library (pls)

# log transform is advisable
log.ap <- log(pca)

sum(is.na(geochem_ap$Fe_ppm)) #how many NA
names(geochem_ap)
pca <- geochem_ap[,c(4,25,31,32,36,37,41,44,48,52,53,54)] #Take columns in: Apatite
pca = na.omit(pca)
dim(pca)
pr.out = prcomp (pca, center=TRUE,scale =TRUE)
library(ggbiplot)
ggbiplot(pr.out,scale=0, data=pca)


#
install.packages("ggfortify")
library(ggfortify)
pca <- geochem_ap[,c(25,31,32,36,37,41,44,48,52,53,54)] #Take columns in: Apatite
pca_res <- prcomp(pca, scale = TRUE)

autoplot(pr.out)


#another
library(usethis)
install.packages("devtools")
library(devtools)
install_github("vqv/ggbiplot")
library(ggbiplot)
plot(pr.out, col = Deposit)

install.packages("tidyverse")


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
library(openxlsx)
library(reshape2)
library(plyr)
library(scales)
library(ggplot2)
library(devtools)
library(grid)

####################################### Works
install_github("vqv/ggbiplot", force = TRUE)

library(ggbiplot)
data(geochem_ap)
ap_pca <- prcomp(geochem_ap, scale. = TRUE)
ggbiplot(wine.pca, obs.scale = 1, var.scale = 1,
         groups = wine.class, ellipse = TRUE, circle = TRUE) +
   scale_color_discrete(name = '') +
   theme(legend.direction = 'horizontal', legend.position = 'top')

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
summary(lm.fit)$r.sq #gives the RÂ²
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
x=model.matrix (Ga_ppmâˆ¼.,reg )[,-1] #predict element
y=reg$Ga_ppm
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


#Add columns to database
library(GCDkit)
attach(geochem_ap)
names(geochem_ap)
x <- read.table("boynton.data",sep = ",") #REE normalised values
SumLREE <- (geochem_ap[,"La_ppm"]+geochem_ap[,"Ce_ppm"]+geochem_ap[,"Pr_ppm"]+
              geochem_ap[,"Nd_ppm"]+geochem_ap[,"Sm_ppm"])
SumHREE <- (geochem_ap[,"Gd_ppm"]+geochem_ap[,"Tb_ppm"]+geochem_ap[,"Dy_ppm"]+
              geochem_ap[,"Ho_ppm"]+geochem_ap[,"Er_ppm"]+geochem_ap[,"Tm_ppm"]+
              geochem_ap[,"Yb_ppm"]+geochem_ap[,"Lu_ppm"])
LaSm <- ((geochem_ap[,"La_ppm"]/0.237)/(geochem_ap[,"Sm_ppm"]/0.148))
eueu <- ((geochem_ap[,"Eu_ppm"]/0.0563)*
           (((geochem_ap[,"Sm_ppm"]/0.148)*(geochem_ap[,"Gd_ppm"]/0.199)))^-0.5)
cece <- ((geochem_ap[,"Ce_ppm"]/0.613)*
           (((geochem_ap[,"La_ppm"]/0.237)*(geochem_ap[,"Pr_ppm"]/0.0928)))^-0.5)
F_ppm <- (geochem_ap[,"F_pct"]*10000)
Cl_ppm <- (geochem_ap[,"Cl_pct"]*10000)
Ca_ppm2 <- (geochem_ap[,"Ca_pct"]*10000)
P_ppm2 <- (geochem_ap[,"P_pct"]*10000)


geochem_ap$SumLREE=SumLREE
geochem_ap$SumHREE=SumHREE
geochem_ap$LaSm=LaSm
geochem_ap$eueu=eueu
geochem_ap$cece=cece
geochem_ap$F_ppm=F_ppm
geochem_ap$Cl_ppm=Cl_ppm
geochem_ap$Ca_ppm2=Ca_ppm2
geochem_ap$P_ppm2=P_ppm2


#Sr/Y ratio
SrY <- (geochem_ap[,"Sr_ppm"]/geochem_ap[,"Y_ppm"])
geochem_ap$SrY=SrY

#Fe+Ti magnetite
names(geochem_mag)
FeTi <- (mag[,"Fe_pct"]+mag[,"Ti_pct"])
mag$FeTi=FeTi

AlN <- (mag[,"Al_pct"]/mag[,"FeTi"])
qplot(Nature, AlN, data=mag, geom="boxplot", colour=Deposit,
      ylab="Al/Fe+Ti", xlab="") #magnetite

CrN <- (mag[,"Cr_pct"]/mag[,"FeTi"])
mag$CrN=CrN
qplot(Nature, CrN, data=out, geom="boxplot", colour=Deposit,
      ylab="Cr/Fe+Ti", xlab="") #magnetite

VN <- (mag[,"V_ppm"]/mag[,"FeTi"])
mag$VN=VN
qplot(Nature, VN, data=mag, geom="boxplot", colour=Deposit,
      ylab="Cr/Fe+Ti", xlab="") #magnetite

MgN <- (mag[,"Mg_pct"]/mag[,"FeTi"])
mag$MgN=MgN
qplot(Nature, Mg_pct, data=out, geom="boxplot", colour=Deposit,
      ylab="Mg/Fe+Ti", xlab="") #magnetite


names(geochem_ap)
attach(fr)
qplot(Nature, Fe_pct,data=fr, geom="boxplot", colour=Deposit)
tapply(Na_pct,list(Nature,Deposit),median,na.rm=TRUE) #Median for individual deposits
quantile(geochem_ap$SumHREE,na.rm=TRUE)
qplot(Ca_pct, SumLREE, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Ca (wt. %)", ylab="LREE (ppm)")

qplot(cece, eueu, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Ce/Ce**", ylab="Eu/Eu*", xlim=c(0.5,1.5), ylim=c(0,1.3))

qplot(Eu_ppm, Mn_ppm, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Eu (ppm)", ylab="Mn (ppm)")

qplot(LaSm, eueu, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="(La/Sm)N", ylab="Eu/Eu*",  ylim=c(0,1.3))



#compositional data
install.packages("compositions")
library(compositions)
attach(geochem_mag)
names(geochem_mag)
clo_mag <- acomp(geochem_mag[,6:69])
clo_mag <- data.frame(clo_mag)
clo_vcfr <- acomp(vc_fr[,4:67])


qplot(Mg_pct, Mg_ppm, data=geochem_mag, colour=Deposit, shape=Zone,
      xlab="Mg (EMPA)", ylab="Mg (LA-ICP-MS)")

#LA-ICP-MS vs. EMPA
#Apatite
u1 <- qplot((Si_pct), (Si_ppm*0.0001), data=geochem_ap, colour=Deposit, shape=Zone,
            xlab="Si (wt. %) - EMPA", ylab="Si (wt. %) - LA-ICP-MS",
            xlim=c(0,1), ylim=c(0,1)) 
u2 <- qplot((Fe_pct), (Fe_ppm*0.0001), data=geochem_ap, colour=Deposit, shape=Zone,
            xlab="Ca (wt. %) - EMPA", ylab="Ca (wt. %) - LA-ICP-MS",
            xlim=c(0,0.5), ylim=c(0,0.5))
u3 <- qplot((Mn_pct), (Mn_ppm*0.0001), data=geochem_ap, colour=Deposit, shape=Zone,
            xlab="Mn (wt. %) - EMPA", ylab="Mn (wt. %) - LA-ICP-MS",
            xlim=c(0,1.2), ylim=c(0,1.2))

u4 <- qplot((Ce_pct), (Ce_ppm*0.0001), data=geochem_ap, colour=Deposit, shape=Zone,
            xlab="Ce (wt. %) - EMPA", ylab="Ce (wt. %) - LA-ICP-MS",
            xlim=c(0,0.7), ylim=c(0,0.7))
u5 <- qplot((La_pct), (La_ppm*0.0001), data=geochem_ap, colour=Deposit, shape=Zone,
            xlab="La (wt. %) - EMPA", ylab="La (wt. %) - LA-ICP-MS",
            xlim=c(0,0.3), ylim=c(0,0.3))
u6 <- qplot((Nd_pct), (Nd_ppm*0.0001), data=geochem_ap, colour=Deposit, shape=Zone,
            xlab="Nd (wt. %) - EMPA", ylab="Nd (wt. %) - LA-ICP-MS",
            xlim=c(0,0.4), ylim=c(0,0.4))

#Magnetite
v1 <- qplot((Al_pct), (Al_ppm*0.0001), data=plu, colour=Deposit, shape=Zone,
         xlab="Al (wt. %) - EMPA", ylab="Al (wt. %) - LA-ICP-MS",
         xlim=c(0,0.65), ylim=c(0,0.65))
v2 <- qplot((Si_pct), (Si_ppm*0.0001), data=plu, colour=Deposit, shape=Zone,
         xlab="Si (wt. %) - EMPA", ylab="Si (wt. %) - LA-ICP-MS",
         xlim=c(0,2), ylim=c(0,2))
v3 <- qplot((Mg_pct), (Mg_ppm*0.0001), data=plu, colour=Deposit, shape=Zone,
            xlab="Mg (wt. %) - EMPA", ylab="Mg (wt. %) - LA-ICP-MS",
            xlim=c(0,0.5), ylim=c(0,0.5))
v4 <- qplot((K_pct), (K_ppm*0.0001), data=plu, colour=Deposit, shape=Zone,
            xlab="K (wt. %) - EMPA", ylab="K (wt. %) - LA-ICP-MS",
            xlim=c(0,0.05), ylim=c(0,0.05))
v5 <- qplot((Ti_pct), (Ti_ppm*0.0001), data=plu, colour=Deposit, shape=Zone,
            xlab="Ti (wt. %) - EMPA", ylab="Ti (wt. %) - LA-ICP-MS",
            xlim=c(0,7.5), ylim=c(0,7.5))
v6 <- qplot((Mn_pct), (Mn_ppm*0.0001), data=plu, colour=Deposit, shape=Zone,
            xlab="Mn (wt. %) - EMPA", ylab="Mn (wt. %) - LA-ICP-MS",
            xlim=c(0,0.5), ylim=c(0,0.5))
v7 <- qplot((Ni_pct), (Ni_ppm*0.0001), data=plu, colour=Deposit, shape=Zone,
            xlab="Ni (wt. %) - EMPA", ylab="Ni (wt. %) - LA-ICP-MS",
            xlim=c(0,0.05), ylim=c(0,0.05))
v8 <- qplot((Cr_pct), (Cr_ppm*0.0001), data=plu, colour=Deposit, shape=Zone,
            xlab="Cr (wt. %) - EMPA", ylab="Cr (wt. %) - LA-ICP-MS",
            xlim=c(0,0.025), ylim=c(0,0.025))


library(gtable)

grid.arrange(u1, u2, u3, u4, u5, u6, nrow = 4)

grid.arrange(p12, p13, p14, p16, p15, p17, p18, p19, p20, p21, p22, nrow = 4)

grid.arrange(q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, nrow = 4)

grid.arrange(q12, q13, q14, q15, q16, q17, q18, q19, nrow = 3)

#Dupuis & Beaudoin
qplot((Si_pct+Mg_pct), (Ni_pct+Cr_pct), data=mag, colour=Deposit, shape=Nature,
      xlab="Si + Mg (wt. %).", ylab="Ni + Cr (wt. %)") +
   scale_x_log10() + scale_y_log10()

qplot((Cu_ppm*0.0001)/(Si_pct+Ca_pct), (Al_pct)/(Zn_ppm*0.0001+Ca_pct),
      data=mag, colour=Deposit, shape=Nature,
      xlab="Cu/(Si+Ca)", ylab="Al/(Zn+Ca)") +
   scale_x_log10() + scale_y_log10() + annotation_logticks(sides="lb")

qplot((Cu_ppm*0.0001)/(Si_pct+Ca_pct), (Al_pct)/(Zn_ppm*0.0001+Ca_pct),
      data=mag, colour=Deposit, shape=Nature,
      xlab="Cu/(Si+Ca)", ylab="Al/(Zn+Ca)") +
   scale_x_log10() + scale_y_log10()

qplot((Ti_pct), (Ca_pct+Al_pct+Mn_pct),
           data=geochem_mag, colour=Zone, shape=Deposit,
           xlab="Ti + V (wt. %)", ylab="Ca + Al + Mn (wt. %)") +
         scale_x_log10() + scale_y_log10() +
         theme(legend.position = "none")

dupuis_fr <- qplot((Ti_pct), (Ca_pct+Al_pct+Mn_pct),
      data=fr, colour=Zone, shape=Deposit,
      xlab="Ti + V (wt. %)", ylab="Ca + Al + Mn (wt. %)") +
   scale_x_log10() + scale_y_log10() + 
   theme(legend.position = "none")


#p + scale_x_continuous(trans = 'log10') + 
   scale_y_continuous(trans = 'log10') #+
   annotation_logticks(sides="lb")

#Dare
dare_fr <- qplot((Ni_pct/Cr_pct), Ti_pct*10000, 
                 data=fr, colour=Zone, shape=Deposit,
      xlab="Ni/Cr", ylab="Ti (wt. %)",
      xlim=c(0.01,1000000), ylim=c(1,10000))+
   scale_x_log10() + scale_y_log10() +
   theme(legend.position = "none")

   
   dare_fr2 <- qplot((Ni_pct/Cr_pct), Ti_pct*10000, 
                     data=fr, colour=Zone, shape=Deposit,
                    xlab="Ni/Cr", ylab="Ti (wt. %)",
                    xlim=c(0.01,1000000), ylim=c(1,10000))+
      scale_x_log10() + scale_y_log10()


grid.arrange(dupuis_fr, dare_fr, dare_fr2, nrow = 1)   
   

#Magnetite diagram
qplot((Ni_ppm/Cr_ppm), Ti_pct, data=pq, 
      colour=Nature,
      xlab="Ni/Cr", ylab="Ti (wt. %)") +
   scale_x_log10() + scale_y_log10()

qplot((Ni_pct/Cr_pct), Ti_pct, data=fr, 
      colour=Nature,
      xlab="Ni/Cr", ylab="Ti (wt. %)") +
   scale_x_log10() + scale_y_log10()

#LDA & PCA

sum(is.na(geochem_ap$Pb)) #how many NA
names(geochem_ap)
ap_lda <- geochem_ap[,c(3,14,32,33,37,38,39,40,41,42,43,44,45,46,47,48,49,50)] #Take columns in
ap_lda = na.omit(ap_lda)
dim(pca)

library (MASS)
require(scales)
install.packages("gridExtra")
require(gridExtra)

devtools::install_github('cran/ggplot2')
lda= lda(Nature~Mn_pct + Sr_ppm +	Y_ppm	+ La_ppm +	Ce_ppm + Pr_ppm +
                         Nd_ppm + Sm_ppm + Eu_ppm +	Gd_ppm + Tb_ppm + Dy_ppm +	
                         Ho_ppm + Er_ppm + Tm_ppm + Yb_ppm	+	Lu_ppm,
             data=ap_lda, subset=train)
lda
par("mar")
par(mar=c(1,1,1,1))
biplot(lda) 

prop.lda = lda$svd^2/sum(lda$svd^2)

plda <- predict(object = lda,
                newdata = ap_lda)

dataset = data.frame(Nature = ap_lda[,"Nature"],
                     lda = plda$x)

p1 <- ggplot(dataset) + geom_point(aes(lda.LD1, lda.LD2, colour = Nature, shape = Nature), size = 2.5) + 
   labs(x = paste("LD1 (", percent(prop.lda[1]), ")", sep=""),
        y = paste("LD2 (", percent(prop.lda[2]), ")", sep=""))
p1

grid.arrange(p1) #save


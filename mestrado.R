install.packages("cowplot")
install.packages("ggplot2")
library(cowplot)
library(compositions)
library(ggplot2)
library(grid)
library(gtable)
library(ggbiplot)

require(ggplot2);require(gridExtra)

theme_set(theme_classic())


#Apatite

apdis1<- qplot(Ca_ppm*0.0001, (SumLREE+SumHREE+Eu_ppm+Y_ppm)*0.0001, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Ca (wt. %)", ylab="REE+Y (wt. %)") +
  theme(legend.position = "none")
apdis2<- qplot(Ca_ppm*0.0001, Mn_ppm*0.0001+((Sr_ppm+SumLREE+SumHREE+Eu_ppm+Y_ppm+Pb_ppm+Th232_ppm+U238_ppm)*0.0001), 
      data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Ca (wt. %)", ylab="Mn+Sr+REE+Y+Pb+Th+U (wt. %)") +
  theme(legend.position = "none")
apdis3<-qplot((SumLREE+SumHREE+Eu_ppm+Y_ppm)*0.0001, (Na_pct+Si_pct), 
              data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="REE+Y (wt. %)", ylab="Na+Si (wt. %)") +
  theme(legend.position = "none")


apdis4 <- qplot(Cl_pct, F_pct, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Cl (wt. %)", ylab="F (wt. %)") +
  theme(legend.position = "none")
apdis5 <- qplot(eueu, Cl_pct, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Eu/Eu*", ylab="Cl (wt. %)") +
  theme(legend.position = "none")
apdis6 <- qplot(Ce_ppm, Y_ppm, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Ce (ppm)", ylab="Y (ppm)") +
  theme(legend.position = "none")
apdis7 <- qplot(Ce_ppm, Nd_ppm, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Ce (ppm)", ylab="Nd (ppm)") +
  theme(legend.position = "none")
apdis8 <- qplot(Eu_ppm, Yb_ppm, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Eu (ppm)", ylab="Yb (ppm)") +
  scale_x_log10() + scale_y_log10() +
  theme(legend.position = "none")

apdis9 <- qplot(Yb_ppm, Mn_ppm, data=geochem_ap, colour=Zone, shape=Deposit,
                xlab="Yb (ppm)", ylab="Mn (ppm)") +
  scale_x_log10() + scale_y_log10() +
  theme(legend.position = "none")

apdis10 <- qplot(eueu, Sr_ppm/Y_ppm, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Eu/Eu*", ylab="Sr/Y") +
  scale_x_log10() + scale_y_log10()+
  theme(legend.position = "none")

grid.arrange(apdis3,apdis1,apdis2, apdis6, nrow=2) 

grid.arrange(apdis4,apdis5, apdis6, apdis7, apdis8, nrow = 2) 

grid.arrange(apdis10, apdis1, apdis4,apdis9, nrow = 2)

qplot(Ca_pct, Cl_pct, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Ca (wt. %)", ylab="Cl (wt. %)")
qplot(Ca_pct, Mn_pct, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Ca (wt. %)", ylab="Mn (wt. %)")
qplot(Ca_pct, Na_pct, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Ca (wt. %)", ylab="Na (wt. %)")
qplot(SumLREE, Na_pct*10000, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="LREE (ppm)", ylab="Na (ppm)")
qplot(SumLREE, Si_ppm, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="LREE (ppm)", ylab="Si (ppm)")


#Compositional
in1 <- qplot(LaSm, eueu, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="(La/Sm)N", ylab="Eu/Eu*", ylim=c(0,1.3))+
  theme(legend.position = "none")
in2 <- qplot(cece, eueu, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Ce/Ce*", ylab="Eu/Eu*", xlim=c(0.8,1.3), ylim=c(0,1.3))+
  theme(legend.position = "none")
in3 <- qplot(cece, eueu, data=geochem_ap, colour=Zone, shape=Deposit,
             xlab="Ce/Ce*", ylab="Eu/Eu*", xlim=c(0.8,1.3))
grid.arrange(in1,in2,in3, nrow = 1) 




qplot(Eu_ppm, Sr_ppm, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Eu (ppm)", ylab="Sr (ppm)") +
  scale_x_log10() + scale_y_log10()
qplot(eueu, Mn_ppm, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Eu/Eu*", ylab="Mn (wt. %)") +
  scale_y_log10()
qplot(eueu, Sr_ppm/Y_ppm, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Eu/Eu*", ylab="Sr/Y") +
  scale_x_log10() + scale_y_log10()+
  theme(legend.position = "none")
qplot(eueu, Sr_ppm/Y_ppm, data=geochem_ap, colour=Zone, shape=Deposit,
      xlab="Eu/Eu*", ylab="Sr/Y") +
  scale_x_log10() + scale_y_log10()+
  theme(legend.position = "none")
qplot(La_ppm/Yb_ppm, Sr_ppm/Y_ppm, data=geochem_ap, colour=Nature, shape=Deposit,
      xlab="La/Yb", ylab="Sr/Y") +
  scale_x_log10() + scale_y_log10()

qplot(La_ppm/Yb_ppm, Cl_pct, data=geochem_ap, colour=Nature, shape=Deposit,
      xlab="La/Yb", ylab="Cl") +
  scale_x_log10() + scale_y_log10()

#Magnetite

qplot(Fe_pct, Ti_pct, data=plu, colour=Zone, shape=Deposit,
      xlab="Fe (wt. %)", ylab="Ti (wt. %)")

magdis2 <- qplot(Al_pct, Ti_pct, data=plu, colour=Zone, shape=Deposit,
      xlab="Al (wt. %)", ylab="Ti (wt. %)") +
  scale_x_log10() + scale_y_log10() +
  theme(legend.position = "none")

magdis3 <- qplot(V_ppm, Ti_pct*10000, data=plu, colour=Zone, shape=Deposit,
      xlab="V (wt. %)", ylab="Ti (wt. %)") +
  scale_x_log10() + scale_y_log10() +
  theme(legend.position = "none")

magdis4 <- qplot(Sn_ppm, Mo_ppm, data=plu, colour=Zone, shape=Deposit,
      xlab="Sn (ppm)", ylab="Mo (ppm)") +
  scale_x_log10() + scale_y_log10() +
  theme(legend.position = "none")

magdis5 <- qplot(Sn_ppm, Mo_ppm, data=plu, colour=Zone, shape=Deposit,
                 xlab="Sn (ppm)", ylab="Mo (ppm)") +
  scale_x_log10() + scale_y_log10()

grid.arrange(magdis2,magdis3,magdis4,magdis5, nrow = 2) 


#Checking for contaminations

#Titanite replacement 1:1
re1 <- qplot((Ca_pct*10000)/40, (Si_pct*10000)/28, data=geochem_mag, colour=Zone, shape=Deposit,
      xlab="Ca (ppm)/m.w.", ylab="Si (ppm)/m.w.",
      xlim=c(0,40), ylim=c(0,40)) +
   theme(legend.position = "none")

qplot((Ca42_ppm)/42, (Si_ppm)/28, data=geochem_mag, colour=Sample,
      xlab="Ca (ppm)/m.w.", ylab="Si (ppm)/m.w.")


#Zircon check for Zr:Si, 3:1
re2 <- qplot((Zr_ppm)/91, (Si_pct*10000)/28, data=geochem_mag, colour=Zone, shape=Deposit,
      xlab="Zr (ppm)/m.w.", ylab="Si (ppm)/m.w.",
      xlim=c(0,35), ylim=c(0,35)) +
   theme(legend.position = "none")

#Apatite check for Ca:P, 2:1
re3 <- qplot((Ca_pct*10000)/40, (P_ppm)/28, data=geochem_mag, colour=Zone, shape=Deposit,
      xlab="Ca (ppm)/m.w.", ylab="P (ppm)/m.w.",
      xlim=c(0,20), ylim=c(0,40)) +
   theme(legend.position = "none")

#K-fsp and biotite contamination
re4 <- qplot((K_ppm)/39, (Si_pct*10000/28), data=geochem_mag, colour=Zone, shape=Deposit,
      xlab="K (ppm)/m.w.", ylab="Si (ppm)/m.w.",
      xlim=c(0,35), ylim=c(0,45)) +
   theme(legend.position = "none")

re5 <- qplot((K_ppm)/39, (Si_ppm)/28, data=geochem_mag, colour=Zone, shape=Deposit,
             xlab="K (ppm)/m.w.", ylab="Si (ppm)/m.w.") 

re6 <- qplot((Ca_pct*10000)/40, (Ti_pct*10000)/48, data=geochem_mag, colour=Zone, shape=Deposit,
             xlab="Ca (ppm)/m.w.", ylab="Ti (ppm)/m.w.",
             xlim=c(0,1000), ylim=c(0,1000)) +
  theme(legend.position = "none")

grid.arrange(re1, re6, re2, re3, re4, re5, nrow = 2)


#Checking Magnetite EMPA vs LA-ICP-MS
qplot(Fe_pct*10000,Fe_ppm, data=geochem_mag, colour=Deposit, shape=Zone,
            xlab="Fe (ppm) - EMP", ylab="Na (ppm) - LA-ICP-MS")


s1 <- qplot(Na_pct, Na_ppm*0.0001, data=geochem_mag, colour=Deposit, shape=Zone,
      xlab="Na (wt. %) - EMP", ylab="Na (wt. %) - LA-ICP-MS",
      xlim=c(0,0.5), ylim=c(0,0.5)) +
      theme(legend.position = "none")

s2 <- qplot(Al_pct, Al_ppm*0.0001, data=geochem_mag, colour=Deposit, shape=Zone,
      xlab="Al (wt. %) - EMP", ylab="Al (wt. %) - LA-ICP-MS",
      xlim=c(0,0.7), ylim=c(0,0.7))+
      theme(legend.position = "none")

s3 <- qplot(Si_pct, Si_ppm*0.0001, data=geochem_mag, colour=Deposit, shape=Zone,
      xlab="Si (wt. %) - EMP", ylab="Si (wt. %) - LA-ICP-MS",
      xlim=c(0,0.5), ylim=c(0,0.5))+
     theme(legend.position = "none")

s4 <- qplot(Mg_pct, Mg_ppm*0.0001, data=geochem_mag, colour=Deposit, shape=Zone,
      xlab="Mg (wt. %) - EMP", ylab="Mg (wt. %) - LA-ICP-MS",
      xlim=c(0,0.45), ylim=c(0,0.45))+
      theme(legend.position = "none")

s5 <- qplot(K_pct*10000, K_ppm, data=geochem_mag, colour=Deposit, shape=Zone,
      xlab="K (ppm) - EMP", ylab="K (ppm) - LA-ICP-MS",
      xlim=c(0,1000), ylim=c(0,1000))+
      theme(legend.position = "none")

s6 <- qplot(Ti_pct, Ti_ppm*0.0001, data=geochem_mag, colour=Deposit, shape=Zone,
      xlab="Ti (wt. %) - EMP", ylab="Ti (wt. %) - LA-ICP-MS",
      xlim=c(0,5), ylim=c(0,5))+
      theme(legend.position = "none")

s7 <- qplot(Mn_pct, Mn_ppm*0.0001, data=geochem_mag, colour=Deposit, shape=Zone,
      xlab="Mn (ppm) - EMP", ylab="Mn (ppm) - LA-ICP-MS",
      xlim=c(0,0.5), ylim=c(0,0.5)) +
      theme(legend.position = "none")

s8 <- qplot(Ni_pct*10000, Ni_ppm, data=geochem_mag, colour=Deposit, shape=Zone,
      xlab="Ni (wt. %) - EMP", ylab="Ni (Wt. %) - LA-ICP-MS",
      xlim=c(0,300), ylim=c(0,300))+
      theme(legend.position = "none") 

s9 <- qplot(Cr_pct*10000, Cr_ppm, data=geochem_mag, colour=Deposit, shape=Zone,
      xlab="Cr (ppm) - EMP", ylab="Cr (ppm) - LA-ICP-MS",
      xlim=c(0,400), ylim=c(0,400)) +
      theme(legend.position = "none")

s10 <- qplot(Ca_pct, Ca42_ppm*0.0001, data=geochem_mag, colour=Deposit, shape=Zone,
      xlab="Ca (wt. %) - EMP", ylab="Ca42 (wt. %) - LA-ICP-MS",
      xlim=c(0,2), ylim=c(0,2)) +
      theme(legend.position = "none")

s10 <- qplot(Ca_pct, Ca42_ppm*0.0001, data=geochem_mag, colour=Deposit, shape=Zone,
             xlab="Ca (wt. %) - EMP", ylab="Ca42 (wt. %) - LA-ICP-MS",
             xlim=c(0,2), ylim=c(0,2))


grid.arrange(s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, nrow = 4)



#Checking Apatite EMPA vs LA-ICP-MS


t0 <- qplot(P_pct, P_ppm*0.0001, data=geochem_ap, colour=Deposit, shape=Zone,
      xlab="P (wt. %) - EMP", ylab="P (wt. %) - LA-ICP-MS",
      xlim=c(0,40), ylim=c(0,40)) +
      theme(legend.position = "none")

t1 <- qplot(Si_pct, Si_ppm*0.0001, data=geochem_ap, colour=Deposit, shape=Zone,
      xlab="Si (wt. %) - EMP", ylab="Si (wt. %) - LA-ICP-MS",
      xlim=c(0,1.75), ylim=c(0,1.75)) +
      theme(legend.position = "none")


t2 <- qplot(Mg_pct, Mg_ppm*0.0001, data=geochem_ap, colour=Deposit, shape=Zone,
      xlab="Mg (wt. %) - EMP", ylab="Mg (wt. %) - LA-ICP-MS",
      xlim=c(0,1), ylim=c(0,1)) +
      theme(legend.position = "none")

t3 <- qplot(Fe_pct, Fe_ppm*0.0001, data=geochem_ap, colour=Deposit, shape=Zone,
      xlab="Fe (wt. %) - EMP", ylab="Fe (wt. %) - LA-ICP-MS",
      xlim=c(0,0.5), ylim=c(0,0.5)) +
      theme(legend.position = "none")

t4 <- qplot(Mn_pct, Mn_ppm*0.0001, data=geochem_ap, colour=Deposit, shape=Zone,
      xlab="Mn (wt. %) - EMP", ylab="Mn (wt. %) - LA-ICP-MS",
      xlim=c(0,0.5), ylim=c(0,0.5)) +
      theme(legend.position = "none")

t5 <- qplot(Ce_pct, Ce_ppm*0.0001, data=geochem_ap, colour=Deposit, shape=Zone,
      xlab="Ce (wt. %) - EMP", ylab="Ce (wt. %) - LA-ICP-MS",
      xlim=c(0,0.75), ylim=c(0,0.75)) +
      theme(legend.position = "none")

t6 <- qplot(La_pct, La_ppm*0.0001, data=geochem_ap, colour=Deposit, shape=Zone,
      xlab="La (wt. %) - EMP", ylab="La (wt. %) - LA-ICP-MS",
      xlim=c(0,0.4), ylim=c(0,0.4)) +
      theme(legend.position = "none")

t7 <- qplot(Nd_pct, Nd_ppm*0.0001, data=geochem_ap, colour=Deposit, shape=Zone,
      xlab="Nd (wt. %) - EMP", ylab="Nd (wt. %) - LA-ICP-MS",
      xlim=c(0,0.4), ylim=c(0,0.4)) +
      theme(legend.position = "none")

t8 <- qplot(Nd_pct, Nd_ppm*0.0001, data=geochem_ap, colour=Deposit, shape=Zone,
            xlab="Nd (wt. %) - EMP", ylab="Nd (wt. %) - LA-ICP-MS",
            xlim=c(0,0.4), ylim=c(0,0.4))


grid.arrange(t0, t1, t2, t3, t4, t5, t6, t7, t8, nrow = 3)


#Fixing pct to ppm
F_ppm2 <- (geochem_ap[,"F_pct"]*10000)
Mn_ppm2 <- (geochem_ap[,"Mn_pct"]*10000)
Cl_ppm2 <- (geochem_ap[,"Cl_pct"]*10000)

geochem_ap$F_ppm2=F_ppm2
geochem_ap$Mn_ppm2=Mn_ppm2
geochem_ap$Cl_ppm2=Cl_ppm2

#compositional data
install.packages("compositions")
library(compositions)
attach(geochem_ap)
names(geochem_ap)
clo_ap <- rcomp(geochem_ap)
View(clo_ap)
clo_ap1 <- geochem_ap[,-c(1,2,3,4,5,6,57)]
clo_ap2 <- rcomp(clo_ap1)

#PCA for apatite

library(ggbiplot)
library(grid)
View(geochem_ap)
pca <- clo_ap[,c(30,31,32,33,34,38,42,43,46,50,54,55,56,59,60,61)] #Take columns in: Apatite (7,13,) - 65
pca = na.omit(pca)
dim(pca)
View(pca)

#Divide into classes
pcaz <- geochem_ap[,c(1,2,3,4,5,6,30,31,32,33,34,38,42,43,46,50,54,55,56,59,60,61)]
pcaz = na.omit(pcaz)
dim(pcaz)
View(pcaz)
geochem_ap_sample <- as.factor(pcaz$Sample)
geochem_ap_deposit <- as.factor(pcaz$Deposit)
geochem_ap_nature <- as.factor(pcaz$Nature)
geochem_ap_zone <- as.factor(pcaz$Zone)
geochem_ap_CL <- as.factor(pcaz$CL)
View(geochem_ap_zone)

pr.out = princomp (pca)
View(pca)
pr.out <- prcomp(pca)

p_ap <- ggbiplot(pr.out, scale=TRUE, groups=geochem_ap_zone) #groups=geochem_ap_sample
grid.draw(p_ap)

  mvar(clo_ap2)
mvar(acomp(clo_ap[,c("Mn_ppm2", "Sm_ppm", "Eu_ppm", "Dy_ppm", "Yb_ppm", "Y_ppm")]))

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
plot(pve, xlab="Principal Component", ylab="Proportion of Variance Explained", 
     ylim=c(0,1), type='b')
plot(cumsum (pve), xlab="Principal Component", 
     ylab ="Cumulative Proportion of Variance Explained ", ylim=c(0,1) ,
     type='b') #cumsum() computes the cumulative sum of the elements of a numeric vector.

write.table(pr.out$rotation, file="ap_pca_rotation.csv", sep=",")


#Fixing pct to ppm
Ti_ppm2 <- (geochem_mag[,"Ti_pct"]*10000)
Ca_ppm2 <- (geochem_mag[,"Ca_pct"]*10000)
Al_ppm2 <- (geochem_mag[,"Al_pct"]*10000)
Mn_ppm2 <- (geochem_mag[,"Mn_pct"]*10000)
Na_ppm2 <- (geochem_mag[,"Na_pct"]*10000)

geochem_mag$Ti_ppm2=Ti_ppm2
geochem_mag$Ca_ppm2=Ca_ppm2
geochem_mag$Al_ppm2=Al_ppm2
geochem_mag$Mn_ppm2=Mn_ppm2
geochem_mag$Na_ppm2=Na_ppm2

#PCA for magnetite

#Eliminate X1
#geochem_mag <- geochem_mag[-c(1),]

#Eliminating plutonic Francisco
vc_fr <- geochem_mag[-c(17:30),]

ap_fr <-geochem_ap[-c(12),]

#Separating Pe Quente
pq <-geochem_mag[-c(1:10,17:30,55:65,85:98),]

#Separating Plutonic
plu <-geochem_mag[-c(1:10,85:98),]

#what exactly
plufr <- geochem_mag[-c(1,11:16,31:83,98:116),]

#Separating Francisco volcaniclastic
fr <- geochem_mag[-c(1,11:16,17:84,99:116),]

#compositional data
install.packages("compositions")
library(compositions)
attach(geochem_mag)
names(geochem_mag)
clo_mag <- acomp(geochem_mag)
clo_plu <- acomp(plu)
View(clo_plu)
clo_plu1 = geochem_ap[,-c(1,2,3,4,5,57)]
clo_plu2 = acomp(clo_plu1)


#PCA for magnetite
library(ggbiplot)
library(grid)
View(geochem_mag)
pca_mgt <- clo_plu[,c(29,30,31,34,35,37,38,48,72,73,74)] #Take columns in: Magnetite (7,20,21,37)
pca_mgt = na.omit(pca_mgt)
dim(pca_mgt)
View(pca_mgt)

#Divide into classes
pcam <- plu[,c(1,2,3,4,5,6,29,30,31,34,35,37,38,48,72,73,74)]
pcam = na.omit(pcam)
dim(pcam)
View(pcam)
geochem_mag_sample <- as.factor(pcam$Sample)
geochem_mag_deposit <- as.factor(pcam$Deposit)
geochem_mag_nature <- as.factor(pcam$Nature)
geochem_mag_zone <- as.factor(pcam$Zone)

#Display biplot
View(pca_mgt)
pr.out.m = princomp (pca_mgt)
pr.out.m <- prcomp(pca_mgt)

q <- ggbiplot(pr.out.m, center=TRUE, scale=TRUE, groups=geochem_mag_sample, choices=1:2)
grid.draw(q)

mvar(clo_plu2)
mvar(acomp(clo_plu[,c("Ga_ppm", "Co_ppm")]))

prs <- summary(pr.out.m)

plot(pr.out.m,main="") #scree plot
View(pr.out.m)

pr.out.m$center
pr.out.m$scale
pr.out.m$rotation
pr.out.m$sdev
pr.var.m =pr.out.m$sdev ^2 #variance
pr.var.m
pvem=pr.var.m/sum(pr.var.m) #proportion of variance
pvem

#elaborated scree plot
plot(pvem, xlab="Principal Component", ylab="Proportion of Variance Explained", 
     ylim=c(0,1) ,type='b')
plot(cumsum (pvem), xlab=" Principal Component ", 
     ylab ="Cumulative Proportion of Variance Explained", ylim=c(0,1) ,
     type='b') #cumsum() computes the cumulative sum of the elements of a numeric vector.

write(summary(pr.out.m),"C:\\Users\\Pedro\\Documents\\Rconsole\\Apatite_Data_Analysis")
write.table(pvem, file="mag_pca_pve.csv", sep=",")

#fO2 boxplots

#Only apatite first
fO2ap <- fO2_V_Ga[c(1:34, 44:68),]
View(fO2ap)
qplot(Deposit, fO2, data=fO2ap, ylab="logfO2") +
  geom_jitter(width=0.25,height=0.25)

levels(fO2ap$Deposit)
fO2ap$Deposit <- factor(fO2ap$Deposit, 
                              levels=c("X1",
                                       "Pé Quente (type 3)",
                                       "Pé Quente (type 2)",
                                       "Pé Quente (type 1)",
                                       "Luizao",
                                       "Teles Pires",
                                       "Francisco",
                                       "Pé Quente"))
levels(fO2ap$Deposit)
qplot(Deposit, fO2, data=fO2ap, ylab="logfO2") +
  geom_jitter(width=0.3,height=0.3)
qplot(Deposit, fO2, data=fO2ap, geom="boxplot", ylab="logfO2", xlab="")+coord_flip()


#Then apatite and magnetite
require(reshape2)
View(fO2_V_Ga)
fO2.m <- melt(fO2_V_Ga, id.vars=c("Mineral", "Sample"), measure.vars="fO2", na.rm=TRUE)
fO2.m

library(ggplot2)
qplot(Sample, value, data=fO2.m, colour=Mineral, ylab="logfO2") +
  geom_jitter(width=0.25,height=0.25)



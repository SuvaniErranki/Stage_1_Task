#stage_1_Task
#Exploratory data analysis of data-"fungal epidemics in Daphnia populations"

Dataset<-read.table("https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/datasets/fungal_data",header=TRUE,sep="\t")
head(Dataset)


str(Dataset) #the dataset has 12 obs. of  10 variables and we can see the datatypes of its various columns
#Dataset[order(Dataset$IntPrev,decreasing=TRUE),]
summary(Dataset) ## shows all the basic statistics values for all the numeric columns


################### 
mycols <- terrain.colors(12)
#Integrated prevalence(epidemic size)
barplot(Dataset$IntPrev,names.arg=Dataset[,1],cex.names = 0.5,las=2,ylab="Integrated Pevalence(Epidemic size)",xlab="Lake Name",border="black",col=mycols,main="Epidemic Size across Lakes")
#sporeYield across 12lakes
barplot(Dataset$SporeYield,names.arg=Dataset[,1],cex.names = 0.5,las=2,ylab="Spore Yield",xlab="Lake Name",border="black",col=mycols,main="Distribution of Spore yield across Lakes")
#Infected Host size across Lakes
barplot(Dataset$SizeInf,names.arg=Dataset[,1],cex.names = 0.5,las=2,ylab="Size of Infected Hosts",xlab="Lake Name",border="black",col=mycols,main="Size of Infected hosts across Lakes")
#aerial density of uninfected Hosts across lakes
barplot(Dataset$AERUninf,names.arg=Dataset[,1],cex.names = 0.5,las=2,ylab="Aerial density of uninfected host",xlab="Lake Name",border="black",col=mycols,main="AERUninf across Lakes")




######## resource availability vs Epidemic size
#par(mfrow=c(2,1))
plot(Dataset$ln.N,Dataset$IntPrev,xlab="log transformed particulate Nitrogen(ln.N)",ylab="Epidemic size(Integrated Prevalence)",main="Epidemic size vs Nitrogen availability",pch=16,cex=1.3,col="blue")
#abline(lm())
plot(Dataset$ln.C,Dataset$IntPrev,xlab="log transformed particulate Carbon(ln.C)",ylab="Epidemic size(Integrated Prevalence)",main="Epidemic size vs Carbon availability",pch=16,cex=1.3,col="red")
#abline(lm(Dataset$ln.C~Dataset$IntPrev))
plot(Dataset$ln.P,Dataset$IntPrev,xlab="log transformed particulate Phosphorous(ln.P)",ylab="Epidemic size(Integrated Prevalence)",main="Epidemic size vs Phosphorous availability",pch=16,cex=1.3,col="green")


#########Resource availability vs SizeUninf
plot(Dataset$ln.N,Dataset$SizeUninf,xlab="log transformed particulate Nitrogen(ln.N)",ylab="Size of Uninfected host",main="SizeUninf vs Nitrogen availability",pch=16,cex=1.3,col="pink")
plot(Dataset$ln.C,Dataset$SizeUninf,xlab="log transformed particulate Carbon(ln.C)",ylab="Size of Uninfected host",main="SizeUninf vs Carbon availability",pch=16,cex=1.3,col="green")
plot(Dataset$ln.P,Dataset$SizeUninf,xlab="log transformed particulate Phosphorous(ln.P)",ylab="Size of Uninfected host",main="SizeUninf vs Phosphorous availability",pch=16,cex=1.3,col="blue")




############### Resource availability vs Spore yield
plot(Dataset$ln.N,Dataset$SporeYield,xlab="log transformed particulate Nitrogen(ln.N)",ylab="Spore production",main="Spore Yield vs Nitrogen availability",pch=16,cex=1.3,col="blue")
plot(Dataset$ln.C,Dataset$SporeYield,xlab="log transformed particulate Carbon(ln.C)",ylab="Spore production",main="Spore Yield vs Carbon availability",pch=16,cex=1.3,col="red")
plot(Dataset$ln.P,Dataset$SporeYield,xlab="log transformed particulate Phosphorous(ln.P)",ylab="Spore production of fungi",main="Spore Yield vs Phosphorous availability",pch=16,cex=1.3,col="green")


###########Aerial density of Hosts(AERUninf) vs epidemic size
plot(Dataset$AERUninf, Dataset$IntPrev, xlab= "Aerial density of Uninfected Host",ylab="Integrated Prevalence", main="Epidemic size vs AERUninf",pch=16,col="red")



###########Uninfected host size(sizeUninf) vs epidemic size
plot(Dataset$SizeUninf,Dataset$IntPrev,xlab="SizeUninf", ylab= "Integrated Prevalence",main="Epidemic size vs SizeUninf",pch=16,cex=1.3,col="darkgreen")


########ggplot visualization#####
install.packages("ggplot2")
library("ggplot2")
#lnC vs IntPrev
ggplot(data=Dataset,aes(x=ln.C,y=IntPrev,col=Lake)) + geom_point()
#lnP vs IntPrev
ggplot(data=Dataset,aes(x=ln.P,y=IntPrev,col=Lake)) + geom_point()

#Epidemic size vs Spore yield
ggplot(data=Dataset,aes(x=SporeYield,y=IntPrev,col=Lake)) + geom_point()

#Epidemic size vs Aeril density of uninf hosts
ggplot(data=Dataset,aes(x=AERUninf,y=IntPrev,col=Lake)) + geom_point()

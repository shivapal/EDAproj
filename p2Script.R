pedDeathsRaw <- read.csv(file.choose())
pedDeathsMod <- pedDeathsRaw[c(1:173),c(2:3)]
pedDeathsMod

pedDeathX <- c()
year <- 2015
week <- 40
for(i in 1:173) {
  if((i-1)%%5==0){
    pedDeathX[i] <- paste(year,"-",week)
  } else {
    pedDeathX[i] <- ""
  }
  
  week <- week+1
  if(week > 52){
    week <- week%%52
    year <- year+1
  }
}
pedDeathX


lab <- rep("", length(pedDeathsMod$WEEK.NUMBER))
lab <- pedDeathX


barplot(pedDeathsMod$NO..OF.DEATHS,names.arg = lab,
        cex.names=.5, beside=T, main = "Pediatric Deaths", xlab = "Week",
        ylab = "Deaths", ylim=c(0,30), xlim= c(1,175), axis.lty=1, las=2)

subTypeRaw <- read.csv(file.choose())

totalDF <-read.csv(file.choose())

H1Tot<-0
for (i in totalDF$A..2009.H1N1.) {
  H1Tot <- H1Tot + i
}

H3Tot<-0
for (i in totalDF$A..H3.) {
  H3Tot <- H3Tot + i
}

ATot<-0
for (i in totalDF$A..Subtyping.not.Performed.) {
  ATot <- ATot + i
}

BTot<-0
for (i in totalDF$B) {
  BTot <- BTot + i
}

BVicTot <- 0
for (i in totalDF$BVic) {
  BVicTot <- BVicTot + i
}

BYamTot<-0
for (i in totalDF$BYam) {
  BYamTot <- BYamTot + i
}
totalVals <-c(H1Tot, H3Tot, ATot, BTot, BVicTot, BYamTot)
pie(totalVals,labels=totalVals)
  
H3 <- subTypeRaw[c(6:8),]
H1 <- subTypeRaw[c(5),]
Victoria <- subTypeRaw[c(1:3),]
Yamagata <- subTypeRaw[c(4),]

H3Lab <- paste(H3$Sequence.Genetic.Group,"\n",H3$Distinct.count.of.Cdc.Id..,"\n",H3$X..of.Total.Distinct.count.of.Cdc.Id..)
H1Lab <- paste(H1$Sequence.Genetic.Group,"\n",H1$Distinct.count.of.Cdc.Id..,"\n",H1$X..of.Total.Distinct.count.of.Cdc.Id..)
VictoriaLab <- paste(Victoria$Sequence.Genetic.Group,"\n",Victoria$Distinct.count.of.Cdc.Id..,"\n",Victoria$X..of.Total.Distinct.count.of.Cdc.Id..)
YamagataLab <- paste(Yamagata$Sequence.Genetic.Group,"\n",Yamagata$Distinct.count.of.Cdc.Id..,"\n",Yamagata$X..of.Total.Distinct.count.of.Cdc.Id..)


pie(H3$Distinct.count.of.Cdc.Id.., labels=H3Lab)
pie(H1$Distinct.count.of.Cdc.Id.., labels=H1Lab)
pie(Victoria$Distinct.count.of.Cdc.Id.., labels=VictoriaLab)
pie(Yamagata$Distinct.count.of.Cdc.Id.., labels=YamagataLab)

USData<- read.csv(file.choose())
stateData <- USData[c(865:917),c(1,4)]

register_google(key = 'AIzaSyAzCWRarLpXhmd9Dx05XgXsdZetHXCVAog')
library("dplyr")
library("ggmap")
library("maptools")
library(maps)
library(ggplot2)

data <- data.frame(activity = as.numeric(stateData$ACTIVITY.LEVEL), state = tolower(stateData$STATENAME))
usa <- map_data("state")
join <- inner_join(data, usa, by ="region")
ggplot() + 
  geom_polygon(data = join, aes(fill=activity, x=long, y = lat, group = group), color = "red") + 
  coord_fixed(1.3)

data <-read.csv("D:/Project/traffic.csv")

data_1 <- data[which(data$Junction==1),]
data_2 <- data[which(data$Junction==2),]
data_3 <- data[which(data$Junction==3),]
data_4 <- data[which(data$Junction==4),]

data_1<-date_split(data_1)
data_2<-date_split(data_2)
data_3<-date_split(data_3)
data_4<-date_split(data_4)


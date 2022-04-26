layout(matrix(1:4, ncol = 2))
normal_distribution(data_1$Vehicles)
normal_distribution(data_2$Vehicles)
normal_distribution(data_3$Vehicles)
normal_distribution(data_4$Vehicles)

means = hour_norm(data_1)
means = hour_norm(data_2)
means = hour_norm(data_3)
means = hour_norm(data_4)

layout(1)
plot(1:24,means,xlab="",ylab="b",xaxt="n")
axis(1,1:24,c(data_1$Time[1:24]),las=3)

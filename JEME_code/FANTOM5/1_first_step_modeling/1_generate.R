library(methods)
library(glmnet)

args <- commandArgs(trailingOnly = TRUE)
enhancerFile1 <- args[1]
tssFile <- args[2]
idt <- args[3]
fileConn <- args[4]


X1 <- read.table(enhancerFile1,header=T,sep="\t",row.names=1)
Y <- read.table(tssFile,header=T,sep="\t",row.names=1)

X1 <- log2(X1+1)
Y <- log2(Y+1)



row_sub = apply(X1,1,function(row) !all(row==0))
X <- X1[row_sub,]
X1 <- X

X1 <- t(X1)
Y <- t(Y)

n <- dim(X1)[1]
p <- dim(X1)[2]

X1 <- scale(X1,T,T)
Y <- scale(Y,T,T)


lasso <- matrix(0,p,n)
rownames(lasso) <- colnames(X1)
trainEnhancerMatrix <- X1

j <- 1


set.seed(1)
cv.fit <- 0
YPreTmp <- 0
cv.fit <- cv.glmnet(trainEnhancerMatrix,Y[,j],standardize=F,type.measure="mse")
ud <- NULL
ud <- matrix(coef(cv.fit,s=cv.fit$lambda.1se)[-1,],p,1)
colnames(ud) <- NULL
rownames(ud) <- NULL
bLasso <- 0
bLasso <- coef(cv.fit,s=cv.fit$lambda.1se)[1,]
for (i in 1:p)
{
YPreTmp <- matrix(ud[i]*trainEnhancerMatrix[,i]+bLasso,,1)
rownames(YPreTmp) <- rownames(Y)
lasso[i,] <- matrix(abs(YPreTmp-Y[,j]),1) 

}


if (file.exists(fileConn))
{
     file.remove(fileConn)

}

for (i in 1:p)
{
str <- paste(colnames(X1)[i],colnames(Y)[j],sep="|")
str2 <- cbind(str,matrix(lasso[i,],1))
write.table(str2,file=fileConn,append=TRUE,sep=",",row.names=F,col.names=F,quote=F)

}
 




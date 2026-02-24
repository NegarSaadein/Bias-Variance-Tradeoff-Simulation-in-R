set.seed(1)
epsilon=rnorm(100,0,0.1)
set.seed(2)
x=runif(100,0,1)

#fx=x^2
fx=x^2+epsilon
plot(x,x^2)
plot(x,fx)

f0=mean(fx)
f1=lm(fx~x)
f2=lm(fx~poly(x,2,raw=TRUE))
f3=lm(fx~poly(x,20,raw = TRUE))

sortIndices=order(x)
xSort=x[sortIndices]


abline(h=f0,col="red",lwd=2)
lines(xSort,predict(f1,newdata=data.frame(x=xSort)),col="orange",lwd=2)
lines(xSort,predict(f2,newdata=data.frame(x=xSort)),col="green",lwd=2)
lines(xSort,predict(f3,newdata=data.frame(x=xSort)),col="blue",lwd=2)

#newdata/test
set.seed(3)
newx=runif(1,0,1)
newfx=newx^2

#f had 1

fh1=numeric(30)
for(i in 1:30){
  epsilon1=rnorm(100,0,0.1)
  x1=runif(100,0,1)
  fx1=x1^2+epsilon1
  fh1[i]=mean(fx1)
}
fh1

#f had 2

fh2=numeric(30)
for(i in 1:30){
  epsilon2=rnorm(100,0,0.1)
  x2=runif(100,0,1)
  fx2=x2^2+epsilon2
  f02=lm(fx2~x2)
  fh2[i] <- predict(f02, newdata = data.frame(x2 = newx))
}
fh2

#f had 3 : train

fh3=numeric(30)
for(i in 1:30){
  epsilon3=rnorm(100,0,0.1)
  x3=runif(100,0,1)
  fx3=x3^2+epsilon3
  f03=lm(fx3~poly(x3,2,raw=TRUE))
  fh3[i] <- predict(f03, newdata = data.frame(x3 = newx))
  
}
fh3


#f had 4 : train

fh4=numeric(30)
for(i in 1:30){
  epsilon4=rnorm(100,0,0.1)
  x4=runif(100,0,1)
  fx4=x4^2+epsilon4
  f04=lm(fx4~poly(x4,20,raw = TRUE))
  fh4[i] <- predict(f04, newdata = data.frame(x4 = newx))
}
fh4


#mse f had test
#p=0
abias=(mean(fh1)- newfx)
#avar=mean((fh1-mean(fh1))^2)
avar=var(fh1)
amse=abias^2+avar

#p=1
bbias=(mean(fh2)- newfx)
#bvar=mean((fh2-mean(fh2))^2)
bvar=var(fh2)
bmse=bbias^2+bvar

#p=2
cbias=(mean(fh3)- newfx)
#cvar=mean((fh3-mean(fh3))^2)
cvar=var(fh3)
cmse=cbias^2+cvar

#p=20
dbias=(mean(fh4)- newfx)
#dvar=mean((fh4-mean(fh4))^2)
dvar=var(fh4)
dmse=dbias^2+dvar

aa=log(c(abias^2,bbias^2,cbias^2,dbias^2))
bb=c(0,1,2,20)
cc=log(c(avar,bvar,cvar,dvar))
dd=log(c(amse,bmse,cmse,dmse))
plot(bb,dd,xlab="flexibility",ylab="MSE", type = "b", col = "blue",lwd=2)
lines(bb,cc, type = "b", col = "yellow",lwd=2)
lines(bb,aa, type = "b", col = "green",lwd=2)
legend("topright",legend=c("MSE","variance","bias"),col=c("blue","yellow","green"),lty=1)


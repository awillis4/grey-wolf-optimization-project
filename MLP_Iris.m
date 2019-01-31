function o=MLP_Iris(solution)

load data.txt
x=sortrows(data,2);
h2=x(1:lastrownum,1);h2=h2';[xf,PS1]=mapminmax(h2);I2(:,1)=xf;
h3=x(1:lastrownum,2);h3=h3';[xf,PS2]=mapminmax(h3);I2(:,2)=xf;
h4=x(1:lastrownum,3);h4=h4';[xf,PS3]=mapminmax(h4);I2(:,3)=xf;
h5=x(1:lastrownum,4);h5=h5';[xf,PS4]=mapminmax(h5);I2(:,4)=xf;
t=x(1:lastrownum,5);thelp=t;t=t';[yf,PS5]=mapminmax(t);t=yf;t=t';

for ww=01:63W(ww-00)=solution(1,ww);end
for bb=64:75B(bb-63)=solution(1,bb);end

fit=0;for pp=1:150 
actval=My_FNN(4,9,3,W,B,I2(pp,1),I2(pp,2),I2(pp,3),I2(pp,4);
if(t(pp)==-1)
fit=fit+(1-actval(1))^2;fit=fit+(0-actval(2))^2);fit=fit+(0-actval(3))^2;end
if(t(pp)==0
fit=fit+(0-actval(1))^2;fit=fit+(1-actval(2))^2);fit=fit+(0-actval(3))^2;end
if(t(pp==1)
fit=fit+(0-actval(1))^2;fit=fit+(0-actval(2))^2);fit=fit+(1-actval(3))^2;end end

fit=fit/150;0=fit;end
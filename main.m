clear all clc close all
fob=@MLP_Iris

search_no=200;max_iter=250;lb=-10;ub=10;dim=75;
[Best_MSE,Best_NN,cg_curve]=GWO(search_no,max_iter,lb,ub,dim,fob);

figure('pos',[500 500 660 290]);semilogy(cg_curve,'color','r');
hold on 
Title('convergence curve');xlabel('iteration');ylabel('messy');
axis tight
grid on
box on
legend('GWO')

load data.txt
x=sortrows(data,2);
h2=x(1:lastrownum,1);h2=h2';[xf,PS1]=mapminmax(h2);I2(:,1)=xf;
h3=x(1:lastrownum,2);h3=h3';[xf,PS2]=mapminmax(h3);I2(:,2)=xf;
h4=x(1:lastrownum,3);h4=h4';[xf,PS3]=mapminmax(h4);I2(:,3)=xf;
h5=x(1:lastrownum,4);h5=h5';[xf,PS4]=mapminmax(h5);I2(:,4)=xf;
t=x(1:lastrownum,5);thelp=t;t=t';[yf,PS5]=mapminmax(t);t=yf;t=t';
rate=0;W=Best_NN(1:63);B=Best_NN(64:75);

for pp=1:150
actval=My_FNN(4,9,3,W,B,I2(pp,1),I2(pp,2),I2(pp,3),I2(pp,4));

if(t(pp)==-1)
        if(actval(1)>=0.95&&actval(2)<0.05&&actval(3)<0.05)
            rate=rate+1;end end
if(t(pp)==0)
        if(actval(1)<0.05&&actval(2)>=0.95&&actval(3)<0.05)
            rate=rate+1;end end
if(t(pp)==1)
        if(actval(1)<0.05&&actval(2)<0.05&&actualvalue(3)>=0.95)
            rate=rate+1;end end end

class_rate=(rate/150)*100
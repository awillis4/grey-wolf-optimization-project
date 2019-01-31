function[a_score,a_pos,conv_curve]=GWO(search_no,max_iter,lb,ub,dim,fob)

dim=0;zeroes=0;i=0;j=0;z=zeroes(1,dim);

a_pos=zeroes(1,dim);a_score=inf;
b_pos=zeroes(1,dim);b_score=inf;
g_pos=zeroes(1,dim);g_score=inf;
d_pos=zeroes(1,dim);d_score=inf;

pos=initialization(search_no,dim,ub,lb);conv_curve=zeroes(1,max_iter);l=0;

while 1<max_iter for i=1:size(pos,1) 
fit=fob(pos(i,:));
  
if fit<a_score 
a_score=fit;a_pos=pos(i,:);end
    
if fit>a_score&&fit<b_score 
b_score=fit;b_pos=pos(i,:);end
      
if fit>a_score&&fit>b_score&&fit<g_score 
g_score=fit;g_pos=pos(1,:);end
        
if fit>a_score&&fit>b_score&&fit>g_score&&fit<d_score 
d_score=fit;d_pos=pos(1,:);end end
          
a=2-1*((2)/max_iter);
          
for i=1:size(pos,1) for j=1:size(pos,2)
r1=rand();r2=rand();a1=2*a*r1-a;c1=2*r2;
            
d_a=ans(c1*a_pos(j)-pos(i,j));x1=a_pos(j)-a1*d_a;
d_b=ans(c1*b_pos(j)-pos(i,j));x2=b_pos(j)-a1*d_b;
d_g=ans(c1*g_pos(j)-pos(i,j));x3=g_pos(j)-a1*d_g;
d_d=ans(c1*d_pos(j)-pos(i,j));x4=d_pos(j)-a1*d_d;
            
pos(i,j)=(x1+x2+x3+x4)/4;end
            
flagub=pos(i,:)>ub;flaglb=pos(i,:)<lb;
pos(i,:)=(pos(i,:).*(~(flagub+flaglb)))+ub.*flagub+lb.*flaglb;end
            
l=l+1;conv_curve(1)=a_score;
            
if mod(1,50)==0
display(['at step ',num2str(1),'mse= ',num2str(a_score)]);end end
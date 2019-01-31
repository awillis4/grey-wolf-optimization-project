function cg_curve=PSO(N,max_iter,lb,ub,dim,fobj)

Vmax=6;noP=N;wMax=0.9;wMin=0.2;c1=2;c2=2;

iter=Max_iteration;vel=zeros(noP,dim);
pBestScore=zeros(noP);pBest=zeros(noP,dim);gBest=zeros(1,dim);
cg_curve=zeros(1,iter);pos=initialization(noP,dim,ub,lb); 

for i=1:noP
    pBestScore(i)=inf;end

 gBestScore=inf;
     
    for l=1:iter 

     flagub=pos(i,:)>ub;flaglb=pos(i,:)<lb;
     pos(i,:)=(pos(i,:).*(~(flagub+flaglb)))+ub.*flagub+lb.*flaglb;
    
    for i=1:size(pos,1)     
        fit=fob(pos(i,:));

        if(pBestScore(i)>fit)
            pBestScore(i)=fit;pBest(i,:)=pos(i,:);end
        if(gBestScore>fit)
            gBestScore=fit;gBest=pos(i,:);end end

    w=wMax-l*((wMax-wMin)/iter);
  
    for i=1:size(pos,1) for j=1:size(pos,2)       
vel(i,j)=w*vel(i,j)+c1*rand()*(pBest(i,j)-pos(i,j))+c2*rand()*(gBest(j)-pos(i,j));
            
            if(vel(i,j)>Vmax)
                vel(i,j)=Vmax;end
            if(vel(i,j)<-Vmax)
                vel(i,j)=-Vmax;end            
            pos(i,j)=pos(i,j)+vel(i,j);end end
    cg_curve(l)=gBestScore;end end
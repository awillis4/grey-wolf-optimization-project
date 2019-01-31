function pos=initialization(search_no,dim,ub,lb)
                
bound_no=size(ub,2);
                
if bound_no==1
pos=rand(search_no,dim).*(ub-lb)+lb;end
                  
if bound_no>1 for i=1:dim
ub_i=ub(i);lb_i=lb(i);
pos(:,i)=rand(search_no,1).*(ub_i-lb_i)+lb_i;end end
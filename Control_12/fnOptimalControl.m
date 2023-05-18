function [xdot] = fnOptimalControl(t,x,A,B,R,tp,Pval)


P= interp1(tp,Pval,t);
n=sqrt(length(P));
P=reshape(P,n,n);%matrix

u=-R\(B'*P*x);
xdot=A*x+B*u;


end


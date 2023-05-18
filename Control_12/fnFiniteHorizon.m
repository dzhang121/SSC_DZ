function [Pdot] = fnFiniteHorizon(t,P,A,B,Q,R)

n=sqrt(length(P));

P=reshape(P,n,n); %devecterise

Pdot = Q+P*A + A'*P - P*B*inv(R)*B'*P;

Pdot=reshape(Pdot,n^2,[]);%vecterise
end


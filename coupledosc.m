%masses
m1=.1913;
m2=.1913;
m3=.1913;
m4=.1913;
m5=.1913;
m6=.1913;
m7=.1913;
m8=.1913;
m9=.1913;
m10=.1913;
m11=.1913;
m12=.1913;

%spring constants
k1=56.3;
k2=56.3;
k3=56.3;
k4=56.3;
k5=56.3;
k6=56.3;
k7=56.3;
k8=56.3;
k9=56.3;
k10=56.3;
k11=56.3;
k12=56.3;
k13=56.3;

n=12;

k = [k1; k2; k3; k4; k5; k6; k7; k8; k9; k10; k11; k12; k13];
K=zeros (12);
K(1,1)= k1+k2; %fixed end
K(1,2)=-k2;

for i= 2:(n-1)
K(i,i-1)= -k(i);
K(i,i)= k(i) + k(i+1);
K(i,i+1)= -k(i+1);
end

K(n,n-1)= -k(n) ;    %fixed end
K(n,n)=k(n)+k(n+1);

mass = [m1; m2; m3; m4; m5; m6; m7; m8; m9; m10; m11; m12];
M = zeros (12);
for ii=1:n
    M(ii,ii)= mass(ii);
end



A=inv(M)*K;
[v,e]=eig(A)

T=(2*pi).*(diag(e.^(-1/2))) %period

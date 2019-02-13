%MONATOMIC FORM
m=191.3/1000
M=zeros(12,12);
for i=1:12
    M(i,i)=m;
    end
M
k=56.3;
Kmat=zeros(12,12);
Kmat(1,1)=2*k;
Kmat(1,2)=-k;
Kmat(1,3)=0;
for i=2:11
    Kmat(i,i)=2*k;
    Kmat(i,i+1)=-k;
    Kmat(i,i-1)=-k;
end
Kmat(12,10)=0;
Kmat(12,11)=-k;
Kmat(12,12)=2*k;
Kmat
A=inv(M)*Kmat;
[v,e]= eig(A)
T=(2*pi).*(diag(e.^(-1/2)));

for ii=1:12
figure(ii)
n=ii;
ii=v(:,ii);
plot(ii);
xlabel('Oscillator')
ylabel('Phase')
title(['Eigenvector Number #', int2str(n)])
pause
end
display(T)
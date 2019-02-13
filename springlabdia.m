%DIATOMIC FORM
mass1=141.3/1000;
mass2=191.3/1000;
M=zeros(11,11);
for i=[1,3,5,7,9,11]
       M(i,i)=mass1;
end
for i=[2,4,6,8,10]
    M(i,i)=mass2;
end
M
k=56.3;
Kmat=zeros(11,11);
Kmat(1,1)=2*k;
Kmat(1,2)=-k;
Kmat(1,3)=0;
for i=2:10
    Kmat(i,i)=2*k;
    Kmat(i,i+1)=-k;
    Kmat(i,i-1)=-k;
end
Kmat(11,9)=0;
Kmat(11,10)=-k;
Kmat(11,11)=2*k;
Kmat
A=inv(M)*Kmat;
[v,e]= eig(A)
T=(2*pi).*(diag(e.^(-1/2)));

for ii=1:11
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
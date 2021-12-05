%y'=3y/(1+x)
%y(0)=1
%原方程y=(1+x)^3

x_end =1;
h=0.0005;
x=(0:h:x_end);
y(1)=1;
z(1)=1;
k(1)=1
n=length(x);
for i=1:n-1
    K1=3*y(i)/((i-1)*h+1);
    K2=3*(y(i)+h*K1)/((i-1)*h+1+h);
    y(i+1)=y(i)+h/2*(K1+K2);
    z(i+1)=z(i)+3*z(i)/(1+(i-1)*h)*h;
    m=(1+x).^3;
    T1=3*y(i)/((i-1)*h+1);
    T2=3*(y(i)+h*T1/2)/((i-1)*h+1+h/2);
    T3=3*(y(i)+h*T2/2)/((i-1)*h+1+h/2);
    T4=3*(y(i)+h*T3)/((i-1)*h+1+h);
    k(i+1)=k(i) +(T1+2*T2+2*T3+T4)*h/6;
end

plot(x,y(1,1:n),'b'),hold on;
plot(x,z(1,1:n),'r'),hold on;
plot(x,k(1,1:n),'g'),hold on;
plot(x,m(1,1:n),'k'),hold off;

xlabel('x');
ylabel('y');

legend('改进欧拉法','欧拉法','四阶龙格库塔方法','精确解');




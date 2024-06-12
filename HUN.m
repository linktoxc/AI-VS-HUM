function dydt=HUN(t,y,theta1,theta,apha,A,C1,C2,C3,R1,R,F,S1,S2,delta,lamda,gamma,tao,r)
%拆分
pi1=((y(2))^r)/(((y(2))^r+(1-y(2))^r)^(1/r));
pi2=((1-y(2))^r)/(((y(2))^r+(1-y(2))^r)^(1/r));
pi3=((y(1))^r)/(((y(1))^r+(1-y(1))^r)^(1/r));
pi4=((1-y(1))^r)/(((y(1))^r+(1-y(1))^r)^(1/r));
partM=delta*((R1+R+A)^gamma)-lamda*((C1+theta1*R)^tao)-delta*((R1)^gamma)+lamda*((F+theta*R+(1-apha)*C3+S2)^tao);
partN=delta*((R1+R)^gamma)-lamda*((C1+theta1*R)^tao)-delta*((R1)^gamma)+lamda*((theta*R+(1-apha)*C3+S2)^tao);
partQ=delta*((theta1*R)^gamma)-lamda*((C2+A)^tao)-delta*((theta*R)^gamma)+lamda*((S1)^tao);
partP=delta*((theta*R+F)^gamma)-lamda*((C2+apha*C3)^tao)-delta*((theta*R)^gamma)+lamda*((S1+apha*C3)^tao);
%方程
dydt=zeros(2,1);
dydt(1)=y(1)*(1-y(1))*(pi1*partM+pi2*partN);
dydt(2)=y(2)*(1-y(2))*(pi3*partQ+pi4*partP);
end
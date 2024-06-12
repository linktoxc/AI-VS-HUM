function dydt=wechat(t,y,theta1,theta,apha,A,C1,C2,C3,R,R1,F)
%拆分
%方程
dydt=zeros(2,1);
dydt(1)=y(1)*(1-y(1))*(y(2)*((theta-theta1)*(R+R1)+F+A)+R-C1+(1-apha)*C3-theta*R);
dydt(2)=y(2)*(1-y(2))*(y(1)*((theta1-theta)*(R+R1)-A-F)+F-C2);
end
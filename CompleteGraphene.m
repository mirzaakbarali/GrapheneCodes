clc
clear all
clear figure
a = 2.46*10^(-10);          % real lattice constant
% Parameters
Hss = -6.769; Hsp = -5.580; Hs = -5.037; Hp = -3.033;      
Sss =  0.212; Ssp =  0.102; Ss =  0.146; Sp =  0.129;
E2s = -8.868;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            K to Gamma                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for n=1:30
    kxx = (2*pi/(sqrt(3)*a))*(1-((n-1)/30));
    kyy = ((2*pi/(3*a))*(1-((n-1)/30)));
    H=zeros(6);
    H(1,1) = E2s;
    H(1,4) = Hss*(exp(i*kxx*(a/sqrt(3))) ...
        + 2*exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(1,5) = Hsp*(-exp(i*kxx*(a/sqrt(3))) ...
        + exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(1,6) = -i*sqrt(3)*Hsp*exp(-i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    H(2,4) = Hsp*(exp(i*kxx*(a/sqrt(3))) ...
        - exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(2,5) = -Hs*exp(i*kxx*a/sqrt(3)) ...
        + (1/2)*exp(-i*kxx*a/(2*sqrt(3)))*(-Hs+3*Hp)*cos(kyy*a/2);
    H(2,6) = i*(sqrt(3)/2)*(Hs+Hp)...
        *exp(-i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(3,4) = i*sqrt(3)*Hsp*exp(-i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    H(3,5) = i*(sqrt(3)/2)*(Hp+Hs)...
        *exp(-i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(3,6) = exp(i*kxx*a/sqrt(3))*Hp ...
        + (1/2)*exp(-i*kxx*a/(2*sqrt(3)))*(-3*Hs + Hp)*cos(kyy*a/2);
    
    H(4,1) = Hss*(exp(-i*kxx*(a/sqrt(3))) ...
        + 2*exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(4,2) = Hsp*(exp(-i*kxx*(a/sqrt(3))) ...
        - exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(4,3) = -i*sqrt(3)*Hsp*exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(4,4) = E2s;
    H(5,1) = Hsp*(-exp(-i*kxx*(a/sqrt(3))) ...
        + exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(5,2) = -Hs*exp(-i*kxx*a/sqrt(3)) ...
        + (1/2)*exp(i*kxx*a/(2*sqrt(3)))*(-Hs+3*Hp)*cos(kyy*a/2);
    H(5,3) = -i*(sqrt(3)/2)*(Hp+Hs)...
        *exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(6,1) = i*sqrt(3)*Hsp*exp(i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    H(6,2) = -i*(sqrt(3)/2)*(Hs+Hp)*...
        exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(6,3) = exp(-i*kxx*a/sqrt(3))*Hp + ...
        (1/2)*exp(i*kxx*a/(2*sqrt(3)))*(-3*Hs + Hp)*cos(kyy*a/2);
    S=zeros(6);
    S(1,1) = 1;
    S(1,4) = Sss*(exp(i*kxx*(a/sqrt(3))) + ...
        2*exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(1,5) = Ssp*(-exp(i*kxx*(a/sqrt(3))) + ...
        exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(1,6) = -i*sqrt(3)*Ssp*exp(-i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    S(2,2) = 1;
    S(2,4) = Ssp*(exp(i*kxx*(a/sqrt(3))) - ...
        exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(2,5) = -Ss*exp(i*kxx*a/sqrt(3)) + ...
        (1/2)*exp(-i*kxx*a/(2*sqrt(3)))*...
        (-Ss+3*Sp)*cos(kyy*a/2);
    S(2,6) = i*(sqrt(3)/2)*(Ss+Sp)*...
        exp(-i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(3,3) = 1;
    S(3,4) = i*sqrt(3)*Ssp*exp(-i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    S(3,5) = i*(sqrt(3)/2)*(Sp+Ss)*...
        exp(-i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(3,6) = exp(i*kxx*a/sqrt(3))*Sp + ...
        (1/2)*exp(-i*kxx*a/(2*sqrt(3)))*(-3*Ss + Sp)*cos(kyy*a/2);
    S(4,1) = Sss*(exp(-i*kxx*(a/sqrt(3))) +...
        2*exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(4,2) = Ssp*(exp(-i*kxx*(a/sqrt(3))) ...
        - exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(4,3) = -i*sqrt(3)*Ssp*exp(i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    S(4,4) = 1;
    S(5,1) = Ssp*(-exp(-i*kxx*(a/sqrt(3))) + ...
        exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(5,2) = -Ss*exp(-i*kxx*a/sqrt(3)) + ...
        (1/2)*exp(i*kxx*a/(2*sqrt(3)))*(-Ss+3*Sp)*cos(kyy*a/2);
    S(5,3) = -i*(sqrt(3)/2)*(Sp+Ss)*...
        exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(5,5) = 1;  
    S(6,1) = i*sqrt(3)*Ssp*exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(6,2) = -i*(sqrt(3)/2)*(Ss+Sp)*...
        exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(6,3) = exp(-i*kxx*a/sqrt(3))*Sp + ...
        (1/2)*exp(i*kxx*a/(2*sqrt(3)))*(-3*Ss + Sp)*cos(kyy*a/2);
    S(6,6) = 1;
    [V,D] = eig(H,S);
    E_1(n) = D(1,1);
    E_2(n) = D(2,2);
    E_3(n) = D(3,3);
    E_4(n) = D(4,4);
    E_5(n) = D(5,5);
    E_6(n) = D(6,6);
end
plot(E_1,'color','k','LineWidth',1.5)
hold on
plot(E_2,'color','k','LineWidth',1.5)
hold on
plot(E_3,'color','k','LineWidth',1.5)
hold on
plot(E_4,'color','k','LineWidth',1.5)
hold on
plot(E_5,'color','k','LineWidth',1.5)
hold on
plot(E_6,'color','k','LineWidth',1.5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Gamma to M                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for n=31:60
    kxx = (2*pi/(sqrt(3)*a))*((n-30)/30);
    kyy = (0*n);
    H=zeros(6);
    H(1,1) = E2s;
    H(1,4) = Hss*(exp(i*kxx*(a/sqrt(3))) ...
        + 2*exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(1,5) = Hsp*(-exp(i*kxx*(a/sqrt(3))) ...
        + exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(1,6) = -i*sqrt(3)*Hsp*exp(-i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    H(2,4) = Hsp*(exp(i*kxx*(a/sqrt(3))) ...
        - exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(2,5) = -Hs*exp(i*kxx*a/sqrt(3)) ...
        + (1/2)*exp(-i*kxx*a/(2*sqrt(3)))*(-Hs+3*Hp)*cos(kyy*a/2);
    H(2,6) = i*(sqrt(3)/2)*(Hs+Hp)...
        *exp(-i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(3,4) = i*sqrt(3)*Hsp*exp(-i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    H(3,5) = i*(sqrt(3)/2)*(Hp+Hs)...
        *exp(-i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(3,6) = exp(i*kxx*a/sqrt(3))*Hp ...
        + (1/2)*exp(-i*kxx*a/(2*sqrt(3)))*(-3*Hs + Hp)*cos(kyy*a/2);
    H(4,1) = Hss*(exp(-i*kxx*(a/sqrt(3))) ...
        + 2*exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(4,2) = Hsp*(exp(-i*kxx*(a/sqrt(3))) ...
        - exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(4,3) = -i*sqrt(3)*Hsp*exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(4,4) = E2s; 
    H(5,1) = Hsp*(-exp(-i*kxx*(a/sqrt(3))) ...
        + exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(5,2) = -Hs*exp(-i*kxx*a/sqrt(3)) ...
        + (1/2)*exp(i*kxx*a/(2*sqrt(3)))*(-Hs+3*Hp)*cos(kyy*a/2);
    H(5,3) = -i*(sqrt(3)/2)*(Hp+Hs)...
        *exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(6,1) = i*sqrt(3)*Hsp*exp(i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    H(6,2) = -i*(sqrt(3)/2)*(Hs+Hp)*...
        exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(6,3) = exp(-i*kxx*a/sqrt(3))*Hp + ...
        (1/2)*exp(i*kxx*a/(2*sqrt(3)))*(-3*Hs + Hp)*cos(kyy*a/2);
    S=zeros(6);
    S(1,1) = 1;
    S(1,4) = Sss*(exp(i*kxx*(a/sqrt(3))) + ...
        2*exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(1,5) = Ssp*(-exp(i*kxx*(a/sqrt(3))) + ...
        exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(1,6) = -i*sqrt(3)*Ssp*exp(-i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    S(2,2) = 1;
    S(2,4) = Ssp*(exp(i*kxx*(a/sqrt(3))) - ...
        exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(2,5) = -Ss*exp(i*kxx*a/sqrt(3)) + ...
        (1/2)*exp(-i*kxx*a/(2*sqrt(3)))*...
        (-Ss+3*Sp)*cos(kyy*a/2);
    S(2,6) = i*(sqrt(3)/2)*(Ss+Sp)*...
        exp(-i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(3,3) = 1;
    S(3,4) = i*sqrt(3)*Ssp*exp(-i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    S(3,5) = i*(sqrt(3)/2)*(Sp+Ss)*...
        exp(-i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(3,6) = exp(i*kxx*a/sqrt(3))*Sp + ...
        (1/2)*exp(-i*kxx*a/(2*sqrt(3)))*(-3*Ss + Sp)*cos(kyy*a/2);
    S(4,1) = Sss*(exp(-i*kxx*(a/sqrt(3))) +...
        2*exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(4,2) = Ssp*(exp(-i*kxx*(a/sqrt(3))) ...
        - exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(4,3) = -i*sqrt(3)*Ssp*exp(i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    S(4,4) = 1;
    S(5,1) = Ssp*(-exp(-i*kxx*(a/sqrt(3))) + ...
        exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(5,2) = -Ss*exp(-i*kxx*a/sqrt(3)) + ...
        (1/2)*exp(i*kxx*a/(2*sqrt(3)))*(-Ss+3*Sp)*cos(kyy*a/2);
    S(5,3) = -i*(sqrt(3)/2)*(Sp+Ss)*...
        exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(5,5) = 1;
    S(6,1) = i*sqrt(3)*Ssp*exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(6,2) = -i*(sqrt(3)/2)*(Ss+Sp)*...
        exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(6,3) = exp(-i*kxx*a/sqrt(3))*Sp + ...
        (1/2)*exp(i*kxx*a/(2*sqrt(3)))*(-3*Ss + Sp)*cos(kyy*a/2);
    S(6,6) = 1;
    [V,D] = eig(H,S);
    E_1(n) = D(1,1);
    E_2(n) = D(2,2);
    E_3(n) = D(3,3);
    E_4(n) = D(4,4);
    E_5(n) = D(5,5);
    E_6(n) = D(6,6);
end
plot(E_1,'color','k','LineWidth',1.5)
hold on
plot(E_2,'color','k','LineWidth',1.5)
hold on
plot(E_3,'color','k','LineWidth',1.5)
hold on
plot(E_4,'color','k','LineWidth',1.5)
hold on
plot(E_5,'color','k','LineWidth',1.5)
hold on
plot(E_6,'color','k','LineWidth',1.5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            M to K                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for n=61:80
    kxx = (2*pi/(sqrt(3)*a));
    kyy = ((2*pi/(3*a))*((n-60)/20));
        H=zeros(6);
    H(1,1) = E2s;
    H(1,4) = Hss*(exp(i*kxx*(a/sqrt(3))) ...
        + 2*exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(1,5) = Hsp*(-exp(i*kxx*(a/sqrt(3))) ...
        + exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(1,6) = -i*sqrt(3)*Hsp*exp(-i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    H(2,4) = Hsp*(exp(i*kxx*(a/sqrt(3))) ...
        - exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(2,5) = -Hs*exp(i*kxx*a/sqrt(3)) ...
        + (1/2)*exp(-i*kxx*a/(2*sqrt(3)))*(-Hs+3*Hp)*cos(kyy*a/2);
    H(2,6) = i*(sqrt(3)/2)*(Hs+Hp)...
        *exp(-i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(3,4) = i*sqrt(3)*Hsp*exp(-i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    H(3,5) = i*(sqrt(3)/2)*(Hp+Hs)...
        *exp(-i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(3,6) = exp(i*kxx*a/sqrt(3))*Hp ...
        + (1/2)*exp(-i*kxx*a/(2*sqrt(3)))*(-3*Hs + Hp)*cos(kyy*a/2);
    H(4,1) = Hss*(exp(-i*kxx*(a/sqrt(3))) ...
        + 2*exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(4,2) = Hsp*(exp(-i*kxx*(a/sqrt(3))) ...
        - exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(4,3) = -i*sqrt(3)*Hsp*exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(4,4) = E2s;
    H(5,1) = Hsp*(-exp(-i*kxx*(a/sqrt(3))) ...
        + exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    H(5,2) = -Hs*exp(-i*kxx*a/sqrt(3)) ...
        + (1/2)*exp(i*kxx*a/(2*sqrt(3)))*(-Hs+3*Hp)*cos(kyy*a/2);
    H(5,3) = -i*(sqrt(3)/2)*(Hp+Hs)...
        *exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(6,1) = i*sqrt(3)*Hsp*exp(i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    H(6,2) = -i*(sqrt(3)/2)*(Hs+Hp)*...
        exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    H(6,3) = exp(-i*kxx*a/sqrt(3))*Hp + ...
        (1/2)*exp(i*kxx*a/(2*sqrt(3)))*(-3*Hs + Hp)*cos(kyy*a/2);
    S=zeros(6);
    S(1,1) = 1;
    S(1,4) = Sss*(exp(i*kxx*(a/sqrt(3))) + ...
        2*exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(1,5) = Ssp*(-exp(i*kxx*(a/sqrt(3))) + ...
        exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(1,6) = -i*sqrt(3)*Ssp*exp(-i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    S(2,2) = 1;
    S(2,4) = Ssp*(exp(i*kxx*(a/sqrt(3))) - ...
        exp(-i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(2,5) = -Ss*exp(i*kxx*a/sqrt(3)) + ...
        (1/2)*exp(-i*kxx*a/(2*sqrt(3)))*...
        (-Ss+3*Sp)*cos(kyy*a/2);
    S(2,6) = i*(sqrt(3)/2)*(Ss+Sp)*...
        exp(-i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(3,3) = 1;
    S(3,4) = i*sqrt(3)*Ssp*exp(-i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    S(3,5) = i*(sqrt(3)/2)*(Sp+Ss)*...
        exp(-i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(3,6) = exp(i*kxx*a/sqrt(3))*Sp + ...
        (1/2)*exp(-i*kxx*a/(2*sqrt(3)))*(-3*Ss + Sp)*cos(kyy*a/2);
    S(4,1) = Sss*(exp(-i*kxx*(a/sqrt(3))) +...
        2*exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(4,2) = Ssp*(exp(-i*kxx*(a/sqrt(3))) ...
        - exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(4,3) = -i*sqrt(3)*Ssp*exp(i*kxx*a/...
        (2*sqrt(3)))*sin(kyy*a/2);
    S(4,4) = 1;
    S(5,1) = Ssp*(-exp(-i*kxx*(a/sqrt(3))) + ...
        exp(i*kxx*(a/(2*sqrt(3))))*cos(kyy*a/2));
    S(5,2) = -Ss*exp(-i*kxx*a/sqrt(3)) + ...
        (1/2)*exp(i*kxx*a/(2*sqrt(3)))*(-Ss+3*Sp)*cos(kyy*a/2);
    S(5,3) = -i*(sqrt(3)/2)*(Sp+Ss)*...
        exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(5,5) = 1;
    S(6,1) = i*sqrt(3)*Ssp*exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(6,2) = -i*(sqrt(3)/2)*(Ss+Sp)*...
        exp(i*kxx*a/(2*sqrt(3)))*sin(kyy*a/2);
    S(6,3) = exp(-i*kxx*a/sqrt(3))*Sp + ...
        (1/2)*exp(i*kxx*a/(2*sqrt(3)))*(-3*Ss + Sp)*cos(kyy*a/2);
    S(6,6) = 1;  
    [V,D] = eig(H,S);
    E_1(n) = D(1,1);
    E_2(n) = D(2,2);
    E_3(n) = D(3,3);
    E_4(n) = D(4,4);
    E_5(n) = D(5,5);
    E_6(n) = D(6,6);
end
plot(E_1,'color','k','LineWidth',1.5)
hold on
plot(E_2,'color','k','LineWidth',1.5)
hold on
plot(E_3,'color','k','LineWidth',1.5)
hold on
plot(E_4,'color','k','LineWidth',1.5)
hold on
plot(E_5,'color','k','LineWidth',1.5)
hold on
plot(E_6,'color','k','LineWidth',1.5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Pi Bands                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
clear figure
a = 2.46*10^(-10);          % real lattice constant
t = -3.033; s = 0.129;      % Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             K to Gamma                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for n=1:30
    kxx = (2*pi/(sqrt(3)*a))*(1-((n-1)/30));
    kyy = ((2*pi/(3*a))*(1-((n-1)/30)));
    fk = exp(1i*kxx*(a/sqrt(3))) + ...
        2*exp(-1i*kxx*(a/(2*sqrt(3))))*cos(kyy*(a/2));
    fk_conj = exp(-1i*kxx*(a/sqrt(3))) ...
        + 2*exp(1i*kxx*(a/(2*sqrt(3))))*cos(kyy*(a/2));
    H=zeros(2);
    H(1,2) = t*fk;
    H(2,1) = t*fk_conj;
    S=ones(2);
    S(1,2) = s*fk;
    S(2,1) = s*fk_conj;
    [V,D] = eig(H,S);
    E_1(n) = D(1,1);
    E_2(n) = D(2,2);  
end
plot(E_1,'color','k','LineWidth',1.5)
hold on
plot(E_2,'color','k','LineWidth',1.5)
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Gamma to M                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for n=31:60
    kxx = (2*pi/(sqrt(3)*a))*((n-30)/30);
    kyy = (0*n);
    fk = exp(1i*kxx*(a/sqrt(3))) + ...
        2*exp(-1i*kxx*(a/(2*sqrt(3))))*cos(kyy*(a/2));
    fk_conj = exp(-1i*kxx*(a/sqrt(3))) ...
        + 2*exp(1i*kxx*(a/(2*sqrt(3))))*cos(kyy*(a/2));    
    H=zeros(2);
    H(1,2) = t*fk;
    H(2,1) = t*fk_conj;    
    S=ones(2);
    S(1,2) = s*fk;
    S(2,1) = s*fk_conj;    
    [V,D] = eig(H,S);
    E_1(n) = D(1,1);
    E_2(n) = D(2,2);
end
plot(E_1,'color','k','LineWidth',1.5)
hold on
plot(E_2,'color','k','LineWidth',1.5)
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             M to K                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for n=61:80
    kxx = (2*pi/(sqrt(3)*a));
    kyy = ((2*pi/(3*a))*((n-60)/20));
    fk = exp(1i*kxx*(a/sqrt(3))) + ...
        2*exp(-1i*kxx*(a/(2*sqrt(3))))*cos(kyy*(a/2));
    fk_conj = exp(-1i*kxx*(a/sqrt(3))) ...
        + 2*exp(1i*kxx*(a/(2*sqrt(3))))*cos(kyy*(a/2));    
    H=zeros(2);
    H(1,2) = t*fk;
    H(2,1) = t*fk_conj;   
    S=ones(2);
    S(1,2) = s*fk;
    S(2,1) = s*fk_conj;    
    [V,D] = eig(H,S);
    E_1(n) = D(1,1);
    E_2(n) = D(2,2);
end
plot(E_1,'color','r','LineWidth',1.5)
hold on
plot(E_2,'color','r','LineWidth',1.5)
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Graph Settin               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
title('Graphene Band diagram for High Symmetry K points','FontSize'...
    ,10,'FontWeight','bold')
mylabelx=[0.5, 30.5 , 60.5,78, 33, 33, 33 , 33 , 33 , 33 ];
mylabely=[-19.5,-19.5,-19.5,-19.5, -8 , 14.5, -17 , -3 ,1.7, 28 ];
labels = {'K','\Gamma','M','K', '\pi', '\pi*' ,'\sigma', ...
    '\sigma' , '\sigma*' , '\sigma*' };
text(mylabelx,mylabely,labels,'VerticalAlignment',...
    'bottom','FontSize',10,'FontWeight','bold')
ylabel('Energy (eV)','FontSize',10,'FontWeight','bold')
xlabel('High Symmetry k Points','FontSize',10,'FontWeight','bold')
xline(30)
xline(60)
xline(80)
yline(0, 'g')
set(gca,'XTick',[])

close all
clear all
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
%                     Graphene 3D Dispersion Relation                     %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a_real = 2.46;
t = -3.033;
s=0.129;
x=linspace(0.5*(2*pi/(sqrt(3)*a_real)) ,1.5*(2*pi/(sqrt(3)*a_real)),1000);
y=linspace(0.5*(2*pi/(3*a_real)),1.5*(2*pi/(3*a_real)),1000);
[a,b]=meshgrid(x,y);
E_bonding= t*sqrt(1+4*cos(a*a_real*sqrt(3)/2).*cos(b*a_real/2)+4*(cos(b*a_real/2)).^2)./(1+s*sqrt(1+4*cos(a*a_real*sqrt(3)/2).*cos(b*a_real/2)+4*(cos(b*a_real/2)).^2));
E_antibonding=-t*sqrt(1+4*cos(a*a_real*sqrt(3)/2).*cos(b*a_real/2)+4*(cos(b*a_real/2)).^2)./(1-s*sqrt(1+4*cos(a*a_real*sqrt(3)/2).*cos(b*a_real/2)+4*(cos(b*a_real/2)).^2));
figure
mesh(a,b,E_bonding)
title('Energy dispersion relation of graphene')
xlabel('k_{x}'),ylabel('k_{y}'),zlabel('Energy (eV)')
hold on
mesh(a,b,E_antibonding)
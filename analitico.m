clc 
clearvars
%Ti`
m0 = (-6.5) * (10^-3);
%zi 
z0 = 0;
z1 = 11000;
%t
t0 = 288.15;
t1 = 216.65;
%Datos 
g0 = 9.807;
R = 287.05;
zp = 50000;
z_v = linspace(0,zp,zp);
tz = zeros(size(z_v));
roz = zeros(size(z_v));
vz =  zeros(size(z_v));
pz =  zeros(size(z_v));
ae = 1.4;
%presiones 
pi = 101300;
pi1 = pi*((t1/t0)^((-g0/(R*m0))));
%z a m
z = z_v*0.3048;
for i = 1:zp
  n = z(1,i);
     if n <= 11000
tz(1,i) = t0 + m0*((z(1,i)) - z0);
pz(1,i) = pi*(((tz(1,i))/t0)^((-g0/(R*m0))));
roz(1,i) = (pz(1,i))/(R*t0);
vz(1,i) = sqrt(ae*R*(tz(1,i)));
     else
tz(1,i) = t0 + m0*(11000 - z0);
pz(1,i) = pi1*(exp((-g0/(R*(tz(1,i))))*((z(1,i))-z1)));
roz(1,i) = (pz(1,i))/(R*t0);
vz(1,i) = sqrt(ae*R*(tz(1,i)));
  end
  end
%conv
tc = tz -273;
ph = pz*0.0002953;
vk = vz * 0.001;


figure(1)
hold on

yyaxis left
plot(z_v,tc,':k');
plot(z_v,ph,'--b');
xlabel('Height [ft]','FontName','Times New Roman')
ylabel('Temperature [°C], Pressure [inHg]','FontName','Times New Roman');
xlim([0 50000])
ylim([-70 40])
yyaxis right
plot(z_v,vk,'-.r');
plot(z_v,roz,'-k');
xlabel('Height [ft]','FontName','Times New Roman')
legend('Temperature','Pressure','Speed of Sound','Density','FontName','Times New Roman');
ylabel ('Speed of Sound [km/s], Density [kg/m^3]','FontName','Times New Roman');
hold off

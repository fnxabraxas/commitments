
function []=plottime()


fileinp={'SD_b2_e-999_epsi0.25_delta4_00.dat'; 'SD_eAF0.01_g0.5_b2_e-999_epsi0.25_delta4_00.dat'; 'SD_eAF0.01_g2_b2_e-999_epsi0.25_delta4_00.dat'; 'SD_eAF0.01_g4_b2_e-999_epsi0.25_delta4_00.dat'};

colTC=[ 24 35 35 35 ];
colNC=[ 25 36 36 36 ];
cST=['k' 'r' 'b' 'm' 'g' ];
sST=['o' '+' '*' 'd' 'v' ];

leg={'NA'; '\gamma = 0.5'; '\gamma = 2'; '\gamma = 4' };
tit=['b= 2,   $\epsilon$= 0.25,   $\delta$= 4'];
xcol=1;

h=figure(1); clf('reset'); set(h,'defaulttextinterpreter','latex'); 

subplot(2,2,1);
xlabel('$\alpha$');
ylabel('$< R_C / R_T >$');
title(tit);
xlim([0.0005  0.31]);
ylim([0  1]);
%set(gca,'FontSize',8)
hold all;
for i=1:length(fileinp)
  cd data
  INPM=importdata(fileinp{i},' ',2);
  cd ..
  h=semilogx(INPM.data(:,xcol),INPM.data(:,colTC(i)),[cST(i) sST(i) '-']);
  set(gca,'xscale','log');
  set(h,'MarkerSize',2);
end
legend(leg,'Location','NorthEast');
set(gca,'FontSize',7);
set(findall(gcf,'type','text'),'FontSize',7);


subplot(2,2,2);
xlabel('$\alpha$');
ylabel('$< R_C / R_T >$');
title(tit);
xlim([0.0005  0.31]);
ylim([0  1]);
%set(gca,'FontSize',8)
hold all;
for i=1:length(fileinp)
  cd data
  INPM=importdata(fileinp{i},' ',2);
  cd ..
  h=semilogx(INPM.data(:,xcol),INPM.data(:,colTC(i))./INPM.data(:,colNC(i)),[cST(i) sST(i) '-']);
  [INPM.data(:,colTC(i)) INPM.data(:,colNC(i)) INPM.data(:,colTC(i))./INPM.data(:,colNC(i))]
  set(gca,'xscale','log');
  set(h,'MarkerSize',2);
end
legend(leg,'Location','SouthWest');
set(gca,'FontSize',7);
set(findall(gcf,'type','text'),'FontSize',7);


subplot(2,2,3);
xlabel('$\alpha$');
ylabel('$ f_C $');
title(tit);
xlim([0.0005  0.31]);
ylim([0  1]);
%set(gca,'FontSize',8)
hold all;
for i=1:length(fileinp)
  cd data
  INPM=importdata(fileinp{i},' ',2);
  cd ..
  h=semilogx(INPM.data(:,xcol),INPM.data(:,colNC(i)),[cST(i) sST(i) '-']);
  [INPM.data(:,colTC(i)) INPM.data(:,colNC(i)) INPM.data(:,colTC(i))./INPM.data(:,colNC(i))]
  set(gca,'xscale','log');
  set(h,'MarkerSize',2);
end
legend(leg,'Location','NorthEast');
set(gca,'FontSize',7);
set(findall(gcf,'type','text'),'FontSize',7);



filenameps=['time_a.ps'];
print ('-dpsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);



end
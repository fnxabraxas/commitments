
function []=plottime()


fileinp={ 'SD_eAF0.01_g-999_b1.5_e0.1_epsi0.25_delta4_00.dat'; 'SD_eAF0.01_g-999_b2_e0.1_epsi0.25_delta4_00.dat'; 'SD_eAF0.01_g-999_b4_e0.1_epsi0.25_delta4_00.dat'};

colTC=[ 35 35 35 35 35 35];
colNC=[ 36 36 36 36 36 36];
cST=[ 'r' 'b' 'g' 'r' 'b' 'g' ];
sST=[ '+' '*' 'd' '+' '*' 'd' ];

leg={'b = 1.5'; 'b = 2'; 'b = 4' };
tit=['$\alpha=0.1$,   $\epsilon$= 0.25,   $\delta$= 4'];
xcol=6;

h=figure(1); clf('reset'); set(h,'defaulttextinterpreter','latex'); 

subplot(2,2,1);
xlabel('$\gamma$');
ylabel('$< R_C / R_T >$');
title(tit);
xlim([0 8]);
ylim([0  1]);
%set(gca,'FontSize',8)
hold all;
for i=1:length(fileinp)
  cd data
  INPM=importdata(fileinp{i},' ',2);
  cd ..
  h=plot(INPM.data(:,xcol),INPM.data(:,colTC(i)),[cST(i) sST(i) '-']);
  set(h,'MarkerSize',2);
end
legend(leg,'Location','NorthEast');
set(gca,'FontSize',7);
set(findall(gcf,'type','text'),'FontSize',7);


subplot(2,2,2);
xlabel('$\gamma$');
ylabel('$< R_C / R_T >$');
title(tit);
xlim([0 8]);
ylim([0  1]);
%set(gca,'FontSize',8)
hold all;
for i=1:length(fileinp)
  cd data
  INPM=importdata(fileinp{i},' ',2);
  cd ..
  h=plot(INPM.data(:,xcol),INPM.data(:,colTC(i))./INPM.data(:,colNC(i)),[cST(i) sST(i) '-']);
  set(h,'MarkerSize',2);
end
legend(leg,'Location','SouthWest');
set(gca,'FontSize',7);
set(findall(gcf,'type','text'),'FontSize',7);


subplot(2,2,3);
xlabel('$\gamma$');
ylabel('$ f_C $');
title(tit);
xlim([0 8]);
ylim([0  1]);
%set(gca,'FontSize',8)
hold all;
for i=1:length(fileinp)
  cd data
  INPM=importdata(fileinp{i},' ',2);
  cd ..
  h=plot(INPM.data(:,xcol),INPM.data(:,colNC(i)),[cST(i) sST(i) '-']);
  set(h,'MarkerSize',2);
end
legend(leg,'Location','NorthEast');
set(gca,'FontSize',7);
set(findall(gcf,'type','text'),'FontSize',7);



filenameps=['time_g.ps'];
print ('-dpsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);



end
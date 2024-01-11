
function []=apology()


h=figure(1); clf('reset'); set(h,'defaulttextinterpreter','latex'); 


xcol=6;
file='data/SD_eAF0.01_g-999_b2_e0.1_epsi0_delta0_00.dat';
cST=[ 'b' 'b' 'r' 'c' ];
sST=[ 'o' 'o' '*' 'd' ];
lST={ '-' ' ' '-' '-'};
leg={'(P,C,-,Apo)'; '(P,C,-,NApo)'; '(P,D,-,Apo)'; '(A,D,AllD,Apo)'};
colS=[15  5 16 22 ] + 6;
colNC= 2  + 6;
subplot('Position',[0.05 0.05 0.25 0.3]);
xlabel('$\gamma$','Fontsize',6);
ylabel('$Pr(S) - Pr(NC,-,AllD,-)$','Fontsize',6);
xlim([0 8]);
ylim([-0.2  0.5]);
hold all;
INPM=importdata(file,' ',2);
for i=1:length(colS)
  h=plot(INPM.data(:,xcol),INPM.data(:,colS(i))-INPM.data(:,colNC),[cST(i) sST(i) lST{i}]);
  set(h,'MarkerSize',2);
end
legend(leg,'Location','NorthEast');
plot([-1 9],[0 0],'k.--');
plot([1 1],[-1 1],'g.-.');
plot([4 4],[-1 1],'g.-.');
set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
text(0.5,0.45,'{\bf NN}','FontSize',10);


xcol=6;
file='data/SD_eAF0.01_g-999_b2_e0.1_epsi0_delta0_11.dat';
cST=[ 'b' 'b' 'r' 'c' ];
sST=[ 'o' 'o' '*' 'd' ];
lST={ '-' ' ' '-' '-'};
leg={'(P,C,AllD,Apo)'; '(P,C,AllD,NApo)'; '(P,D,AllD,Apo)'; '(A,D,AllD,Apo)'};
colS=[22  6 26 34 ] + 6;
colNC= 2  + 6;
subplot('Position',[0.41 0.05 0.25 0.3]);
xlabel('$\gamma$','Fontsize',6);
ylabel('$Pr(S) - Pr(NC,-,AllD,-)$','Fontsize',6);
xlim([0 8]);
ylim([-0.1001  0.4001]);
hold all;
INPM=importdata(file,' ',2);
for i=1:length(colS)
  h=plot(INPM.data(:,xcol),INPM.data(:,colS(i))-INPM.data(:,colNC),[cST(i) sST(i) lST{i}]);
  set(h,'MarkerSize',2);
end
legend(leg,'Location','NorthEast');
plot([-1 9],[0 0],'k.--');
plot([1 1],[-1 1],'g.-.');
plot([4 4],[-1 1],'g.-.');
set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
text(0.5,0.36,'{\bf PP}','FontSize',10);


fileinp={'data/SD_eAF0.01_g-999_b2_e0.1_epsi0_delta0_00.dat';'data/SD_eAF0.01_g-999_b2_e0.1_epsi0_delta0_11.dat'};
xcol=6;
colSUB=[5 3];
cST=['r' 'b' ];
sST=['+' 'v' ];
leg={'Coop  {\bfNN}';'Def  '; 'Coop  {\bfPP}'; 'Def   ' };
subplot('Position',[0.75 0.05 0.25 0.3]);
xlabel('$\gamma$','Fontsize',6);
ylabel('Level','Fontsize',6);
xlim([0  8]);
ylim([0  0.9]);
hold all;
for i=1:length(fileinp)
  INPM=importdata(fileinp{i},' ',2);
  [nump,nS]=size(INPM.data);
  h=plot(INPM.data(:,xcol),INPM.data(:,nS-colSUB(i)),[cST(i) sST(i) '-']);
  set(h,'MarkerSize',2);
  h=plot(INPM.data(:,xcol),INPM.data(:,nS-colSUB(i)+1),[cST(i) sST(i) ]);
  set(h,'MarkerSize',2);

end
[LEGH,OBJH,OUTH,OUTM]=legend(leg,'Location','NorthEast');
%set(findall(gcf,'type','text'),'FontSize',6);
%set(findall(LEGH,'type','text'),'FontSize',4);
plot([-1 9],[0 0],'k.--');
plot([1 1],[-1 1],'g.-.');
plot([4 4],[-1 1],'g.-.');
set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);


clear;
filenameps=['apology00.ps'];
print ('-dpsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);



end

function []=treatments()


xcol=1;
h=figure(1); clf('reset'); set(h,'defaulttextinterpreter','latex'); 

cST=['r' 'm' 'g' 'b' 'k'];
sST=['+' '*' 'd' 'v' '.'];
leg={'AllD  {\bfNN}'; 'AllD  {\bfPN}'; 'TFT   '; 'AllD  {\bfNP}'; 'TFT   '; 'AllD  {\bfPP}'; 'TFT   ' };
fileinp={'data/SD_b2_e-999_epsi0_delta0_00.dat'; 'data/SD_b2_e-999_epsi0_delta0_10.dat'; 'data/SD_b2_e-999_epsi0_delta0_01.dat'; 'data/SD_b2_e-999_epsi0_delta0_11.dat'; 'data/SD_b2_e-999_epsi0.25_delta4_nocom.dat'};
colP=[ 1 2 2 2 ] + 5;
colPTFT=[0 4 4 4] + 5;
colNC=[ 12 18 18 18 ] + 5;
subplot('Position',[0.05 0.05 0.25 0.3]);
xlabel('$\alpha$');
ylabel('$Pr(P,C,S_{out}) - Pr(NC,-,AllD)$');
xlim([0.0005  0.31]);
ylim([-0.4001  0.40001]);
hold all;
for i=1:length(colP)
  INPM=importdata(fileinp{i},' ',2);
  h=semilogx(INPM.data(:,xcol),INPM.data(:,colP(i))-INPM.data(:,colNC(i)),[cST(i) sST(i) '-']);
  set(h,'MarkerSize',2);
  if (colPTFT(i)>0+5) h=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC(i)),[cST(i) sST(i) ]);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log');
end
legend(leg,'Location','SouthWest');
semilogx([1e-10 1.2],[0 0],'k.--');
set(gca,'xscale','log');
set(gca,'FontSize',6);
set(findall(gcf,'type','text'),'FontSize',6);


cST=['r' 'm' 'g' 'b' 'k'];
sST=['+' '*' 'd' 'v' '.'];
leg={'AllD  {\bfNN}'; 'AllD  {\bfPN}'; 'TFT   '; 'AllD  {\bfNP}'; 'TFT   '; 'AllD  {\bfPP}'; 'TFT   ' };
filetogether='data/SD_b2_e-999_epsi0_delta0.dat';
colP=[1  26+2 10+2 42+2 ] + 5;
colPTFT=[0  26+4 10+4 42+4 ] + 5;
colNC= 42+18  + 5;
subplot('Position',[0.41 0.05 0.25 0.3]);
xlabel('$\alpha$');
ylabel('$Pr(P,C,S_{out}) - Pr(NC,-,AllD)$');
xlim([0.0005  0.31]);
%ylim([0  0.05]);
hold all;
INPM=importdata(filetogether,' ',2);
for i=1:length(colP)
  h=semilogx(INPM.data(:,xcol),INPM.data(:,colP(i))-INPM.data(:,colNC),[cST(i) sST(i) '-']);
  set(h,'MarkerSize',2);
  if (colPTFT(i)>0+5) h=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC),[cST(i) sST(i) ]);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log');
end
legend(leg,'Location','SouthWest');
semilogx([1e-10 1.2],[0 0],'k.--');
set(gca,'xscale','log');
set(gca,'FontSize',6);
set(findall(gcf,'type','text'),'FontSize',6);


cST=['r' 'm' 'g' 'b' 'k'];
sST=['+' '*' 'd' 'v' '.'];
leg={'Coop  {\bfNN}';'Def  '; 'Coop  {\bfPN}'; 'Def   '; 'Coop  {\bfNP}'; 'Def   '; 'Coop  {\bfPP}'; 'Def   '; 'Coop  {\bfNo com}'; 'Def   ' };
colC=[21-6 21 21 21 5] + 5;
subplot('Position',[0.75 0.05 0.25 0.3]);
xlabel('$\alpha$');
ylabel('Level');
xlim([0.0005  0.31]);
ylim([-0.2001  0.85]);
hold all;
for i=1:length(fileinp)
  INPM=importdata(fileinp{i},' ',2);
  h=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)),[cST(i) sST(i) '-']);
  set(h,'MarkerSize',2);
  h=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)+1),[cST(i) sST(i) ]);
  set(h,'MarkerSize',1.5);
  set(gca,'xscale','log');

end
[LEGH,OBJH,OUTH,OUTM]=legend(leg,'Location','SouthWest');
set(findall(gcf,'type','text'),'FontSize',6);
set(findall(LEGH,'type','text'),'FontSize',4);
set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);


clear;
filenameps=['treatments00.ps'];
print ('-dpsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);



end
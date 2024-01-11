
function []=apology()


h=figure(1); clf('reset'); %set(h,'defaulttextinterpreter','latex'); 


xcol=6;
file='data/SD_eAF20.7_g-999_b2_e0.01_epsi0.25_delta4_11.dat';
cST=[ 'b' 'b' 'r' 'c' ];
sST=[ 'o' 'o' '*' 'd' ];
lST={ '-' '-- ' '-' '-'};
colS=[22  6 26 34 ] + 6;
colNC= 2  + 6;
subplot('Position',[0.1 0.3 0.35 0.4]);
xlabel('\gamma');
ylabel('Fr(S) - Fr(NC,-,AllD,-)');
xlim([0 8]);
ylim([-0.1001  0.4001]);
hold all;
INPM=importdata(file,' ',2);
for i=1:length(colS)
  h=plot(INPM.data(:,xcol),INPM.data(:,colS(i))-INPM.data(:,colNC),[cST(i) lST{i}]);
  set(h,'MarkerSize',2);
end
%legend(leg,'Location','NorthEast');
plot([-1 9],[0 0],'k.--');
plot([1 1],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
plot([4 4],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
h1=text(6,0.36,'{\alpha=0.01}');

set(findall(gcf,'type','text'),'FontSize',14);
set(gca,'FontSize',14)

xcol=6;
file='data/SD_eAF20.7_g-999_b2_e0.1_epsi0.25_delta4_11.dat';
cST=[ 'b' 'b' 'r' 'c' ];
sST=[ 'o' 'o' '*' 'd' ];
lST={ '-' '-- ' '-' '-'};
colS=[22  6 26 34 ] + 6;
colNC= 2  + 6;
subplot('Position',[0.6 0.3 0.35 0.4]);
xlabel('\gamma');
ylabel('Fr(S) - Fr(NC,-,AllD,-)');
xlim([0 8]);
ylim([-0.1001  0.4001]);
hold all;
INPM=importdata(file,' ',2);
for i=1:length(colS)
  h(i)=plot(INPM.data(:,xcol),INPM.data(:,colS(i))-INPM.data(:,colNC),[cST(i)  lST{i}]);
  set(h,'MarkerSize',2);
end
%legend(leg,'Location','NorthEast');
plot([-1 9],[0 0],'k.--');
plot([1 1],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
plot([4 4],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
set(gca,'FontSize',14);
%set(findall(gcf,'type','text'),'FontSize',6);
h2=text(6,0.36,'{\alpha=0.1}');


leg={'(P,C,AllD,q=1) { }'; '(P,C,AllD,q=0) { }'; '(P,D,AllD,q=1) { }'; '(A,D,AllD,q=1) { }'};
gridLegend(h,4,leg,'Orientation','Vertical','Fontsize',14,'location','northoutside');
%[LEGH,OBJH,OUTH,OUTM]=legend(leg,'Location','SouthWest');
set(findall(gcf,'type','text'),'FontSize',14);
%set(findall(LEGH,'type','text'),'FontSize',18);
set(gca,'FontSize',14)

set(h1,'FontSize',14);
set(h2,'FontSize',14);


clear;
filenameps=['apology_e_F_eAF20.7.eps'];
print ('-depsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);




h=figure(1); clf('reset'); %set(h,'defaulttextinterpreter','latex'); 


xcol=6;
file='data/SD_eAF20.7_g-999_b2_e0.1_epsi0.25_delta4_00.dat';
cST=[ 'b' 'b' 'r' 'c' ];
sST=[ 'o' 'o' '*' 'd' ];
lST={ '-' '-- ' '-' '-'};
colS=[15  5 16 22 ] + 6;
colNC= 2  + 6;
subplot('Position',[0.1 0.3 0.35 0.4]);
xlabel('\gamma');
ylabel('Fr(S) - Fr(NC,-,AllD,-)');
xlim([0 8]);
ylim([-0.1001  0.4001]);
hold all;
INPM=importdata(file,' ',2);
for i=1:length(colS)
  h=plot(INPM.data(:,xcol),INPM.data(:,colS(i))-INPM.data(:,colNC),[cST(i) lST{i}]);
  set(h,'MarkerSize',2);
end
%legend(leg,'Location','NorthEast');
plot([-1 9],[0 0],'k.--');
plot([1 1],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
plot([4 4],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
h1=text(7,0.36,'{\bf NN}');

set(findall(gcf,'type','text'),'FontSize',14);
set(gca,'FontSize',14)

xcol=6;
file='data/SD_eAF20.7_g-999_b2_e0.1_epsi0.25_delta4_11.dat';
cST=[ 'b' 'b' 'r' 'c' ];
sST=[ 'o' 'o' '*' 'd' ];
lST={ '-' '-- ' '-' '-'};
colS=[22  6 26 34 ] + 6;
colNC= 2  + 6;
subplot('Position',[0.6 0.3 0.35 0.4]);
xlabel('\gamma');
ylabel('Fr(S) - Fr(NC,-,AllD,-)');
xlim([0 8]);
ylim([-0.1001  0.4001]);
hold all;
INPM=importdata(file,' ',2);
for i=1:length(colS)
  h(i)=plot(INPM.data(:,xcol),INPM.data(:,colS(i))-INPM.data(:,colNC),[cST(i)  lST{i}]);
  set(h,'MarkerSize',2);
end
%legend(leg,'Location','NorthEast');
plot([-1 9],[0 0],'k.--');
plot([1 1],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
plot([4 4],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
h2=text(07,0.36,'{\bf PP}');


leg={'(P,C,AllD,q=1) { }'; '(P,C,AllD,q=0) { }'; '(P,D,AllD,q=1) { }'; '(A,D,AllD,q=1) { }'};
gridLegend(h,4,leg,'Orientation','Vertical','Fontsize',14,'location','northoutside');
%[LEGH,OBJH,OUTH,OUTM]=legend(leg,'Location','SouthWest');
set(findall(gcf,'type','text'),'FontSize',14);
%set(findall(LEGH,'type','text'),'FontSize',18);
set(gca,'FontSize',14)

set(h1,'FontSize',14);
set(h2,'FontSize',14);


clear;
filenameps=['apology_F_eAF20.7.eps'];
print ('-depsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);






xcol=6;
h=figure(2); clf('reset'); %set(h,'defaulttextinterpreter','latex');

cST=['r' 'm' 'g' 'b' 'k'];
sST=['+' '*' 'd' 'v' '.'];
%leg={'{\bfNN}  ';'Coop  {    }';'Def  ';'NoP  ';'{\bfPN}  '; 'Coop  '; 'Def  ';'NoP  ';'{\bfNP}  '; 'Coop  '; 'Def  ';'NoP  ';'{\bfPP}  '; 'Coop  '; 'Def  ';'NoP  ';'{\bfNo C}  '; 'Coop  '; 'Def  ';'NoP  ' };
fileinp={'data/SD_eAF20.7_g-999_b2_e0.1_epsi0.25_delta4_00.dat';'data/SD_eAF20.7_g-999_b2_e0.1_epsi0.25_delta4_10.dat';'data/SD_eAF20.7_g-999_b2_e0.1_epsi0.25_delta4_01.dat';'data/SD_eAF20.7_g-999_b2_e0.1_epsi0.25_delta4_11.dat'};
colSUB=[5 5 5 5];


subplot('Position',[0.43 0.47 0.20 0.25]);
xlabel('\gamma');
ylabel('Level of Defection');
xlim([0  8]);
ylim([-0.05  0.85]);
hold all;
for i=1:length(fileinp)
  INPM=importdata(fileinp{i},' ',2);
  [nump,nS]=size(INPM.data);
  %h(4*i-3)=plot([0],[0],'w');
  %h(i)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)),[cST(i)  '-']);
  %set(h(4*i-2),'MarkerSize',2);
  h(i)=plot(INPM.data(:,xcol),INPM.data(:,nS-colSUB(i)+1),[cST(i)  '--']);
  set(h(i),'MarkerSize',2);
  %h(4*i)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)+2),[cST(i) ':' ]);
  %set(h(4*i),'MarkerSize',2);
  set(gca,'FontSize',14);
  set(gca,'Xtick',[0:2:8]);
end
plot([1 1],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
plot([4 4],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
text(7,0.8,'{\bfb}');

subplot('Position',[0.76 0.47 0.20 0.25]);
xlabel('\gamma');
ylabel('Level of Non-Played');
xlim([0  8]);
ylim([-0.05  0.85]);
hold all;
for i=1:length(fileinp)
  INPM=importdata(fileinp{i},' ',2);
  [nump,nS]=size(INPM.data);
  %h(4*i-3)=plot([0],[0],'w');
  %h(i)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)),[cST(i)  '-']);
  %set(h(4*i-2),'MarkerSize',2);
  %h(4*i-1)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)+1),[cST(i) '--' ]);
  %set(h(4*i-1),'MarkerSize',2);
  h(i)=plot(INPM.data(:,xcol),INPM.data(:,nS-colSUB(i)+2),[cST(i)  '-.']);
  set(h(i),'MarkerSize',2);
  set(gca,'FontSize',14);
  set(gca,'Xtick',[0:2:8]);
end
plot([1 1],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
plot([4 4],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
text(7,0.8,'{\bfc}');

subplot('Position',[0.10 0.47 0.20 0.25]);
xlabel('\gamma');
ylabel('Level of Cooperation');
xlim([0  8]);
ylim([-0.05  0.85]);
hold all;
for i=1:length(fileinp)
  INPM=importdata(fileinp{i},' ',2);
  [nump,nS]=size(INPM.data);
  %h(4*i-3)=plot([0],[0],'w');
  h(i)=plot(INPM.data(:,xcol),INPM.data(:,nS-colSUB(i)),[cST(i)  '-']);
  set(h(i),'MarkerSize',2);
  %h(4*i-1)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)+1),[cST(i) '--' ]);
  %set(h(4*i-1),'MarkerSize',2);
  %h(4*i)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)+2),[cST(i) ':' ]);
  %set(h(4*i),'MarkerSize',2);
  set(gca,'FontSize',14);
  set(gca,'Xtick',[0:2:8]);
end
plot([1 1],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
plot([4 4],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
text(7,0.8,'{\bfa}');

leg={'{\bfNN}  {   } ';'{\bfPN}  '; '{\bfNP}  ';'{\bfPP}  '; '{\bfNo Com}  {   }' };
gridLegend(h,4,leg,'Orientation','Vertical','Fontsize',14,'location','northoutside');


%[LEGH,OBJH,OUTH,OUTM]=legend(leg,'Location','SouthWest');
set(findall(gcf,'type','text'),'FontSize',14);
%set(findall(LEGH,'type','text'),'FontSize',18);
set(gca,'FontSize',14);
%set(findall(gcf,'type','text'),'FontSize',6);


clear;
filenameps=['apology_L_eAF20.7.eps'];
print ('-depsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);




h=figure(3); clf('reset'); %set(h,'defaulttextinterpreter','latex'); 


xcol=6;
file='data/SD_eAF20.7_g-999_b2_e0.1_epsi0.25_delta4_00.dat';
cST=[ 'b' 'b' 'r' 'c' ];
sST=[ 'o' 'o' '*' 'd' ];
lST={ '-' '-- ' '-' '-'};
colS=[15  5 16 22 ] + 6;
colNC= 2  + 6;
subplot('Position',[0.1 0.45 0.35 0.25]);
xlabel('\gamma');
ylabel('Fr(S) - Fr(NC,-,AllD,-)');
xlim([0 8]);
ylim([-0.1001  0.4001]);
hold all;
INPM=importdata(file,' ',2);
for i=1:length(colS)
  h=plot(INPM.data(:,xcol),INPM.data(:,colS(i))-INPM.data(:,colNC),[cST(i) lST{i}]);
  set(h,'MarkerSize',2);
end
%legend(leg,'Location','NorthEast');
plot([-1 9],[0 0],'k.--');
plot([1 1],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
plot([4 4],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
h41=text(7,0.36,'{\bf NN}');

set(findall(gcf,'type','text'),'FontSize',10);
set(gca,'FontSize',10)

xcol=6;
file='data/SD_eAF20.7_g-999_b2_e0.1_epsi0.25_delta4_10.dat';
cST=[ 'b' 'b' 'r' 'c' ];
sST=[ 'o' 'o' '*' 'd' ];
lST={ '-' '-- ' '-' '-'};
colS=[22  6 26 34 ] + 6;
colNC= 2  + 6;
subplot('Position',[0.6 0.45 0.35 0.25]);
xlabel('\gamma');
ylabel('Fr(S) - Fr(NC,-,AllD,-)');
xlim([0 8]);
ylim([-0.1001  0.4001]);
hold all;
INPM=importdata(file,' ',2);
for i=1:length(colS)
  h(i)=plot(INPM.data(:,xcol),INPM.data(:,colS(i))-INPM.data(:,colNC),[cST(i)  lST{i}]);
  set(h,'MarkerSize',2);
end
%legend(leg,'Location','NorthEast');
plot([-1 9],[0 0],'k.--');
plot([1 1],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
plot([4 4],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
h42=text(07,0.36,'{\bf PN}');

set(findall(gcf,'type','text'),'FontSize',10);
set(gca,'FontSize',10)

xcol=6;
file='data/SD_eAF20.7_g-999_b2_e0.1_epsi0.25_delta4_01.dat';
cST=[ 'b' 'b' 'r' 'c' ];
sST=[ 'o' 'o' '*' 'd' ];
lST={ '-' '-- ' '-' '-'};
colS=[22  6 26 34 ] + 6;
colNC= 2  + 6;
subplot('Position',[0.1 0.12 0.35 0.25]);
xlabel('\gamma');
ylabel('Fr(S) - Fr(NC,-,AllD,-)');
xlim([0 8]);
ylim([-0.1001  0.4001]);
hold all;
INPM=importdata(file,' ',2);
for i=1:length(colS)
  h(i)=plot(INPM.data(:,xcol),INPM.data(:,colS(i))-INPM.data(:,colNC),[cST(i)  lST{i}]);
  set(h,'MarkerSize',2);
end
%legend(leg,'Location','NorthEast');
plot([-1 9],[0 0],'k.--');
plot([1 1],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
plot([4 4],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
h43=text(07,0.36,'{\bf NP}');

set(findall(gcf,'type','text'),'FontSize',10);
set(gca,'FontSize',10)

xcol=6;
file='data/SD_eAF20.7_g-999_b2_e0.1_epsi0.25_delta4_11.dat';
cST=[ 'b' 'b' 'r' 'c' ];
sST=[ 'o' 'o' '*' 'd' ];
lST={ '-' '-- ' '-' '-'};
colS=[22  6 26 34 ] + 6;
colNC= 2  + 6;
subplot('Position',[0.6 0.12 0.35 0.25]);
xlabel('\gamma');
ylabel('Fr(S) - Fr(NC,-,AllD,-)');
xlim([0 8]);
ylim([-0.1001  0.4001]);
hold all;
INPM=importdata(file,' ',2);
for i=1:length(colS)
  h(i)=plot(INPM.data(:,xcol),INPM.data(:,colS(i))-INPM.data(:,colNC),[cST(i)  lST{i}]);
  set(h,'MarkerSize',2);
end
%legend(leg,'Location','NorthEast');
plot([-1 9],[0 0],'k.--');
plot([1 1],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
plot([4 4],[-1 1],'.-.','Color',[0.7 0.7 0.7]);
set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
h44=text(07,0.36,'{\bf PP}');


leg={'(P,C,AllD,q_{ apo}=1)'; '(P,C,AllD,q_{ apo}=0)'; '(P,D,AllD,q_{ apo}=1)'; '(A,D,AllD,q_{ apo}=1)'};
gridLegend(h,4,leg,'Orientation','Vertical','Fontsize',10,'location','northoutside');
%[LEGH,OBJH,OUTH,OUTM]=legend(leg,'Location','SouthWest');
set(findall(gcf,'type','text'),'FontSize',10);
%set(findall(LEGH,'type','text'),'FontSize',18);
set(gca,'FontSize',10)

%set(h41,'FontSize',14);
%set(h42,'FontSize',14);
%set(h43,'FontSize',14);
%set(h44,'FontSize',14);


clear;
filenameps=['apology_F4_eAF20.7.eps'];
print ('-depsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);


end







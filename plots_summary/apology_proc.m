
function []=apology()


h=figure(1); clf('reset'); %set(h,'defaulttextinterpreter','latex'); 


xcol=6;
file='data/SD_eAF0.01_g-999_b2_e0.01_epsi0.25_delta4_11.dat';
cST=[ 'b' 'b' 'r' 'k' ];
sST=[ 'o' 'o' '*' 'd' ];
lST={ '-' '-- ' '-.' ':'};
colS=[22  6 26 34 ] + 6;
colNC= 2  + 6;
subplot('Position',[0.1 0.3 0.35 0.4]);
xlabel('\gamma');
ylabel('Fr(S) - Fr(NC,-,AllD,-)');
xlim([0 8]);
ylim([-0.1001  0.3001]);
hold all;
INPM=importdata(file,' ',2);
for i=1:length(colS)
  h=plot(INPM.data(:,xcol),INPM.data(:,colS(i))-INPM.data(:,colNC),[cST(i)  lST{i}]);
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
file='data/SD_eAF0.01_g-999_b2_e0.1_epsi0.25_delta4_11.dat';
cST=[ 'b' 'b' 'r' 'k' ];
sST=[ 'o' 'o' '*' 'd' ];
lST={ '-' '-- ' '-.' ':'};
colS=[22  6 26 34 ] + 6;
colNC= 2  + 6;
subplot('Position',[0.6 0.3 0.35 0.4]);
xlabel('\gamma');
ylabel('Fr(S) - Fr(NC,-,AllD,-)');
xlim([0 8]);
ylim([-0.1001  0.3001]);
hold all;
INPM=importdata(file,' ',2);
for i=1:length(colS)
  h(i)=plot(INPM.data(:,xcol),INPM.data(:,colS(i))-INPM.data(:,colNC),[cST(i) lST{i}]);
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
filenameps=['apology_e_F_proc.eps'];
print ('-depsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);


end
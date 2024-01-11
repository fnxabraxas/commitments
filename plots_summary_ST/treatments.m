
function []=treatments()



xcol=1;
h=figure(1); clf('reset'); %set(h,'defaulttextinterpreter','latex'); 

off=0.05;

cST=['r' 'm' 'g' 'b' 'k'];
sST=['+' '*' 'd' 'v' '.'];
fileinp={'data/SD_b2_e-999_epsi0.25_delta4_00.dat'; 'data/SD_b2_e-999_epsi0.25_delta4_10.dat'; 'data/SD_b2_e-999_epsi0.25_delta4_01.dat'; 'data/SD_b2_e-999_epsi0.25_delta4_11.dat'; 'data/SD_b2_e-999_epsi0.25_delta4_nocom.dat'};
posi=[[0.1 0.3+off 0.175 0.2];[0.275 0.3+off 0.175 0.2];[0.1 0.5+off 0.175 0.2];[0.275 0.5+off 0.175 0.2]];
colP=[ 1 2 2 2 ] + 5;
colPTFT=[0 4 4 4] + 5;
colNC=[ 12 18 18 18 ] + 5;
subplot('Position',[0.1 0.3 0.35 0.4]); hold on;
xlabel('\alpha');
%ylabel('Fr(P,C,S_{out}) - Fr(NC,-,AllD)');
xlim([0.0005  0.31]);
ylim([-0.3001  0.45001]);
hold all;
%plot([0],[0],'w')
for i=1:length(colP)
  hsp(i)=subplot('Position',posi(i,:));
  hold all;
  INPM=importdata(fileinp{i},' ',2);
  h=semilogx(INPM.data(:,xcol),INPM.data(:,colP(i))-INPM.data(:,colNC(i)),[cST(i) '-']);
  %set(h,'MarkerSize',2);
  if (colPTFT(i)>0+5) h=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC(i)),[cST(i) '--' ]);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log')%,'XTick',[0.001:0.01:0.1]);
  semilogx([1e-10 1.2],[0 0],'k.--');
  if (i==1 || i==2) xlabel('\alpha'); else set(gca,'xticklabel',[]); end
  if (i==4 || i==2) set(gca,'yticklabel',[]); end

  xlim([0.0005  0.31]);
  ylim([-0.3001  0.45001]);
  set(gca,'FontSize',14)
  set(gca,'Xtick',[0.001 0.01 0.1])
end
%legend(leg,'Location','SouthWest');
%set(gca,'xscale','log');
%set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
hl1=text(0.2,0.4,'{\bfa}');
%gtext('A')
 p1=get(hsp(3),'position');
 p2=get(hsp(1),'position');
 height=p1(2)+p1(4)-p2(2);
 h3=axes('position',[p2(1) p2(2) p2(3) height],'visible','off');               
 h_label=ylabel('Fr(P,C,S_{out}) - Fr(NC,-,AllD)','visible','on');
set(h_label, 'Units', 'Normalized');


cST=['r' 'm' 'g' 'b' 'k'];
sST=['+' '*' 'd' 'v' '.'];
filetogether='data/SD_b2_e-999_epsi0.25_delta4.dat';
colP=[1  26+2 10+2 42+2 ] + 5;
colPTFT=[0  26+4 10+4 42+4 ] + 5;
colNC= 42+18  + 5;
subplot('Position',[0.6 0.3+off 0.35 0.4]);
xlabel('\alpha');
h_label=ylabel('Fr(P,C,S_{out}) - Fr(NC,-,AllD)');
%set(h_label, 'Units', 'Normalized');
xlim([0.0005  0.31]);
%ylim([0  0.05]);
hold all;
INPM=importdata(filetogether,' ',2);
%plot([0],[0],'w')
for i=1:length(colP)
  h(3*i-2)=plot([0],[0],'w');
  h(3*i-1)=semilogx(INPM.data(:,xcol),INPM.data(:,colP(i))-INPM.data(:,colNC),[cST(i) '-']);
  set(h(2*i-1),'MarkerSize',2);
  if (colPTFT(i)>0+5) h(3*i)=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC),[cST(i) '--'  ]);  set(h(2*i),'MarkerSize',2); else h(3*i)=plot([0],[0],'w'); end
  set(gca,'xscale','log');
  set(gca,'Xtick',[0.001 0.01 0.1])
end

%legend(leg,'Location','SouthWest');
semilogx([1e-10 1.2],[0 0],'k.--');
set(gca,'xscale','log','YTick',[-0.05:0.02:0.05]);
%set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
hl2=text(0.2424,0.047,'{\bfb}');
%ginput(1)

leg={'{\bfNN}';'AllD  { } ';' '; '{\bfPN}';'AllD  '; 'TFT   ';'{\bfNP}'; 'AllD  '; 'TFT   ';'{\bfPP}'; 'AllD  '; 'TFT   ' };
gridLegend(h,4,leg,'Orientation','Vertical','Fontsize',14,'location','northoutside');
%[LEGH,OBJH,OUTH,OUTM]=legend(leg,'Location','SouthWest');
set(findall(gcf,'type','text'),'FontSize',14);
%set(findall(LEGH,'type','text'),'FontSize',18);
set(gca,'FontSize',14)

set(hl1,'FontSize',14);
set(hl2,'FontSize',14);


clear;
filenameps=['treatments_F.eps'];
print ('-depsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);




xcol=1;
h=figure(2); clf('reset'); %set(h,'defaulttextinterpreter','latex');

cST=['r' 'm' 'g' 'b' 'k'];
sST=['+' '*' 'd' 'v' '.'];
%leg={'{\bfNN}  ';'Coop  {    }';'Def  ';'NoP  ';'{\bfPN}  '; 'Coop  '; 'Def  ';'NoP  ';'{\bfNP}  '; 'Coop  '; 'Def  ';'NoP  ';'{\bfPP}  '; 'Coop  '; 'Def  ';'NoP  ';'{\bfNo C}  '; 'Coop  '; 'Def  ';'NoP  ' };
fileinp={'data/SD_b2_e-999_epsi0.25_delta4_00.dat'; 'data/SD_b2_e-999_epsi0.25_delta4_10.dat'; 'data/SD_b2_e-999_epsi0.25_delta4_01.dat'; 'data/SD_b2_e-999_epsi0.25_delta4_11.dat'; 'data/SD_b2_e-999_epsi0.25_delta4_nocom.dat'};
colC=[21-6 21 21 21 5] + 5;


subplot('Position',[0.43 0.52 0.20 0.25]);
xlabel('\alpha');
ylabel('Level of Defection');
xlim([0.0005  0.31]);
ylim([-0.05  0.85]);
hold all;
for i=1:length(fileinp)
  INPM=importdata(fileinp{i},' ',2);
  %h(4*i-3)=plot([0],[0],'w');
  %h(i)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)),[cST(i)  '-']);
  %set(h(4*i-2),'MarkerSize',2);
  h(i)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)+1),[cST(i) '--' ]);
  set(h(i),'MarkerSize',2);
  %h(4*i)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)+2),[cST(i) ':' ]);
  %set(h(4*i),'MarkerSize',2);
    set(gca,'FontSize',14);
  set(gca,'xscale','log');
end
set(gca,'Xtick',[0.001 0.01 0.1])
text(0.2,0.8,'{\bfb}');

subplot('Position',[0.76 0.52 0.20 0.25]);
xlabel('\alpha');
ylabel('Level of Non-Played');
xlim([0.0005  0.31]);
ylim([-0.05  0.85]);
hold all;
for i=1:length(fileinp)
  INPM=importdata(fileinp{i},' ',2);
  %h(4*i-3)=plot([0],[0],'w');
  %h(i)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)),[cST(i)  '-']);
  %set(h(4*i-2),'MarkerSize',2);
  %h(4*i-1)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)+1),[cST(i) '--' ]);
  %set(h(4*i-1),'MarkerSize',2);
  h(i)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)+2),[cST(i) '-.' ]);
  set(h(i),'MarkerSize',2);
    set(gca,'FontSize',14);
  set(gca,'xscale','log');
end
set(gca,'Xtick',[0.001 0.01 0.1])
text(0.2,0.8,'{\bf c}');

subplot('Position',[0.1 0.52 0.20 0.25]);
xlabel('\alpha');
ylabel('Level of Cooperation');
xlim([0.0005  0.31]);
ylim([-0.05  0.85]);
hold all;
for i=1:length(fileinp)
  INPM=importdata(fileinp{i},' ',2);
  %h(4*i-3)=plot([0],[0],'w');
  h(i)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)),[cST(i)  '-']);
  set(h(i),'MarkerSize',2);
  %h(4*i-1)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)+1),[cST(i) '--' ]);
  %set(h(4*i-1),'MarkerSize',2);
  %h(4*i)=semilogx(INPM.data(:,xcol),INPM.data(:,colC(i)+2),[cST(i) ':' ]);
  %set(h(4*i),'MarkerSize',2);
  set(gca,'FontSize',14);
  set(gca,'xscale','log');
end
set(gca,'Xtick',[0.001 0.01 0.1])
text(0.2,0.8,'{\bfa}');

leg={'{\bfNN}{        }';'{\bfPN }'; '{\bfNP }';'{\bfPP }';'{\bfNo Com }' };
gridLegend(h,5,leg,'Orientation','Vertical','Fontsize',14,'location','northoutside');


%[LEGH,OBJH,OUTH,OUTM]=legend(leg,'Location','SouthWest');
set(findall(gcf,'type','text'),'FontSize',14);
%set(findall(LEGH,'type','text'),'FontSize',18);
set(gca,'FontSize',14);
%set(findall(gcf,'type','text'),'FontSize',6);


clear;
filenameps=['treatments_L.eps'];
print ('-depsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);



end
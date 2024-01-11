
function []=treatments()


xcol=3;
h=figure(1); clf('reset'); %set(h,'defaulttextinterpreter','latex'); 

cST=['g' 'r' 'b' 'b' 'k'];
sST=['+' '*' 'd' 'v' '.'];
tST={'-.'; '--'; '-'; 'b'; 'k'};
fileinp={'dataAP/SD_w-999_eAF0.01_g2_b2_e0.0001_epsi0.25_delta4_00.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.01_epsi0.25_delta4_00.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.1_epsi0.25_delta4_00.dat';   'dataAP/SD_w-999_eAF0.01_g2_b2_e0.0001_epsi0.25_delta4_10.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.01_epsi0.25_delta4_10.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.1_epsi0.25_delta4_10.dat';  'dataAP/SD_w-999_eAF0.01_g2_b2_e0.0001_epsi0.25_delta4_01.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.01_epsi0.25_delta4_01.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.1_epsi0.25_delta4_01.dat';  'dataAP/SD_w-999_eAF0.01_g2_b2_e0.0001_epsi0.25_delta4_11.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.01_epsi0.25_delta4_11.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.1_epsi0.25_delta4_11.dat'} ;
posi=[[0.25 0.1 0.25 0.27];[0.5 0.1 0.25 0.27];[0.25 0.37 0.25 0.27];[0.5 0.37 0.25 0.27]];
colPap=[ 15 15 15  22 22 22 22 22 22 22 22 22] + 6;
colPnap=[ 5 5 5  6 6 6  6 6 6  6 6 6] + 6;
colNC=[ 2 2 2  2 2 2  2 2 2  2 2 2 ] + 6;
labpa={'{\bfNN}';'{\bfPN}';'{\bfNP}';'{\bfPP}' };
subplot('Position',[0.1 0.3 0.35 0.4]); hold on;
xlabel('R_T');
%ylabel('Fr(P,C,S_{out}) - Fr(NC,-,AllD)');
  xlim([0.7  140]);
ylim([-0.3001  0.4001]);
hold all;
plot([0],[0],'k');plot([0],[0],'k');plot([0],[0],'k')
for i=1:length(labpa)
  hsp(i)=subplot('Position',posi(i,:));
  hold all;
  INPM=importdata(fileinp{3*i-2},' ',2);
  h(1)=semilogx(1./(1-INPM.data(:,xcol)),INPM.data(:,colPap(3*i-2))-INPM.data(:,colNC(3*i-2)),[cST(1) tST{1}]);
  %set(h,'MarkerSize',2);
  %if (colPTFT(i)>0+5) h=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC(i)),[cST(i) '--' ]);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log')%,'XTick',[0.001:0.01:0.1]);
  INPM=importdata(fileinp{3*i-1},' ',2);
  h(2)=semilogx(1./(1-INPM.data(:,xcol)),INPM.data(:,colPap(3*i-1))-INPM.data(:,colNC(3*i-1)),[cST(2) tST{2}]);
  %set(h,'MarkerSize',2);
  %if (colPTFT(i)>0+5) h=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC(i)),[cST(i) '--' ]);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log')%,'XTick',[0.001:0.01:0.1]);
    INPM=importdata(fileinp{3*i},' ',2);
  h(3)=semilogx(1./(1-INPM.data(:,xcol)),INPM.data(:,colPap(3*i))-INPM.data(:,colNC(3*i-2)),[cST(3) tST{3}]);
  %set(h,'MarkerSize',2);
  %if (colPTFT(i)>0+5) h=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC(i)),[cST(i) '--' ]);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log')%,'XTick',[0.001:0.01:0.1]);
  semilogx([1e-10 1e10],[0 0],'k.--');
  if (i==1 || i==2) xlabel('R_T'); else set(gca,'xticklabel',[]); end
  if (i==4 || i==2) set(gca,'yticklabel',[]); end

  xlim([0.7  140]); %xlim([0.0005  0.31]);
  ylim([-0.3001  0.45001]);
  set(gca,'Xtick',[1 10 100])
  
  hl1=text(60,0.38,labpa{i});
end
%legend(leg,'Location','SouthWest');
%set(gca,'xscale','log');
%set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
%%%hl1=text(0.2,0.4,'{\bfA}');
%gtext('A')

leg={'\alpha=10^{-3}'; '\alpha=10^{-2}'; '\alpha=10^{-1} {  } ' };
gridLegend(h,3,leg,'Orientation','Vertical','Fontsize',10,'location','northoutside');
%[LEGH,OBJH,OUTH,OUTM]=legend(leg,'Location','SouthWest');
set(findall(gcf,'type','text'),'FontSize',10);
%set(findall(LEGH,'type','text'),'FontSize',18);
set(gca,'FontSize',10)

 p1=get(hsp(3),'position');
 p2=get(hsp(1),'position');
 height=p1(2)+p1(4)-p2(2);
 h3=axes('position',[p2(1) p2(2) p2(3) height],'visible','off');               
 h_label=ylabel('Fr (P,C,AllD,q_{ apo}=1)  -  Fr (NC,-,AllD,-)','visible','on');





%set(hl1,'FontSize',14);
%set(hl2,'FontSize',14);

clear;
filenameps=['treatments_RT_ap.ps'];
print ('-dpsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);


clear all;
xcol=3;
h=figure(2); clf('reset'); %set(h,'defaulttextinterpreter','latex'); 

cST=['g' 'r' 'b' 'b' 'k'];
sST=['+' '*' 'd' 'v' '.'];
tST={'-.'; '--'; '-'; 'b'; 'k'};
fileinp={'dataAP/SD_w-999_eAF0.01_g2_b2_e0.0001_epsi1_delta4_00.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.01_epsi1_delta4_00.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.1_epsi1_delta4_00.dat';   'dataAP/SD_w-999_eAF0.01_g2_b2_e0.0001_epsi1_delta4_10.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.01_epsi1_delta4_10.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.1_epsi1_delta4_10.dat';  'dataAP/SD_w-999_eAF0.01_g2_b2_e0.0001_epsi1_delta4_01.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.01_epsi1_delta4_01.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.1_epsi1_delta4_01.dat';  'dataAP/SD_w-999_eAF0.01_g2_b2_e0.0001_epsi1_delta4_11.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.01_epsi1_delta4_11.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.1_epsi1_delta4_11.dat'} ;
posi=[[0.25 0.1 0.25 0.27];[0.5 0.1 0.25 0.27];[0.25 0.37 0.25 0.27];[0.5 0.37 0.25 0.27]];
colPap=[ 15 15 15  22 22 22 22 22 22 22 22 22] + 6;
colPnap=[ 5 5 5  6 6 6  6 6 6  6 6 6] + 6;
colNC=[ 2 2 2  2 2 2  2 2 2  2 2 2 ] + 6; 
labpa={'{\bfNN}';'{\bfPN}';'{\bfNP}';'{\bfPP}' };
subplot('Position',[0.1 0.3 0.35 0.4]); hold on;
xlabel('R_T');
%ylabel('Fr(P,C,S_{out}) - Fr(NC,-,AllD)');
  xlim([0.7  140]);
ylim([-0.3001  0.4001]);
hold all;
plot([0],[0],'k');plot([0],[0],'k');plot([0],[0],'k')
for i=1:length(labpa)
  hsp(i)=subplot('Position',posi(i,:));
  hold all;
  INPM=importdata(fileinp{3*i-2},' ',2);
  h(1)=semilogx(1./(1-INPM.data(:,xcol)),INPM.data(:,colPap(3*i-2))-INPM.data(:,colNC(3*i-2)),[cST(1) tST{1}]);
  %set(h,'MarkerSize',2);
  %if (colPTFT(i h_label=ylabel('Fr (P,C,AllD,q_{ apo}=1)  -  Fr (NC,-,AllD,-)','visible','on');)>0+5) h=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC(i)),[cST(i) '--' ]);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log')%,'XTick',[0.001:0.01:0.1]);
  INPM=importdata(fileinp{3*i-1},' ',2);
  h(2)=semilogx(1./(1-INPM.data(:,xcol)),INPM.data(:,colPap(3*i-1))-INPM.data(:,colNC(3*i-1)),[cST(2) tST{2}]); 
  %set(h,'MarkerSize',2);
  %if (colPTFT(i)>0+5) h=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC(i)),[cST(i) '--' ]);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log')%,'XTick',[0.001:0.01:0.1]);
    INPM=importdata(fileinp{3*i},' ',2);
  h(3)=semilogx(1./(1-INPM.data(:,xcol)),INPM.data(:,colPap(3*i))-INPM.data(:,colNC(3*i-2)),[cST(3) tST{3}]);
  %set(h,'MarkerSize',2);
  %if (colPTFT(i)>0+5) h=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC(i)),[cST(i) '--' ]);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log')%,'XTick',[0.001:0.01:0.1]);
  semilogx([1e-10 1e10],[0 0],'k.--');
  if (i==1 || i==2) xlabel('R_T'); else set(gca,'xticklabel',[]); end
  if (i==4 || i==2) set(gca,'yticklabel',[]); end 

  xlim([0.7  140]); %xlim([0.0005  0.31]);
  ylim([-0.3001  0.45001]);
  set(gca,'Xtick',[1 10 100])
  
  hl1=text(60,0.38,labpa{i});
end
%legend(leg,'Location','SouthWest');
%set(gca,'xscale','log');
%set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
%%%hl1=text(0.2,0.4,'{\bfA}');
%gtext('A')

leg={'\alpha=10^{-3}'; '\alpha=10^{-2}'; '\alpha=10^{-1} {  } ' };
gridLegend(h,3,leg,'Orientation','Vertical','Fontsize',10,'location','northoutside');
%[LEGH,OBJH,OUTH,OUTM]=legend(leg,'Location','SouthWest');
set(findall(gcf,'type','text'),'FontSize',10);
%set(findall(LEGH,'type','text'),'FontSize',18);
set(gca,'FontSize',10)

 p1=get(hsp(3),'position');
 p2=get(hsp(1),'position');
 height=p1(2)+p1(4)-p2(2);
 h3=axes('position',[p2(1) p2(2) p2(3) height],'visible','off');               
 h_label=ylabel('Fr (P,C,AllD,q_{ apo}=1)  -  Fr (NC,-,AllD,-)','visible','on');





%set(hl1,'FontSize',14);
%set(hl2,'FontSize',14);

clear;
filenameps=['treatments_RT_ap_eps1.ps'];
print ('-dpsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);



clear all;
xcol=3;
h=figure(3); clf('reset'); %set(h,'defaulttextinterpreter','latex'); 

cST=['g' 'r' 'b' 'b' 'k'];
sST=['+' '*' 'd' 'v' '.'];
tST={'-.'; '--'; '-'; 'b'; 'k'};
fileinp={'dataAP/SD_w-999_eAF0.01_g2_b2_e0.0001_epsi2_delta4_00.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.01_epsi2_delta4_00.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.1_epsi2_delta4_00.dat';   'dataAP/SD_w-999_eAF0.01_g2_b2_e0.0001_epsi2_delta4_10.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.01_epsi2_delta4_10.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.1_epsi2_delta4_10.dat';  'dataAP/SD_w-999_eAF0.01_g2_b2_e0.0001_epsi2_delta4_01.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.01_epsi2_delta4_01.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.1_epsi2_delta4_01.dat';  'dataAP/SD_w-999_eAF0.01_g2_b2_e0.0001_epsi2_delta4_11.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.01_epsi2_delta4_11.dat'; 'dataAP/SD_w-999_eAF0.01_g2_b2_e0.1_epsi2_delta4_11.dat'} ;
posi=[[0.25 0.1 0.25 0.27];[0.5 0.1 0.25 0.27];[0.25 0.37 0.25 0.27];[0.5 0.37 0.25 0.27]];
colPap=[ 15 15 15  22 22 22 22 22 22 22 22 22] + 6;
colPnap=[ 5 5 5  6 6 6  6 6 6  6 6 6] + 6;
colNC=[ 2 2 2  2 2 2  2 2 2  2 2 2 ] + 6; 
labpa={'{\bfNN}';'{\bfPN}';'{\bfNP}';'{\bfPP}' };
subplot('Position',[0.1 0.3 0.35 0.4]); hold on;
xlabel('R_T');
%ylabel('Fr(P,C,S_{out}) - Fr(NC,-,AllD)');
  xlim([0.7  140]);
ylim([-0.3001  0.4001]);
hold all;
plot([0],[0],'k');plot([0],[0],'k');plot([0],[0],'k')
for i=1:length(labpa)
  hsp(i)=subplot('Position',posi(i,:));
  hold all;
  INPM=importdata(fileinp{3*i-2},' ',2);
  h(1)=semilogx(1./(1-INPM.data(:,xcol)),INPM.data(:,colPap(3*i-2))-INPM.data(:,colNC(3*i-2)),[cST(1) tST{1}]);
  %set(h,'MarkerSize',2);
  %if (colPTFT(i h_label=ylabel('Fr (P,C,AllD,q_{ apo}=1)  -  Fr (NC,-,AllD,-)','visible','on');)>0+5) h=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC(i)),[cST(i) '--' ]);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log')%,'XTick',[0.001:0.01:0.1]);
  INPM=importdata(fileinp{3*i-1},' ',2);
  h(2)=semilogx(1./(1-INPM.data(:,xcol)),INPM.data(:,colPap(3*i-1))-INPM.data(:,colNC(3*i-1)),[cST(2) tST{2}]); 
  %set(h,'MarkerSize',2);
  %if (colPTFT(i)>0+5) h=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC(i)),[cST(i) '--' ]);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log')%,'XTick',[0.001:0.01:0.1]);
    INPM=importdata(fileinp{3*i},' ',2);
  h(3)=semilogx(1./(1-INPM.data(:,xcol)),INPM.data(:,colPap(3*i))-INPM.data(:,colNC(3*i-2)),[cST(3) tST{3}]);
  %set(h,'MarkerSize',2);
  %if (colPTFT(i)>0+5) h=semilogx(INPM.data(:,xcol),INPM.data(:,colPTFT(i))-INPM.data(:,colNC(i)),[cST(i) '--' ]);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log')%,'XTick',[0.001:0.01:0.1]);
  semilogx([1e-10 1e10],[0 0],'k.--');
  if (i==1 || i==2) xlabel('R_T'); else set(gca,'xticklabel',[]); end
  if (i==4 || i==2) set(gca,'yticklabel',[]); end 

  xlim([0.7  140]); %xlim([0.0005  0.31]);
  ylim([-0.3001  0.45001]);
  set(gca,'Xtick',[1 10 100])
  
  hl1=text(60,0.38,labpa{i});
end
%legend(leg,'Location','SouthWest');
%set(gca,'xscale','log');
%set(gca,'FontSize',6);
%set(findall(gcf,'type','text'),'FontSize',6);
%%%hl1=text(0.2,0.4,'{\bfA}');
%gtext('A')

leg={'\alpha=10^{-3}'; '\alpha=10^{-2}'; '\alpha=10^{-1} {  } ' };
gridLegend(h,3,leg,'Orientation','Vertical','Fontsize',10,'location','northoutside');
%[LEGH,OBJH,OUTH,OUTM]=legend(leg,'Location','SouthWest');
set(findall(gcf,'type','text'),'FontSize',10);
%set(findall(LEGH,'type','text'),'FontSize',18);
set(gca,'FontSize',10)

 p1=get(hsp(3),'position');
 p2=get(hsp(1),'position');
 height=p1(2)+p1(4)-p2(2);
 h3=axes('position',[p2(1) p2(2) p2(3) height],'visible','off');               
 h_label=ylabel('Fr (P,C,AllD,q_{ apo}=1)  -  Fr (NC,-,AllD,-)','visible','on');





%set(hl1,'FontSize',14);
%set(hl2,'FontSize',14);

clear;
filenameps=['treatments_RT_ap_eps2.ps'];
print ('-dpsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);

end

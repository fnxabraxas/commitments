
function []=treatments()

xcol=3;
h=figure(2); clf('reset'); set(h,'defaulttextinterpreter','latex'); 

cST=['r' 'r' 'k' 'k' 'k' 'r' 'r' 'r' 'm' 'm' 'm' 'g' 'g' 'g' 'b' 'b' 'b' ];
sST=['.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' ];
sSTt=['o' 'o' 'o' 'o' 'o' 'o' 'o' 'o' 'o' 'o' 'o' 'o'];
lST={'-' '--' ':' '-' '--' ':' '-' '--' ':' '-' '--' ':'};
leg={'AllD'; 'TFT'};
fileinp={'dataNC/SD_w-999_b2_e0.001_epsi0.25_delta4_11.dat'; 'dataNC/SD_w-999_b2_e0.05_epsi0.25_delta4_11.dat'; 'dataNC/SD_w-999_b2_e0.0001_epsi0.25_delta4_11.dat'; 'dataNC/SD_w-999_b2_e0.01_epsi0.25_delta4_11.dat'; 'dataNC/SD_w-999_b2_e0.1_epsi0.25_delta4_11.dat'} ;
colP=[ 2 2 2 2 2 ] + 5;
colPTFT=[4 4 4  4 4 4] + 5;
%colNC=[ 12 12 12  18 18 18  18 18 18  18 18 18 ] + 5;
subplot('Position',[0.05 0.05 0.25 0.3]);
xlabel('$R_T$');
ylabel('$Pr(S)$');
xlim([1  10000]);
ylim([0  1]);
hold all;
for i=1:length(colP)
  INPM=importdata(fileinp{i},' ',2);
  h=semilogx(1./(1-INPM.data(:,xcol)),INPM.data(:,colP(i)),['k']);
  set(h,'MarkerSize',0.01);
  if (colPTFT(i)>0+5) h=semilogx(1./(1-INPM.data(:,xcol)),INPM.data(:,colPTFT(i)),['r']);  set(h,'MarkerSize',2); end
  set(gca,'xscale','log');
end
legend(leg,'Location','NorthEast');
%semilogx([1e-10 200],[0 0],'k.--');
%set(gca,'xscale','log');
set(gca,'FontSize',6);
set(findall(gcf,'type','text'),'FontSize',6);


clear;
filenameps=['treatments_RT_nc.ps'];
print ('-dpsc',filenameps);
mv2=['mv ' filenameps ' plots/.' ]; system(mv2);


end
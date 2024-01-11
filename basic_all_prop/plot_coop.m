
function []=plot_coop()

nxsubp=2;
nysubp=2;

%TREv={'00'; '01'; '10'; '11'};
%TRElabv={'strict'; 'antibasic'; 'basic'; 'relax'};

bv={'1.5'; '2'; '4'};
ev={'0.01'; '0.1'};
epsiv={'0.25'};
deltav={'4'};

variv={'b'; 'e'; 'epsi'; 'delta'};
xlv=[ 1.49 8 ; 0.0005  0.31; 0 4; 0 8];
labv={'b';'$\alpha$';'$\epsilon$';'$\delta$'};
labvf={'b';'error';'epsilon';'delta'};
xcolv=[ 2 1  4 5];



%for iTRE=1:length(TREv)
%  TRE=TREv{iTRE};

  for ivari=1:length(variv)
    clear vari;
    vari=variv{ivari};
    xcol=xcolv(ivari);
    xlab=labv{ivari};
    xlabf=labvf{ivari};

    if ivari==1  bvini=bv; bv={'-999'}; 
    elseif ivari==2  evini=ev; ev={'-999'};
    elseif ivari==3  epsivini=epsiv; epsiv={'-999'}; bvini=bv; bv={'1.5'; '2'};
    elseif ivari==4  deltavini=deltav; deltav={'-999'}; bvini=bv; bv={'1.5'; '2'}; end      
    h=figure(1); clf('reset'); set(h,'defaulttextinterpreter','latex');
    isubp=0;
    for ib=1:length(bv)
      b=bv{ib};
    for ie=1:length(ev)
      e=ev{ie};
    for iepsi=1:length(epsiv)
      epsi=epsiv{iepsi};
    for idelta=1:length(deltav)
      delta=deltav{idelta};
      
      if ivari==1  tit=['$\alpha$=' e ',   $\epsilon$=' epsi ',   $\delta$=' delta];
      elseif ivari==2  tit=['b=' b ',   $\epsilon$=' epsi ',   $\delta$=' delta];
      elseif ivari==3  tit=['b=' b ',   $\alpha$=' e ',   $\delta$=' delta];
      elseif ivari==4  tit=['b=' b ',   $\alpha$=' e ',   $\epsilon$=' epsi]; end 
      
      
      labf=['data/SD_b' b '_e' e '_epsi' epsi '_delta' delta];
      isubp=isubp+1;
      subplot(nxsubp,nysubp,isubp);
      if ivari~=2 plot_param1(labf,xcol,xlab,tit);
      else plot_param1logx(labf,xcol,xlab,tit); end
      xlim(xlv(ivari,:));
     
    end
    end
    end
    end

    if ivari==1  bv=bvini;
    elseif ivari==2  ev=evini;
    elseif ivari==3  epsiv=epsivini; bv=bvini;
    elseif ivari==4  deltav=deltavini; bv=bvini; end

    outf=['cooplevel_' xlabf ];
    filenameps=[outf '.ps'];
    filenamepdf=[outf '.pdf'];
    print ('-dpsc',filenameps);
    fileps2pdf=['ps2pdf -sPAPERSIZE=a4 ' filenameps ' ' filenamepdf];
    system(fileps2pdf);
    mv1=['mv ' filenamepdf ' plots/.' ]; system(mv1);
    mv2=['mv ' filenameps ' plots/.' ]; system(mv2);
    
    
  end
  
%end


end




function []=plot_param1(labf,xcol,xlab,tit)


TREv={'00'; '01'; '10'; '11'};
%TREmark=['o' '+' '*' '^'];
%TRElin={'-.'; '--'; ':'; '-'};
TREcol={'red'; 'green'; 'magenta'; 'blue'};

%coocol={'green'; 'red'; 'black'};
coolin={'-'; '--'; ':'; '-.'};

%lab={'C   NN'; 'D '; 'NotP '; 'MutC '; 'C   NP'; 'D '; 'NotP '; 'MutC '; 'C   PN'; 'D '; 'NotP  '; 'MutC '; 'C   PP'; 'D '; 'NotP '; 'MutC ' };
lab={'C     {\bfNN}'; 'D '; 'NotP '; 'C     {\bfNP}'; 'D '; 'NotP '; 'C     {\bfPN}'; 'D '; 'NotP  '; 'C     {\bfPP}'; 'D '; 'NotP ' };

for iTRE=1:length(TREv)
  TRE=TREv{iTRE};

  if TRE=='00'
    cols=21-6;
  else
    cols=21;
  end

  inf=[labf '_' TRE '.dat'];

  INPM=importdata(inf,' ',2);
  [nump,nS]=size(INPM.data);

  xlabel(xlab);
  ylabel('level');
  title(tit);
  %set(gca,'FontSize',8)
  hold all;
  for i=1:3 %4
    h=plot(INPM.data(:,xcol),INPM.data(:,cols+5+i-1),[TREcol{iTRE} coolin{i}]);
    set(h,'MarkerSize',2);
  end

end  

legend(lab,'Location','NorthEast');

set(gca,'FontSize',6);
set(findall(gcf,'type','text'),'FontSize',6);
clear;

end



function []=plot_param1logx(labf,xcol,xlab,tit)


TREv={'00'; '01'; '10'; '11'};
%TREmark=['o' '+' '*' '^'];
%TRElin={'-.'; '--'; ':'; '-'};
TREcol={'red'; 'green'; 'magenta'; 'blue'};

%coocol={'green'; 'red'; 'black'};
coolin={'-'; '--'; ':'; '-.'};

lab={'C     {\bfNN}'; 'D '; 'NotP '; 'C     {\bfNP}'; 'D '; 'NotP '; 'C     {\bfPN}'; 'D '; 'NotP  '; 'C     {\bfPP}'; 'D '; 'NotP ' };

for iTRE=1:length(TREv)
  TRE=TREv{iTRE};

  if TRE=='00'
    cols=21-6;
  else
    cols=21;
  end

  inf=[labf '_' TRE '.dat'];

  INPM=importdata(inf,' ',2);
  [nump,nS]=size(INPM.data);

  xlabel(xlab);
  ylabel('level');
  title(tit);
  %set(gca,'FontSize',8)
  hold all;
  for i=1:3 %4
    h=semilogx(INPM.data(:,xcol),INPM.data(:,cols+5+i-1),[TREcol{iTRE} coolin{i}]);
    set(gca,'xscale','log');
    set(h,'MarkerSize',2);
  end

end  

legend(lab,'Location','SouthWest');

set(gca,'FontSize',6);
set(findall(gcf,'type','text'),'FontSize',6);
clear;

end

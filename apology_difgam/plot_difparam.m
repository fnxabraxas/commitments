
function []=plot_difparam()

nxsubp=3;
nysubp=3;

TREv={'00'; '11'}; %{'00'; '11'}; % {'00'; '01'; '10'; '11'};
TRElabv={'strict'; 'relax'}; %{'strict'; 'antibasic'; 'basic'; 'relax'};

gamv={'0.5'; '2'; '4'}; %{'0.5'; '1'; '2'; '4'};
eAFv={'0.01'}; % '0.1'};
bv={'1.5'; '2'; '4'};
ev={'0.01'; '0.1'};
epsiv={'0.25'};
deltav={'4'};

idd=[1 4 2 ]; % 5 6];
variv={'b'; 'e'; 'eAF'; 'g'; 'epsi'; 'delta' };
labvf={'b';'error'; 'eAF'; 'g';'epsilon';'delta'};
xlv=[ 1.49 8 ; 0.0005  0.31; 0.0005  0.3; 0 8; 0 4; 0 8];
labv={'b';'$\alpha$';'$\alpha_{AF}$';'$\gamma$';'$\epsilon$';'$\delta$';};
xcolv=[ 2 1 3 6 4 5 ];


for iTRE=1:length(TREv)
  TRE=TREv{iTRE};

  for ivari=1:length(idd)
    clear vari;
    vari=variv{idd(ivari)};
    xcol=xcolv(idd(ivari));
    xlab=labv{idd(ivari)};
    xlabf=labvf{idd(ivari)};

    if idd(ivari)==1  bvini=bv; bv={'-999'}; 
    elseif idd(ivari)==2  evini=ev; ev={'-999'};
    elseif idd(ivari)==3  eAFvini=eAFv; eAFv={'-999'}; bvini=bv; bv={'1.5'; '4'};
    elseif idd(ivari)==4  gamvini=gamv; gamv={'-999'}; % bvini=bv; bv={'1.5'; '4'};
    elseif idd(ivari)==5  epsivini=epsiv; epsiv={'-999'}; bvini=bv; bv={'1.5'; '4'};
    elseif idd(ivari)==6  deltavini=deltav; deltav={'-999'}; bvini=bv; bv={'1.5'; '4'};    
    end 
        
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
    for ieAF=1:length(eAFv)
      eAF=eAFv{ieAF};
    for igam=1:length(gamv)
      gam=gamv{igam};
      
      if idd(ivari)==1  tit=['$\alpha$=' e ',    $\epsilon$=' epsi ',    $\delta$=' delta ',    $\alpha_{AF}$=' eAF ',    $\gamma$=' gam];
      elseif idd(ivari)==2  tit=['b=' b ',    $\epsilon$=' epsi ',    $\delta$=' delta ',    $\alpha_{AF}$=' eAF ',    $\gamma$=' gam];
      elseif idd(ivari)==3  tit=['b=' b ',    $\alpha$=' e ',    $\epsilon$=' epsi ',    $\delta$=' delta ',    $\gamma$=' gam];
      elseif idd(ivari)==4  tit=['b=' b ',    $\alpha$=' e ',    $\epsilon$=' epsi ',    $\delta$=' delta ',    $\alpha_{AF}$=' eAF];
      elseif idd(ivari)==5  tit=['b=' b ',    $\alpha$=' e ',    $\delta$=' delta ',    $\alpha_{AF}$=' eAF ',    $\gamma$=' gam];
      elseif idd(ivari)==6  tit=['b=' b ',    $\alpha$=' e ',    $\epsilon$=' epsi ',    $\alpha_{AF}$=' eAF ',    $\gamma$=' gam];
      end 
      
      inpf=['data/SD_eAF' eAF '_g' gam '_b' b '_e' e '_epsi' epsi '_delta' delta '_' TRE '.dat'];
      isubp=isubp+1;
      subplot(nxsubp,nysubp,isubp);
      if (idd(ivari)~=2 && idd(ivari)~=3)  plot_param1(inpf,xcol,xlab,tit,TRE);
      else plot_param1logx(inpf,xcol,xlab,tit,TRE); end
      xlim(xlv(idd(ivari),:));
     
    end
    end
    end
    end
    end
    end

    if idd(ivari)==1  bv=bvini;
    elseif idd(ivari)==2  ev=evini;
    elseif idd(ivari)==3  eAFv=eAFvini; bv=bvini;
    elseif idd(ivari)==4  gamv=gamvini; bv=bvini;
    elseif idd(ivari)==5  epsiv=epsivini; bv=bvini;
    elseif idd(ivari)==6  deltav=deltavini; bv=bvini; 
    end

    outf=[xlabf '_' TRElabv{iTRE} '_for'];
    filenameps=[outf '.ps'];
    filenamepdf=[outf '.pdf'];
    print ('-dpsc',filenameps);
    fileps2pdf=['ps2pdf -sPAPERSIZE=a4 ' filenameps ' ' filenamepdf];
    system(fileps2pdf);
    mv1=['mv ' filenamepdf ' plots/.' ]; system(mv1);
    mv2=['mv ' filenameps ' plots/.' ]; system(mv2);
    
    
  end
  
end


end




function []=plot_param1(inf,xcol,xlab,tit,TRE)

if TRE=='00'
  ST=[1+4 10-6+4 12-6+4 14-6+4  1+14 10-6+14 12-6+14 14-6+14  2 ];
  labST={'(P,C,-,F,NA)'; '(A,C,AllD,F,NA)'; '(A,C,TFT,F,NA)'; '(A,D,AllD,F,NA)'; '(P,C,-,F,A)'; '(A,C,AllD,F,A)'; '(A,C,TFT,F,A)'; '(A,D,AllD,F,A)' ;'(NC,-,AllD,-,-)'};
  cST=['b' 'r'  'c' 'm'  'b' 'r'  'c' 'm'   'k' ];
  lST={'-' '-' '-' '-' '--' '--' '--' '--' '-' };
else
  ST=[2+4 4+4 10+4 12+4 14+4 2+20 4+20 10+20 12+20 14+20    2 ];
  labST={'(P,C,AllD,F,NA)'; '(P,C,TFT,F,NA)'; '(A,C,AllD,F,NA)'; '(A,C,TFT,F,NA)'; '(A,D,AllD,F,NA)';'(P,C,AllD,F,A)'; '(P,C,TFT,F,A)'; '(A,C,AllD,F,A)'; '(A,C,TFT,F,A)'; '(A,D,AllD,F,A)'; '(NC,-,AllD,-,-)'};
  cST=['b' 'g' 'r' 'c' 'm'  'b' 'g' 'r' 'c' 'm'   'k' ];
  lST={'-' '-' '-' '-' '-' '--' '--' '--' '--' '--'    '-' };
end
[inf]
INPM=importdata(inf,' ',2);
[nump,nS]=size(INPM.data);

xlabel(xlab);
ylabel('P');
title(tit);
%set(gca,'FontSize',8)
hold all;
for i=1:length(ST)
  h=plot(INPM.data(:,xcol),INPM.data(:,ST(i)+6),[cST(i) '.' lST{i}]);
  set(h,'MarkerSize',2);
end
%%%legend(labST,'Location','NorthEast');

set(gca,'FontSize',6);
set(findall(gcf,'type','text'),'FontSize',6);
clear;

end



function []=plot_param1logx(inf,xcol,xlab,tit,TRE)

if TRE=='00'
  ST=[1+4 10-6+4 12-6+4 14-6+4  1+14 10-6+14 12-6+14 14-6+14  2 ];
  labST={'(P,C,-,F,NA)'; '(A,C,AllD,F,NA)'; '(A,C,TFT,F,NA)'; '(A,D,AllD,F,NA)'; '(P,C,-,F,A)'; '(A,C,AllD,F,A)'; '(A,C,TFT,F,A)'; '(A,D,AllD,F,A)' ;'(NC,-,AllD,-,-)'};
  cST=['b' 'r'  'c' 'm'  'b' 'r'  'c' 'm'   'k' ];
  lST={'-' '-' '-' '-' '--' '--' '--' '--' '-' };
else
  ST=[2+4 4+4 10+4 12+4 14+4 2+20 4+20 10+20 12+20 14+20    2 ];
  labST={'(P,C,AllD,F,NA)'; '(P,C,TFT,F,NA)'; '(A,C,AllD,F,NA)'; '(A,C,TFT,F,NA)'; '(A,D,AllD,F,NA)';'(P,C,AllD,F,A)'; '(P,C,TFT,F,A)'; '(A,C,AllD,F,A)'; '(A,C,TFT,F,A)'; '(A,D,AllD,F,A)'; '(NC,-,AllD,-,-)'};
  cST=['b' 'g' 'r' 'c' 'm'  'b' 'g' 'r' 'c' 'm'   'k' ];
  lST={'-' '-' '-' '-' '-' '--' '--' '--' '--' '--'    '-' };
end
[inf]
INPM=importdata(inf,' ',2);
[nump,nS]=size(INPM.data);

xlabel(xlab);
ylabel('P');
title(tit);
%set(gca,'FontSize',8)
hold all;
for i=1:length(ST)
  h=semilogx(INPM.data(:,xcol),INPM.data(:,ST(i)+6),[cST(i) '.' lST{i}]);
   set(gca,'xscale','log');
  set(h,'MarkerSize',2);
end
%%%legend(labST,'Location','SouthWest');

set(gca,'FontSize',6);
set(findall(gcf,'type','text'),'FontSize',6);
clear;

end

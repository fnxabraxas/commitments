
function []=plot_difgam()

clear all;

nxsubp=2;
nysubp=3;

clim=[0 0.005];


TREv=  {'00'; '01'; '10'; '11'};
TRElabv={'00'; '01'; '10'; '11'}; %{'strict'; 'relax'}; %{'strict'; 'antibasic'; 'basic'; 'relax'};

eAFv={'0.01'};
bv={'1.5'; '2'; '4'};
ev={'0.01'; '0.1'};
epsiv={'0.25'} ;% {'0'; '0.25'};
deltav={'4'} ;% {'0'; '4'};



for iTRE=1:length(TREv)
  TRE=TREv{iTRE};
        
    h=figure(iTRE); clf('reset'); %set(h,'defaulttextinterpreter','latex');
    isubp=0;
    for ie=1:length(ev)
      e=ev{ie};
    for ib=1:length(bv)
      b=bv{ib};
    for iepsi=1:length(epsiv)
      epsi=epsiv{iepsi};
    for idelta=1:length(deltav)
      delta=deltav{idelta};
    for ieAF=1:length(eAFv)
      eAF=eAFv{ieAF};
      
      tit=['b/c=' b ',    \alpha=' e];% ',    $\epsilon$=' epsi ',    $\delta$=' delta];

      inpf=['data/find_eAF' eAF '_g_b' b '_e' e '_epsi' epsi '_delta' delta '_' TRE '.dat'];
      isubp=isubp+1;
      A(isubp)=subplot(nxsubp,nysubp,isubp);
      plot_param1(inpf,tit,clim);
     
    end
    end
    end
    end
    end

    BB=colorbar;
    %set(get(BB,'ylabel'),'string','Pr','Fontsize',10)
    set(BB,'Position', [.87 .19 .03 .7],'Fontsize',13);
    for iii=1:isubp
      pos=get(A(iii), 'Position');
      %axes(A(iii))
      if(iii==4)||(iii==5)||(iii==6)
      %set(A(iii), 'Position', [pos(1)-0.08 pos(2)+0.05 pos(3)*1.07 pos(4)*1.07])
      set(A(iii), 'Position', [pos(1)-0.07 pos(2)+0.05 pos(3)*1.0 pos(4)*1.0])
      else
      %set(A(iii), 'Position', [pos(1)-0.08 pos(2) pos(3)*1.07 pos(4)*1.07])
      set(A(iii), 'Position', [pos(1)-0.07 pos(2) pos(3)*1.0 pos(4)*1.0])
      end
    end 
    %pos=get(A(4), 'Position');
    %posh=get(A(2), 'Position');
    %set(A(1), 'Position', [pos(1) posh(2) pos(3) pos(4)]);
    
    
    outf=['difgam_' TRElabv{iTRE} ];
    filenameps=[outf '.eps'];
    filenamepdf=[outf '.pdf'];
    print ('-depsc',filenameps);
    fileps2pdf=['ps2pdf -sPAPERSIZE=a4 ' filenameps ' ' filenamepdf];
    %system(fileps2pdf);
    %mv1=['mv ' filenamepdf ' plots/.' ]; system(mv1);
    mv2=['mv ' filenameps ' plots/.' ]; system(mv2);
  
end


end




function []=plot_param1(inf,tit,clim)

INPM=load(inf);
[nSp,nSpp]=size(INPM);
%%INPM(1,2)=2*INPM(1,3)-INPM(1,4); INPM(2,1)=2*INPM(nSp,1)-INPM(nSp-1,1);
%%tempv=INPM(2,:);
%%for i=2:nSp-1
%%  INPM(i,:)=INPM(i+1,:);
%%end
%%INPM(nSp,:)=tempv;


h=image(INPM(1,3:nSpp),INPM(3:nSp,1),INPM(3:nSp,3:nSpp),'CDataMapping','scaled');
axis xy;
axis square;
%colorbar;
caxis(clim);
%%xtickl=get(gca,'XTickLabel')
%%xtickl(1,1:2)='NA'
%%set(gca,'XTickLabel',xtickl)
%%ytickl=get(gca,'YTickLabel')
%%ytickl(nSp-1,1:2)='NF'
%%set(gca,'YTickLabel',ytickl)

xlabel('\gamma');
ylabel('\tau_{\gamma}');
title(tit);

set(gca,'FontSize',13);
set(findall(gcf,'type','text'),'FontSize',13);
clear;

end


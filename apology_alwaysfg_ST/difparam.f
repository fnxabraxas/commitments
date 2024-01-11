	include "sub_payoffM.f"
	include "sub_SD.f"

	program payoffM

	implicit none
	include "common.h"

	integer i,j,k,m, nS,N, ip,nump,ie,ib,iw,iepsi,idelta,TRE,ieAF,
     +			ii,jj, igam,   com,comMAT(nSmax,nSmax)
	double precision pay1, pay2, payMAT(nSmax,nSmax), beta, timeC,
     +  statD(nSmax), rhoMAT(nSmax,nSmax), cooMAT(nSmax,nSmax,3),
     +   ALLM(nmaxp,nSmax),headM(nmaxp,6),coop1,coop2,def1,def2,
     +   COOM(nmaxp,4), idb,ide,idw,idepsi,iddelta,ccm,ideAF,idgam,tsum,
     +			 TIMEM(nmaxp),timeMAT(nSmax,nSmax),COMM(nmaxp)
     	real, allocatable:: evect(:),bvect(:),wvect(:),
     +		 epsivect(:),deltavect(:),eAFvect(:),gamvect(:)
	character*80 outf, strf

	cooMAT=0.d0
	payMAT=-1.d0
	rhoMAT=0.d0
	print*,'Treatment -- 00, 10, 01, 11'
	read(*,*) TRE			!TRE: 00 (strict), 10 (basic), 01(antibasic), 11(relax),*
	print*,'Parameters g, eAF, error, w, epsi, delta (-999 var)'
	read(*,*) idgam,ideAF, ide,idw,idepsi,iddelta
 		print*,idgam,ideAF,idb, ide,idw,idepsi,iddelta
	print*,'R,P,S,T'
	read(*,*) Rp,Pp,Sp,Tp
	print*,'Beta, N'
	read(*,*) beta, N
 		print*, beta, N
	print*,'File with strategies'
	read(*,*) strf
		print*,strf
	print*,'Output file'
	read(*,*) outf
		print*,outf

		print*,bvect
		print*,evect
		print*,epsivect
		print*,deltavect

	!qa=1.d0

c	evect=(/ 0.01 /)
c	bvect=(/ 4. /)
c	wvect=(/ 0.9/)
c	epsivect=(/ 0.25 /)
c	deltavect=(/ 4./)

	if (idgam.eq.-999) then
	  gamvect=(/  (i*0.08,i=0,100,3) /)
	else
	  gamvect=(/ idgam /)
	endif
	if (ideAF.eq.-999) then
	  eAFvect=(/ ( 10**(-3.4d0+i*0.06d0) ,i=0,50,2) /)
	else
	  eAFvect=(/ ideAF /)
	endif
c	if (idb.eq.-999) then
c	  bvect=(/ (i*0.1,i=11,80,2) /)
c	else
c	  bvect=(/ idb /)
c	endif
	if (ide.eq.-999) then
	  !evect=(/ (i*0.0005,i=1,1000,20) /)
	  evect=(/ ( 10**(-3.4d0+i*0.06d0) ,i=0,50,2) /)
	else
	  evect=(/ ide /)
	endif
	if (idw.eq.-999) then
	  wvect=(/ (i*0.01,i=0,99,1) /)
	else
	  wvect=(/ idw /)
	endif
	if (idepsi.eq.-999) then
	  epsivect=(/ (i*0.1,i=0,50,1) /)
	else
	  epsivect=(/ idepsi /)
	endif
	if (iddelta.eq.-999) then
	  deltavect=(/ (i*0.1,i=0,100,2) /)
	else
	  deltavect=(/ iddelta /)
	endif


	open(10,file=strf,status='old')
	read(10,*)
	nS=0
	do
	  nS=nS+1
	  read(10,*,end=50) numS(nS), prop(nS), accep(nS),
     +			 Pout(nS), Pin(nS), fin(nS), ain(nS)
	enddo
 50	continue
	nS=nS-1
	close(10)

	ip=0
	TIMEM=0.d0
	COMM=0.d0
	COOM=0.d0
	do igam=1,size(gamvect)
	do ieAF=1,size(eAFvect)
	do ie=1,size(evect)
c	do ib=1,size(bvect)
	do iw=1,size(wvect)
	do iepsi=1,size(epsivect)
	do idelta=1,size(deltavect)

	ip=ip+1
	gam=gamvect(igam)
	eAF=eAFvect(ieAF)
	e=evect(ie)
c	b=bvect(ib)
	w=wvect(iw)
	epsi=epsivect(iepsi)
	delta=deltavect(idelta)
	headM(ip,1)=e
	headM(ip,2)=Sp !b
	headM(ip,3)=Tp !w !eAF
	headM(ip,4)=epsi
	headM(ip,5)=delta
	headM(ip,6)=gam

	do ii=1,nS
	  f(ii)=dabs(fin(ii)-eAF)
	  a(ii)=dabs(ain(ii)-eAF)
	enddo
	do ii=1,nS
	do jj=1,nS
	  fa(ii,jj)=f(ii)*a(jj)
	enddo
	enddo
			print*, ip,(headM(ip,k),k=1,5)
	payMAT=9999.d0
	do i=1,nS
	  do j=i,nS
	    !print*,numS(i),numS(j)	
      call anaPAY(pay1,pay2,i,j,coop1,coop2,def1,def2,ccm,timeC,com,TRE)
	    if(i.eq.j) then
		payMAT(i,i)=(pay1+pay2)/2.d0
	    	cooMAT(i,i,1)=(coop1+coop1)/2.d0
	    	cooMAT(i,i,2)=(def1+def2)/2.d0
	    else
	    	payMAT(i,j)=pay1
	    	payMAT(j,i)=pay2
	    	cooMAT(i,j,1)=coop1
	    	cooMAT(j,i,1)=coop2
	    	cooMAT(i,j,2)=def1
	    	cooMAT(j,i,2)=def2
	    endif
	    cooMAT(i,j,3)=ccm
	    cooMAT(j,i,3)=ccm
	    timeMAT(i,j)=timeC
	    timeMAT(j,i)=timeC
	    if(com.eq.-1) com=0
	    if(timeC.gt.com +cero) then
		print*, timeC, com
		stop 'Error timeC-com'
	    endif
	    comMAT(i,j)=com
	    comMAT(j,i)=com
	  enddo
	enddo
	call SD(statD,payMAT,nS,nSmax,N,beta)

	forall(k=1:nS) ALLM(ip,k)=statD(k)
	
	forall(m=1:2) COOM(ip,m)=0.d0
	tsum=0.d0
	do i=1,nS
	  do j=1,nS
	   forall(m=1:2) COOM(ip,m)=COOM(ip,m)
     +				+statD(i)*statD(j)*cooMAT(i,j,m)
	   COOM(ip,4)=COOM(ip,4)
     +				+statD(i)*statD(j)*cooMAT(i,j,3)
	   TIMEM(ip)=TIMEM(ip)+statD(i)*statD(j)*timeMAT(i,j)
	   COMM(ip)=COMM(ip)+statD(i)*statD(j)*comMAT(i,j)
	  enddo
	  tsum=tsum+statD(i)
	enddo
	  !print*,ip,COOM(ip,1),COOM(ip,2)
	if(tsum.gt.1.00001d0) stop 'tsum>1'
	COOM(ip,3)=1.d0-(COOM(ip,1)+COOM(ip,2))


	enddo
	enddo
	enddo
c	enddo
	enddo
	enddo
	enddo
	nump=ip

	open(90,file=outf,status='unknown')
	write(90,'(A1,2A)') '#',' err, S, T, epsilon, delta',
     +  '     Probability of each strategy...   Coop,Def,NP,MutC levels' 
	write(90,'(5I6,$)') 0,0,0,0,0
	do j=1,nS
	  write(90,'(I13,$)') numS(j)		
	enddo
	write(90,*) ' '
	do i=1,nump
	  write(90,'(F7.4,5F6.2,$)') (headM(i,k),k=1,6)
	  do j=1,nS
	    write(90,'(E13.4,$)') ALLM(i,j)		
	  enddo
	  write(90,'(6E13.4)') (COOM(i,j),j=1,4), TIMEM(i), COMM(i)
	enddo
	close(90)



	stop
	end


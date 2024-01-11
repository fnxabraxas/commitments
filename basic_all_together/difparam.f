	include "sub_payoffM.f"
	include "sub_SD.f"

	program payoffM

	implicit none
	include "common.h"

	integer i,j,k,m, nS, N, ip,nump,ie,ib,iw,iepsi,idelta
	double precision pay1, pay2, payMAT(nSmax,nSmax), beta,
     +	       statD(nSmax), rhoMAT(nSmax,nSmax), cooMAT(nSmax,nSmax,3),
     + 		ALLM(nmaxp,nSmax),headM(nmaxp,5),coop1,coop2,def1,def2, 
     +			COOM(nmaxp,4), idb, ide,idw,idepsi,iddelta,ccm
     	real, allocatable:: evect(:),bvect(:),wvect(:),
     +		 epsivect(:),deltavect(:)
	character*80 outf, strf

	cooMAT=0.d0
	payMAT=-1.d0
	rhoMAT=0.d0
	print*,'Parameters b, error, w, epsilon, delta (-999 variable)'
	read(*,*) idb, ide,idw,idepsi,iddelta
 		print*,idb, ide,idw,idepsi,iddelta
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

c	evect=(/ 0.01 /)
c	bvect=(/ 4. /)
c	wvect=(/ 0.9/)
c	epsivect=(/ 0.25 /)
c	deltavect=(/ 4./)

	if (idb.eq.-999) then
	  bvect=(/ (i*0.1,i=11,99,2) /)
	else
	  bvect=(/ idb /)
	endif
	if (ide.eq.-999) then
	  !evect=(/ (i*0.0005,i=1,1000,20) /)
	  evect=(/ ( 10**(-3.5d0+i*0.06d0) ,i=0,50) /)
	else
	  evect=(/ ide /)
	endif
	if (idw.eq.-999) then
	  wvect=(/ 0.8, 0.9, 0.99 /)
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
     +			 Pout(nS), Pin(nS),TREv(nS,1),TREv(nS,2)
	enddo
 50	continue
	nS=nS-1
	close(10)

	ip=0
	do ie=1,size(evect)
	do ib=1,size(bvect)
	do iw=1,size(wvect)
	do iepsi=1,size(epsivect)
	do idelta=1,size(deltavect)

	ip=ip+1
	e=evect(ie)
	b=bvect(ib)
	w=wvect(iw)
	epsi=epsivect(iepsi)
	delta=deltavect(idelta)
	headM(ip,1)=e
	headM(ip,2)=b
	headM(ip,3)=w
	headM(ip,4)=epsi
	headM(ip,5)=delta
			print*, ip,(headM(ip,k),k=1,5)
	payMAT=9999.d0
	do i=1,nS
	  do j=i,nS
	    !print*,numS(i),numS(j)	
	    call anaPAY(pay1,pay2,i,j,coop1,coop2,def1,def2,ccm)
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
	  enddo
	enddo
	call SD(statD,payMAT,nS,nSmax,N,beta)

	forall(k=1:nS) ALLM(ip,k)=statD(k)
	
	forall(m=1:2) COOM(ip,m)=0.d0
	do i=1,nS
	  do j=1,nS
	   forall(m=1:2) COOM(ip,m)=COOM(ip,m)
     +				+statD(i)*statD(j)*cooMAT(i,j,m)
	   COOM(ip,4)=COOM(ip,4)
     +				+statD(i)*statD(j)*cooMAT(i,j,3)
	  enddo
	enddo
	COOM(ip,3)=1.d0-(COOM(ip,1)+COOM(ip,2))


	enddo
	enddo
	enddo
	enddo
	enddo
	nump=ip

	open(90,file=outf,status='unknown')
	write(90,'(A1,2A)') '#',' err, b/c, w, epsilon, delta',
     +  '     Probability of each strategy...   Coop,Def,NP,MutC levels' 
	write(90,'(5I6,$)') 0,0,0,0,0
	do j=1,nS
	  write(90,'(F13.2,$)') 0.1*TREv(j,1)+0.01*TREv(j,2)+numS(j)		
	enddo
	write(90,*) ' '
	do i=1,nump
	  write(90,'(F7.4,4F6.2,$)') (headM(i,k),k=1,5)
	  do j=1,nS
	    write(90,'(E13.4,$)') ALLM(i,j)		
	  enddo
	  write(90,'(4E13.4)') (COOM(i,j),j=1,4)
	enddo
	close(90)



	stop
	end

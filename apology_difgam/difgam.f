	include "sub_payoffM.f"
	include "sub_SD.f"

	program find

	implicit none
	include "common.h"

	integer i,j,k,m, nS,N, TRE, nSbase, nSg, ii,jj, rowS,xparam,
     +      numSI(nSmax), propI(nSmax),accepI(nSmax),PoutI(nSmax), gamN,
     +	matS(999,999)
	double precision pay1, pay2, payMAT(nSmax,nSmax), beta,
     +  statD(nSmax), inix, finx, dxi,xv(3),PinI(nSmax), 
     +   coop1,coop2,def1,def2, gamd,
     +    ccm,ideAF,tsum,gam0,gamE, gamvect(999)
	character*80 outf, strf


	print*,'Row of strategy'
	read(*,*) rowS
	print*,'Initial and final gamma, number of gammas'
	read(*,*) gam0, gamE, gamN
	print*,'Treatment -- 00, 10, 01, 11'
	read(*,*) TRE			!TRE: 00 (strict), 10 (basic), 01(antibasic), 11(relax),*
	print*,'Parameters eAF,b,err,w,epsi,delta (-999 var)(-888 find)'
	read(*,*) eAF, b, e,w,epsi,delta
 		print*,eAF,b, e,w,epsi,delta
	print*,'Beta, N'
	read(*,*) beta, N
 		print*, beta, N
	print*,'File with strategies'
	read(*,*) strf
		print*,strf
	print*,'Output file'
	read(*,*) outf
		print*,outf




	open(10,file=strf,status='old')
	read(10,*)
	nS=0
	nSg=0
	do
	  nS=nS+1
	  read(10,*,end=50) numSI(nS), propI(nS), accepI(nS),
     +			 PoutI(nS), PinI(nS)
	enddo
 50	continue
	nSbase=nS-1
	close(10)

	gamd=(gamE-gam0)/(gamN-1.d0)
			print*,gam0,gamE,gamN,gamd
	do i=0,gamN-1
	  gamvect(i+1)= gam0 + i*gamd
	enddo 

	nS=0
	do i=1,nSbase
	  if((propI(i).eq.0).and.(accepI(i).eq.0)) then
	    nS=nS+1
	    numS(nS)=numSI(i)
	    prop(nS)=propI(i)
	    accep(nS)=accepI(i)
	    Pout(nS)=PoutI(i)
	    Pin(nS)=PinI(i)
	  else
	    do j=0,gamN
	      do k=0,gamN
		nS=nS+1
			!print*,i,j,k,nS
		if(i.eq.rowS) matS(j+1,k+1)=nS
	    	numS(nS)=numSI(i)
	    	prop(nS)=propI(i)
	    	accep(nS)=accepI(i)
	    	Pout(nS)=PoutI(i)
	    	Pin(nS)=PinI(i)
		if(j.eq.0) then
		  fgam(nS)=99
		else
		  fgam(nS)=gamvect(j)
		endif
		if(k.eq.0) then
		  agam(nS)=-99
		else
		  agam(nS)=gamvect(k)
		endif
	      enddo
	    enddo
	  endif
	enddo
	print*,'Number of strategies: ', nS

	do ii=1,nS
	do jj=1,nS
	  if (fgam(ii).le.agam(jj)) then
	  	fa(ii,jj)=1.d0-eAF
	  else
		fa(ii,jj)=eAF
	  endif
	enddo
	enddo

	!print*,(gamvect(i),i=1,gamN)
	!do i=1,gamN+1
	!  write(*,'(11I4)') (matS(i,j),j=1,gamN+1)
	!enddo
	!do i=1,gamN+1
	!  write(*,'(11F6.1)') (fgam(matS(i,j)),j=1,gamN+1)
	!enddo
	!print*
	!do i=1,gamN+1
	!  write(*,'(11F6.1)') (agam(matS(i,j)),j=1,gamN+1)
	!enddo
	!print*

	call calcSD(statD,nS,N,beta,TRE)

	!do i=1,gamN+1
	!  write(*,'(11E10.2)') (statD(matS(i,j)),j=1,gamN+1)
	!enddo

	open(90,file=outf,status='unknown')
	write(90,'(A7,$)') '0000'
	do i=1,gamN+1
	  write(90,'(F14.2,$)') agam(matS(1,i))
	enddo	
	write(90,*)
	do i=1,gamN+1
	  write(90,'(F7.2,$)') fgam(matS(i,1))
	  do j=1,gamN+1
	    write(90,'(E14.4,$)') statD(matS(i,j))
	  enddo
	  write(90,*)
	enddo	
	close(90)

	stop
	end



	
	subroutine calcSD(statD,nS,N,beta,TRE)
	implicit none
	include "common.h"
	double precision statD(nSmax), beta
	integer nS, N, TRE
	double precision pay1, pay2, payMAT(nSmax,nSmax),
     +				 coop1,coop2,def1,def2,ccm
	integer i,j
	payMAT=9999.d0
	do i=1,nS
	  print*, i,' / ',nS
	  do j=i,nS	
	    call anaPAY(pay1,pay2,i,j,coop1,coop2,def1,def2,ccm,TRE)
	    if(i.eq.j) then
		payMAT(i,i)=(pay1+pay2)/2.d0
	    else
	    	payMAT(i,j)=pay1
	    	payMAT(j,i)=pay2
	    endif
	  enddo
	enddo
	call SD(statD,payMAT,nS,nSmax,N,beta)
	return
	end



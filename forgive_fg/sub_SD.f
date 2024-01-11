	subroutine SD(statD,payMAT,nS,nSmax,N,beta)
	implicit none
	integer nS,nSmax,N
	double precision beta,payMAT(nSmax,nSmax),statD(nSmax)
	integer i,j,is1,is2, errorflag
	double precision  rhoMAT(nSmax,nSmax), 
     +	   suma, MATT(nSmax,nSmax),MATinv(nSmax,nSmax),
     +		  pAA,pAB,pBB,pBA, pfix, MATTt(nSmax,nSmax)
	do is1=1,nS
	  do is2=1,nS
	    if(is1.ne.is2) then
		pAA=payMAT(is1,is1)
		pAB=payMAT(is1,is2)
		pBB=payMAT(is2,is2)
		pBA=payMAT(is2,is1)
		rhoMAT(is2,is1)=pfix(pAA,pAB,pBB,pBA,N,beta)
c      			if((is2.eq.2).and.(is1.eq.9)) print*,
c     +				rhoMAT(is1,is2),pAA,pAB,pBB,pBA
	    endif
	  enddo
	enddo
	do i=1,nS
	  suma=0.d0
	  do j=1,nS
	   if(i.ne.j) suma=suma+rhoMAT(i,j)
	  enddo
	  rhoMAT(i,i)=-suma!/(nS-1)
	enddo
	MATT=0.d0
	do i=1,nS
	  do j=1,nS
	    MATT(i,j)=rhoMAT(j,i)
	  enddo
	enddo
c		do i=1,nS
c		write(*,'(20E10.2)') (payMAT(i,j),j=1,20)
c		enddo
c		print*,'----------------------------------'
c		do i=1,nS
c		write(*,'(20E10.2)') (rhoMAT(i,j),j=1,20)
c		enddo
c		stop	
	do j=1,nS
	  MATT(1,j)=1.d0
	enddo
		!do i=1,nS
	  	!do j=1,nS
	    	!  print*,i,j,MATT(i,j)
	  	!enddo
		!enddo
	call FINDInvt(MATT, MATinv, nS, nSmax, errorflag)
		!do i=1,nS
	  	!do j=1,nS
	    	!  print*,i,j,MATinv(i,1)
	  	!enddo
		!enddo
	suma=0.d0
	do i=1,nS
	  statD(i)=MATinv(i,1)
	  suma=suma+statD(i)
	enddo
			!print*,suma
			!MATTt=matmul(MATT,MATinv)
		!do i=1,nS
	  	!do j=1,nS
	    	!  print*,i,j,MATTt(i,j)
	  	!enddo
		!enddo
			
	return
	end



	double precision function pfix(pAA,pAB,pBB,pBA,N,beta)
	implicit none
	integer N
	double precision pAA,pAB,pBB,pBA,beta
	integer i,j
	double precision payA(N),payB(N),prod,difpb
	do i=1,N
	  payA(i)=((i-1)*pAA+(N-i)*pAB)/(N-1)
	  payB(i)=(i*pBA+(N-i-1)*pBB)/(N-1)
	enddo
	pfix=0.d0
	do i=1,N-1
	  prod=1.d0
	  do j=1,i
	    difpb=beta*(payA(j)-payB(j))
	    prod=prod*(1.d0+dexp(-difpb))/(1.d0+dexp(difpb))
	  enddo
	  pfix=pfix+prod
	enddo
	pfix=1.d0/(1.d0+pfix)
	return
	end



     	SUBROUTINE FINDInvt(matrix, inverse, n, nMAX, errorflag)
!Subroutine to find the inverse of a square matrix
!Author : Louisda16th a.k.a Ashwith J. Rego
!Reference : Algorithm has been well explained in:
!http://math.uww.edu/~mcfarlat/inverse.htm           
!http://www.tutor.ms.unimelb.edu.au/matrix/matrix_inverse.html
	IMPLICIT NONE
	!Declarations
	INTEGER, INTENT(IN) :: n, nMAX
	INTEGER, INTENT(OUT) :: errorflag  !Return error status. -1 for error, 0 for normal
	double precision, INTENT(IN), DIMENSION(nMAX,nMAX) :: matrix  !Input matrix
	double precision, INTENT(OUT), DIMENSION(nMAX,nMAX) :: inverse !Inverted matrix
	
	LOGICAL :: FLAG = .TRUE.
	INTEGER :: i, j, k, l
	double precision :: m
	double precision, DIMENSION(n,2*n) :: augmatrix !augmented matrix
	
	!Test for invertibility
	!Augment input matrix with an identity matrix
	DO i = 1, n
		DO j = 1, 2*n
			IF (j <= n ) THEN
				augmatrix(i,j) = matrix(i,j)
			ELSE IF ((i+n) == j) THEN
				augmatrix(i,j) = 1.d0
			Else
				augmatrix(i,j) = 0.d0
			ENDIF
		END DO
	END DO
	
	!Reduce augmented matrix to upper traingular form
	DO k =1, n-1
		IF (augmatrix(k,k) == 0) THEN
			FLAG = .FALSE.
			DO i = k+1, n
				IF (augmatrix(i,k) /= 0) THEN
					DO j = 1,2*n
						augmatrix(k,j) = augmatrix(k,j)+augmatrix(i,j)
					END DO
					FLAG = .TRUE.
					EXIT
				ENDIF
				IF (FLAG .EQV. .FALSE.) THEN
					PRINT*, "Matrix is non - invertible_"
					inverse = 0.d0
					errorflag = -1
					return
				ENDIF
			END DO
		ENDIF
		DO j = k+1, n			
			m = augmatrix(j,k)/augmatrix(k,k)
			DO i = k, 2*n
				augmatrix(j,i) = augmatrix(j,i) - m*augmatrix(k,i)
			END DO
		END DO
	END DO
	
	!Test for invertibility
	DO i = 1, n
		IF (augmatrix(i,i) == 0) THEN
			PRINT*, "Matrix is non - invertible ."
			inverse = 0.d0
			errorflag = -1
			return
		ENDIF
	END DO
	
	!Make diagonal elements as 1
	DO i = 1 , n
		m = augmatrix(i,i)
		DO j = i , (2 * n)				
			   augmatrix(i,j) = (augmatrix(i,j) / m)
		END DO
	END DO
	
	!Reduced right side half of augmented matrix to identity matrix
	DO k = n-1, 1, -1
		DO i =1, k
		m = augmatrix(i,k+1)
			DO j = k, (2*n)
				augmatrix(i,j) = augmatrix(i,j) -augmatrix(k+1,j) * m
			END DO
		END DO
	END DO				
	
	!store answer
	DO i =1, n
		DO j = 1, n
			inverse(i,j) = augmatrix(i,j+n)
		END DO
	END DO
	errorflag = 0

     	END SUBROUTINE FINDinvt


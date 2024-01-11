
	integer, parameter :: NSmax=11111 
	double precision, parameter :: c=1.d0

	integer numS(nSmax), prop(nSmax),accep(nSmax), Pout(nSmax)
	double precision e,b,w,epsi,delta,Pin(nSmax),fin(nSmax),
     +		  fgam(nSmax),eAF,agam(nSmax),fa(nSmax,nSmax)

	common /param/	e,b,w,epsi,delta,eAF
	common /strategies/ numS, prop,accep,Pout,Pin,fa,agam

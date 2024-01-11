
	integer, parameter :: NSmax=99, nmaxp=999999
	double precision, parameter :: cero=1.d-30

	integer numS(nSmax), prop(nSmax),accep(nSmax), Pout(nSmax)
	double precision e,Rp,Pp,Sp,Tp,w,epsi,delta,Pin(nSmax),fin(nSmax),
     +		  f(nSmax),eAF,gam,a(nSmax),ain(nSmax),fa(nSmax,nSmax)

	common /param/	e,Rp,Pp,Sp,Tp,w,epsi,delta,eAF,gam
	common /strategies/ numS, prop,accep,Pout,Pin,fa

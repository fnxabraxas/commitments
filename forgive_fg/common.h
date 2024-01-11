
	integer, parameter :: NSmax=99, nmaxp=999999
	double precision, parameter :: c=1.d0

	integer numS(nSmax), prop(nSmax),accep(nSmax), Pout(nSmax)
	double precision e,b,w,epsi,delta,Pin(nSmax),fin(nSmax),
     +						f(nSmax),q

	common /param/	e,b,w,epsi,delta,q
	common /strategies/ numS, prop, accep, Pout, Pin, fin,f

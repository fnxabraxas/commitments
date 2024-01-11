
	integer, parameter :: NSmax=99, nmaxp=999999
	double precision, parameter :: c=1.d0

	integer numS(nSmax), prop(nSmax),accep(nSmax), Pout(nSmax)
	double precision e,b,w,epsi,delta,Pin(nSmax),maxDP

	common /param/	e,b,w,epsi,delta, maxDP
	common /strategies/ numS, prop, accep, Pout, Pin

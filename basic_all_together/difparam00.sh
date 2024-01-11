#!/bin/bash

beta=0.1d0
N=100
w=0.9

bv=("2") #("1.5" "2" "4")
ev=("0.01" "0.1")
epsiv=("0") #("0.25")
deltav=("0") #("4")


for var in 'e' # 'b' 'epsi' 'delta'
do

if [ "$var" == 'b' ]; then bvini=("${bv[@]}"); bv=("-999") ; fi
if [ "$var" == 'e' ]; then evini=("${ev[@]}"); ev=("-999") ; fi
if [ "$var" == 'epsi' ]; then epsivini=("${epsiv[@]}"); epsiv=("-999") ; fi
if [ "$var" == 'delta' ]; then deltavini=("${deltav[@]}"); deltav=("-999") ; fi


for ib in ${!bv[*]}; do for ie in ${!ev[*]}; do for iepsi in ${!epsiv[*]}; do for idelta in ${!deltav[*]}; do
b=${bv[$ib]}; e=${ev[$ie]}; epsi=${epsiv[$iepsi]}; delta=${deltav[$idelta]}

strf="strategies.dat"
lab="b"$b"_e"$e"_epsi"$epsi"_delta"$delta
outf="SD_"$lab".dat"
echo $lab
./difparam <<EOF
$b
$e
$w
$epsi
$delta
$beta
$N
$strf
$outf
EOF
mv $outf data/.
done;done;done;done

if [ "$var" == 'b' ]; then bv=("${bvini[@]}"); fi
if [ "$var" == 'e' ]; then ev=("${evini[@]}"); fi
if [ "$var" == 'epsi' ]; then epsiv=("${epsivini[@]}"); fi
if [ "$var" == 'delta' ]; then deltav=("${deltavini[@]}"); fi

done # var





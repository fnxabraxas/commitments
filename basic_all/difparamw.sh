#!/bin/bash

beta=0.1d0
N=100
#w=0.9

bv=("2") # ("1.5" "2" "4")
ev=("0.0001" "0.01" "0.1")
epsiv=("1" "2") # ("0.25")
deltav=("4")


for TRE in "00" "01" "10" "11"
do
if [ "$TRE" == "01" ] || [ "$TRE" == "11" ] || [ "$TRE" == "10" ]; then strf="strategies.dat"; fi
if [ "$TRE" == "00" ]; then strf="strategies_strict.dat"; fi 


for var in 'w' # 'e' 'b' 'epsi' 'delta'
do

if [ "$var" == 'w' ]; then wvini=("${wv[@]}"); wv=("-999") ; fi
if [ "$var" == 'b' ]; then bvini=("${bv[@]}"); bv=("-999") ; fi
if [ "$var" == 'e' ]; then evini=("${ev[@]}"); ev=("-999") ; fi
if [ "$var" == 'epsi' ]; then epsivini=("${epsiv[@]}"); epsiv=("-999") ; fi
if [ "$var" == 'delta' ]; then deltavini=("${deltav[@]}"); deltav=("-999") ; fi


for iw in ${!wv[*]}; do for ib in ${!bv[*]}; do for ie in ${!ev[*]}; do for iepsi in ${!epsiv[*]}; do for idelta in ${!deltav[*]}; do
w=${wv[$iw]}; b=${bv[$ib]}; e=${ev[$ie]}; epsi=${epsiv[$iepsi]}; delta=${deltav[$idelta]}

lab="w"$w"_b"$b"_e"$e"_epsi"$epsi"_delta"$delta
outf="SD_"$lab"_"$TRE".dat"
echo $lab $TRE
./difparam <<EOF
$TRE
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
done;done;done;done;done

if [ "$var" == 'w' ]; then wv=("${wvini[@]}"); fi
if [ "$var" == 'b' ]; then bv=("${bvini[@]}"); fi
if [ "$var" == 'e' ]; then ev=("${evini[@]}"); fi
if [ "$var" == 'epsi' ]; then epsiv=("${epsivini[@]}"); fi
if [ "$var" == 'delta' ]; then deltav=("${deltavini[@]}"); fi

done # var

done # TRE



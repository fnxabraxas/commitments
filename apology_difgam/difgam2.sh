#!/bin/bash

TRE=$1
beta=0.1d0
N=100
w=0.9

gam0=0
gamE=8
gamN=30

bv=("1.5" "2" "4")
ev=("0.1") #("0.01" "0.1")
epsiv=("0.25") # "0" )
deltav=("4") # "0" )
eAFv=("0.01") # eAFv=("0.01" "0.1")

##for TRE in "00" "11"    ###"01" "10"
##do
if [ "$TRE" == "01" ] || [ "$TRE" == "11" ] || [ "$TRE" == "10" ]; then
strf="strategies_comb.dat"
rowS=2
fi
if [ "$TRE" == "00" ]; then
strf="strategies_strict_comb.dat"
rowS=2
fi 



for ieAF in ${!eAFv[*]}; do for ib in ${!bv[*]}; do for ie in ${!ev[*]}; do for iepsi in ${!epsiv[*]}; do for idelta in ${!deltav[*]}; do
eAF=${eAFv[$ieAF]}; b=${bv[$ib]}; e=${ev[$ie]}; epsi=${epsiv[$iepsi]}; delta=${deltav[$idelta]}

lab="eAF"$eAF"_g"$gam"_b"$b"_e"$e"_epsi"$epsi"_delta"$delta
outf="find_"$lab"_"$TRE".dat"
echo $lab $TRE
./difgam <<EOF
$rowS
$gam0
$gamE
$gamN
$TRE
$eAF
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



##done # TRE



#!/bin/bash

rm ./salidaAB.dat
rm ./salidaSiege.dat

for (( i=0; i<10; i++ ))
do
	ab -n 1000 -c 5 http://10.0.0.129/index.html | grep -e 'Time taken*' -e 'Failed req*' -e 'Requests per*' >> salidaAbHost.dat
done

for (( i=0; i<10; i++ ))
do
	siege -b -t10S http://10.0.0.129/index.html  >> salidaSiegeHost.dat
done

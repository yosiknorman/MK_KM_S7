#!/bin/bash

    echo "'reinit'" > subset2.gs 
    echo "'sdfopen http://apdrc.soest.hawaii.edu:80/dods/public_data/CPC_Temperature/tmax'" >>  subset2.gs 
    echo "'set lon 90 140'" >> subset2.gs 
    echo "'set lat -10 5'"  >> subset2.gs 
    # echo "'set time 01Jan2023 07Jan2023'" >> subset2.gs 
    echo "'set time " `date +%d%b`"2023" `date -v+10d +%d%b`"2023'" >> subset2.gs 
    echo "'define suhumax=tmax'" >> subset2.gs 
    # echo "'set sdfwrite data/suhumax_2023"`date +%m%d`".nc'" >> subset2.gs 
    echo "'set sdfwrite data/suhumax.nc'" >> subset2.gs 
    echo "'sdfwrite suhumax'" >> subset2.gs 
    echo "'set sdfwrite close'" >> subset2.gs 
    
    grads -lbxc subset2.gs
     ./plot.R `date`
    
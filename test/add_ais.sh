#!/bin/sh

if [ $# -lt 6 ]; then
    echo "add_ais.sh <mmsi> <lat> <lon> <cog> <sog> <yaw>"
    exit 
fi

fset aws1_ui_test ais_mmsi $1  ais_lat $2 ais_lon $3 ais_cog $4 ais_sog $5 ais_yaw $6 add_ais y

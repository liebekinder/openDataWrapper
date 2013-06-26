#!/bin/bash

export chemin="$PWD/$2"
cd $1
echo $chemin
./fuseki-server --config $chemin /openData &

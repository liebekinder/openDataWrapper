#!/bin/bash

export chemin="$PWD/$2"
cd $1
./fuseki-server --config $chemin /openData &
echo "&&-&& $!"

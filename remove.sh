#!/bin/bash

chmod +x csud/csud.sh

names=$(./csud/csud.sh list)
for name in $names 
do
    csud/csud.sh remove $name
done

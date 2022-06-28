#!/bin/bash


printers=$(lpstat -p | awk '{print $2}')

for printer in $printers; do
	sudo lpadmin -x $printer
done

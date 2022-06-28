#!/bin/bash

printers=$(lpstat -p | awk '{print $2}' | sed '1q')
echo $printers

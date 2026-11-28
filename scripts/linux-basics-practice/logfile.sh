#!/bin/bash
#here we will create on timestamp file with several details 
timestamp=$(date +%d-%m-%Y-%H:%M:S)
echo "This data contains timestamp" >> ${timestamp}.log
echo "This is extra data to log file" >> ${timestamp}.log
date >> ${timestamp}.log
echo >> ${timestamp}.log
echo "Data written to log file successfully" 

#!/bin/bash

#Date: 2/21/2025
#Class: ISS212
#Assignment: Week 3 Tool Development
#Notes For Professor / Resources Used
#Walkthrough from brightspace


####BASH BLOCK 1 FOR WK3 TOOL DEVELOPMENT####
  read -p "Enter the Packet Size in bytes: " packet_size
  if [ "$packet_size" -ge 100 ]; then
    echo "True - This Packetsize meets threshold for Analysis"
  else
    echo "False - This packet is not big enough for analysis"
  fi


####BASH BLOCK 2 FOR WK3 TOOL DEVELOPMENT####
  read -p "Enter the protocol name: " protocol_name
  if [ "$protocol_name" == "Cyphersec" ]; then
    echo "Yes - Cyphersec is the correct protocol"
  elif [ "$protocol_name" == "cyphersec" ]; then
    echo "You know what you did here"
  else
    echo "Cyphersec you donkey! Not $protocol_name!"
  fi
####BASH BLOCK 3 FOR WK3 TOOL DEVELOPMENT####
  read -p "Enter your annual data usage in MB: " data_usage

  if [ "$data_usage" -le 85528 ]; then
    tax=$((data_usage * 18 / 100 - 556))
  else
    surplus=$((data_usage - 85528))
    tax=$((14839 + surplus * 32 / 100))

  fi
  if [ "$tax" -lt 0 ]; then
      tax=0
  fi
  echo "Your Data Security Tax is: $tax MB"

####BASH BLOCK 4 FOR WK3 TOOL DEVELOPMENT####
  read -p "Enter the year to check the patch cycle: " year
  if [ "$year" -lt 2000 ];then
    echo "Not within the managed patch period"
  else
    if (( year % 4 != 0 )); then
      echo "Standard Year"
    elif (( year % 100 != 0 )); then
      echo "Patch Year"
    elif (( year % 400 != 0 )); then
      echo "Standard Year"
    else
      echo "Patch Year"
      fi
fi
read -p "Press Enter to Exit"
#!/bin/bash

while true; do
  read -p "Continue to sleep the MacBook anyway [y/n]?" yn
  case $yn in
    [Yy]* ) pmset sleepnow; break;;
    [Nn]* ) echo "Phew...nothing happens...."; exit;;
    * ) echo "Please answer y or n.";;
  esac
done

# vim: filetype=bash autoindent expandtab shiftwidth=2 ts=2

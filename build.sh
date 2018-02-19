#!/bin/bash

PWD=`dirname $0`

docker build $PWD -t docker-libreoffice

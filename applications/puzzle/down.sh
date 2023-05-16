#!/usr/bin/env bash
HOSTNAME=`hostname`
curl "http://host.docker.internal:3001/down/$HOSTNAME"

#!/usr/bin/env bash

echo "host-ip(s)
$(ip route show | awk '/default/ {print $3}')"
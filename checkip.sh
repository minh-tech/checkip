#!/bin/bash

REAL=$(dig +short myip.opendns.com @resolver1.opendns.com)

FAKE=$(torsocks wget -U "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 3.5.30729)" -qO- http://ipecho.net/plain | xargs echo)

printf "Your REAL public ip	    : %s\n" "$REAL"
printf "Your FAKE public ip with Tor: %s\n" "$FAKE"

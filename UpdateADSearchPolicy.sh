#!/bin/bash
## I can't find the sources that I used, so hopefully this isn't a straight copy and paste, but I want to keep a reference in case I need it again.

## Disable all domains
dsconfigad -alldomains disable 

## Update search policies
dscl /Search -delete / CSPSearchPath "/Active Directory/DOMAIN/All Domains"
dscl /Search -append / CSPSearchPath "/Active Directory/DOMAIN/domain.example.com"
dscl /Search/Contacts -delete / CSPSearchPath "/Active Directory/DOMAIN/All Domains"
dscl /Search/Contacts -append / CSPSearchPath "/Active Directory/DOMAIN/domain.example.com"

## Restart OD
killall opendirectoryd

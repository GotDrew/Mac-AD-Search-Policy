#!/bin/bash

## Disable all domains
dsconfigad -alldomains disable 

## Update search policies
dscl /Search -delete / CSPSearchPath "/Active Directory/DOMAIN/All Domains"
dscl /Search -append / CSPSearchPath "/Active Directory/DOMAIN/domain.example.com"
dscl /Search/Contacts -delete / CSPSearchPath "/Active Directory/DOMAIN/All Domains"
dscl /Search/Contacts -append / CSPSearchPath "/Active Directory/DOMAIN/domain.example.com"

## Restart OD
killall opendirectoryd

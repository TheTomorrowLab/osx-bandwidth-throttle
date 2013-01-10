# OSx Bandwidth Throttler (this will work for any *nix)

## Basic Usage

- Download throttle.sh.
- Make the file executable with chmod +x throttle.sh
- Run it as the admin with sudo ./throttle.sh 45

## Values

- Numerical values will adjust to that speed in Kbytes/s e.g. ./throttle.sh 54
- Typing stop will reset back to what it should be e.g. ./throttle.sh stop
- Typing some predefined constants will result in some throttling e.g. ./throttle.sh 3g

## Constants taken from here (http://www.which.co.uk/technology/phones/guides/mobile-broadband/mobile-broadband-speed-and-usage-limits/)

- gprs - 30
- edge - 200
- 3g - 14000
- 4g - 3000000
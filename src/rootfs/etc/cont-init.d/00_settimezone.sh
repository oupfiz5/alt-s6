#!/usr/bin/with-contenv sh
  # shellcheck shell=sh

  set -e

  # * User parameters
  TIMEZONE=${TZ:="UTC"}

  TZFILE="../usr/share/zoneinfo/${TIMEZONE}"

  # * Work from the /etc directory
  cd /etc

  if [ -f ${TZFILE} ]; then  # Make sure the file exists
     echo "Setting timezone to ${TIMEZONE}"
     ln -sf ${TZFILE} localtime  # Set the timezone
  else
     echo "Timezone: ${TIMEZONE} not found, skipping"
  fi

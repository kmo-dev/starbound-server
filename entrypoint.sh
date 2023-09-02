#!/bin/bash
set -e

/steamcmd/steamcmd.sh \
    +force_install_dir /starbound \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +app_update 211820 validate  \
    +quit

exec /starbound/linux/starbound_server

#!/bin/bash
set -e

ls -la /
ls -la /server-data
ls -la /server-data/starbound
ls -la /server-data/steamcmd

/server-data/steamcmd/steamcmd.sh \
    +force_install_dir /server-data/starbound \
    +login $STEAM_USERNAME $STEAM_PASSWORD \
    +app_update 211820 validate  \
    +quit

exec /server-data/starbound/linux/starbound_server

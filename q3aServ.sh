#!/bin/bash

# --------------------------------------------
# Quake 3 Server Script                      |
# Created by q3aql (q3aql@protonmail.ch)     |
# Licensed by GPL v2.0                       |
# Last update: 13-03-2021                    |
# --------------------------------------------
VERSION="4.3"

# Path with binary and game files
RUN_PATH="/opt/Games/quake3"
cd ${RUN_PATH}

# Binary of server
RUN_BINARY="ioq3ded.x86_64"

# Baseq3 folder path
BASEQ3_PATH="${HOME}/.q3a/baseq3"
mkdir -p ${HOME}/.q3a/baseq3

# Basic configs
BOTS_LEVEL="2"
MIN_PLAYERS="5"
TIME_LIMIT="25"
FLAGS_LIMIT="10"
FRAGS_LIMIT="150"
TOU_FRAGS_LIMIT="50"
RCON_PASSWORD='"secret"'

# Status of server
STATUS_PATH="/var/www/html/quake3/status.txt"
# Note: Change to '/dev/null' if you want disable it.

# Map selection
expr ${2} + 1 &> /dev/null
mapSelection=$?
if [ -z "${2}" ] ; then
  MAP_SELECT=$(expr ${RANDOM} % 5 + 1)
else
  if [ ${mapSelection} -ne 0 ] ; then
    echo ""
    echo "<<[Error: Map-selection only must be numbers between 1 and 5]>>"
    echo ""
    exit
  elif [ ${2} -lt 1 ] || [ ${2} -gt 5 ] ; then
    echo ""
    echo "<<[Error: Map-selection must be between 1 and 5]>>"
    echo ""
    exit
  else
    MAP_SELECT=${2}
  fi
fi

# Function to stop a previous server and
# remove the config. files
function clear_server() {
  killall -9 ${RUN_BINARY} 2> /dev/null
  rm -rf ${BASEQ3_PATH}/basic.cfg
  rm -rf ${BASEQ3_PATH}/server*.cfg
  rm -rf ${BASEQ3_PATH}/bots*.cfg
  rm -rf ${BASEQ3_PATH}/levels*.cfg
}

# Function to remove the server logs.
function clear_server_logs() {
  echo > ${BASEQ3_PATH}/qconsole.log
  echo > ${BASEQ3_PATH}/server.log
}

# Function to show correct syntax in
# custom game.
function custom_game_menu() {
  echo ""
  echo "Syntax: q3aServ.sh CG [map-selection] [gametype] [minplayers] [bot-level] [time-limit] [flags/frags-limit]"
  echo ""
  echo "Available options:"
  echo ""
  echo "* map-selection -> 1-5"
  echo "* gametype -> CTF/FFA/TD/TOU/FT/CTFI/TDI/FFAI/CA/CAI"
  echo "* minplayers -> 0-10"
  echo "* bot-level -> 1-5"
  echo "* time-limit -> 0-999"
  echo "* flags/frags-limit -> 0-999"
  echo ""
  echo "Abbreviations:"
  echo ""
  echo "- CTF  = Capture The Flag"
  echo "- FFA  = Free For All"
  echo "- TD   = Team Deathmatch"
  echo "- TOU  = Tournament"
  echo "- FT   = Freeze Tag TD (OSP)"
  echo "- CFTI = Capture The Flag Instagib (OSP)"
  echo "- TDI  = Team Deatchmatch Instagib (OSP)"
  echo "- FFAI = Free For All Instagib (OSP)"
  echo "- CA   = Clan Arena (OSP)"
  echo "- CAI  = Clan Arena Instagib (OSP)"
  echo ""
}

# Function to check correct gametypes.
function check_gametype() {
  if [ "${1}" == "CTF" ] ; then
    echo "Gametype selected = CTF"
  elif [ "${1}" == "FFA" ] ; then
    echo "Gametype selected = FFA"
  elif [ "${1}" == "TD" ] ; then
    echo "Gametype selected = TD"
  elif [ "${1}" == "TOU" ] ; then
    echo "Gametype selected = TOU"
  elif [ "${1}" == "FT" ] ; then
    echo "Gametype selected = FT"
  elif [ "${1}" == "CTFI" ] ; then
    echo "Gametype selected = CTFI"
  elif [ "${1}" == "TDI" ] ; then
    echo "Gametype selected = TDI"
  elif [ "${1}" == "FFAI" ] ; then
    echo "Gametype selected = FFAI"
  elif [ "${1}" == "CA" ] ; then
    echo "Gametype selected = CA"
  elif [ "${1}" == "CAI" ] ; then
    echo "Gametype selected = CAI"
  elif [ -z "${1}" ] ; then
    echo "Empty" > /dev/null
  else
    echo ""
    echo "<<[Error: Gametype invalid]>>"
    custom_game_menu
    exit
  fi
}

# Available options
case ${1} in
  CTF|ctf)
    # Initialize "Capture The Flag" session
    clear_server
    cp server/basic.cfg ${BASEQ3_PATH}
    cp server/serverCTF.cfg ${BASEQ3_PATH}
    cp server/bots.cfg ${BASEQ3_PATH}
    cp server/levels/levelsCTF-${MAP_SELECT}.cfg ${BASEQ3_PATH}
    echo "seta g_spskill ${BOTS_LEVEL}" >> ${BASEQ3_PATH}/bots.cfg
    echo "seta bot_minplayers ${MIN_PLAYERS}" >> ${BASEQ3_PATH}/bots.cfg
    echo "seta timelimit ${TIME_LIMIT}" >> ${BASEQ3_PATH}/serverCTF.cfg
    echo "seta capturelimit ${FLAGS_LIMIT}" >> ${BASEQ3_PATH}/serverCTF.cfg
    echo "seta rconpassword ${RCON_PASSWORD}" >> ${BASEQ3_PATH}/serverCTF.cfg
    echo "Running Capture The Flag (${MAP_SELECT})" > ${STATUS_PATH}
    ./${RUN_BINARY} +exec basic.cfg +exec serverCTF.cfg +exec levelsCTF-${MAP_SELECT}.cfg +exec bots.cfg
    #clear_server
    echo "Stopped" > ${STATUS_PATH}
  ;;
  TD|td)
    # Initialize "Team Deathmatch" session
    clear_server
    cp server/basic.cfg ${BASEQ3_PATH}
    cp server/serverTD.cfg ${BASEQ3_PATH}
    cp server/bots.cfg ${BASEQ3_PATH}
    cp server/levels/levelsTD-${MAP_SELECT}.cfg ${BASEQ3_PATH}
    echo "seta g_spskill ${BOTS_LEVEL}" >> ${BASEQ3_PATH}/bots.cfg
    echo "seta bot_minplayers ${MIN_PLAYERS}" >> ${BASEQ3_PATH}/bots.cfg
    echo "seta timelimit ${TIME_LIMIT}" >> ${BASEQ3_PATH}/serverTD.cfg
    echo "seta fraglimit ${FRAGS_LIMIT}" >> ${BASEQ3_PATH}/serverTD.cfg
    echo "seta rconpassword ${RCON_PASSWORD}" >> ${BASEQ3_PATH}/serverTD.cfg
    echo "Running Team Deathmatch (${MAP_SELECT})" > ${STATUS_PATH}
    ./${RUN_BINARY} +exec basic.cfg +exec serverTD.cfg +exec levelsTD-${MAP_SELECT}.cfg +exec bots.cfg
    #clear_server
    echo "Stopped" > ${STATUS_PATH}
  ;;
  FFA|ffa)
    # Initialize "Free For All" session
    clear_server
    cp server/basic.cfg ${BASEQ3_PATH}
    cp server/serverFFA.cfg ${BASEQ3_PATH}
    cp server/bots.cfg ${BASEQ3_PATH}
    cp server/levels/levelsFFA-${MAP_SELECT}.cfg ${BASEQ3_PATH}
    echo "seta g_spskill ${BOTS_LEVEL}" >> ${BASEQ3_PATH}/bots.cfg
    echo "seta bot_minplayers ${MIN_PLAYERS}" >> ${BASEQ3_PATH}/bots.cfg
    echo "seta timelimit ${TIME_LIMIT}" >> ${BASEQ3_PATH}/serverFFA.cfg
    echo "seta fraglimit ${FRAGS_LIMIT}" >> ${BASEQ3_PATH}/serverFFA.cfg
    echo "seta rconpassword ${RCON_PASSWORD}" >> ${BASEQ3_PATH}/serverFFA.cfg
    echo "Running Free For All (${MAP_SELECT})" > ${STATUS_PATH}
    ./${RUN_BINARY} +exec basic.cfg +exec serverFFA.cfg +exec levelsFFA-${MAP_SELECT}.cfg +exec bots.cfg
    #clear_server
    echo "Stopped" > ${STATUS_PATH}
  ;;
  TOU|tou|tourney)
    # Initialize "Tournament" session
    clear_server
    cp server/basic.cfg ${BASEQ3_PATH}
    cp server/serverTOU.cfg ${BASEQ3_PATH}
    cp server/bots.cfg ${BASEQ3_PATH}
    cp server/levels/levelsTOU-${MAP_SELECT}.cfg ${BASEQ3_PATH}
    echo "seta g_spskill ${BOTS_LEVEL}" >> ${BASEQ3_PATH}/bots.cfg
    echo "seta bot_minplayers 2" >> ${BASEQ3_PATH}/bots.cfg
    echo "seta timelimit ${TIME_LIMIT}" >> ${BASEQ3_PATH}/serverTOU.cfg
    echo "seta fraglimit ${TOU_FRAGS_LIMIT}" >> ${BASEQ3_PATH}/serverTOU.cfg
    echo "seta rconpassword ${RCON_PASSWORD}" >> ${BASEQ3_PATH}/serverTOU.cfg
    echo "Running Tournament (${MAP_SELECT})" > ${STATUS_PATH}
    ./${RUN_BINARY} +exec basic.cfg +exec serverTOU.cfg +exec levelsTOU-${MAP_SELECT}.cfg +exec bots.cfg
    #clear_server
    echo "Stopped" > ${STATUS_PATH}
  ;;
  CG|cg|custom)
    # Initialize "Custom Game" session
    check_gametype ${3}
    expr ${4} + 1 &> /dev/null
    minPlayers=$?
    expr ${5} + 1 &> /dev/null
    botLevel=$?
    expr ${6} + 1 &> /dev/null
    timeLimit=$?
    expr ${7} + 1 &> /dev/null
    FFLimit=$?
    if [ -z "${2}" ] ; then
      custom_game_menu
    elif [ "${2}" == "-h" ] || [ "${2}" == "--help" ] ; then
      custom_game_menu
    elif [ -z "${4}" ] ; then
      echo ""
      echo "<<[Error: Minplayers must be specified]>>"
      custom_game_menu
    elif [ ${minPlayers} -ne 0 ] ; then
      echo ""
      echo "<<[Error: Minplayers only must be numbers between 0 and 10]>>"
      custom_game_menu
    elif [ ${4} -lt 0 ] || [ ${4} -gt 10 ] ; then
      echo ""
      echo "<<[Error: Minplayers must be between 0 and 10]>>"
      custom_game_menu
    elif [ -z "${5}" ] ; then
      echo ""
      echo "<<[Error: Bot-level must be specified]>>"
      custom_game_menu
    elif [ ${botLevel} -ne 0 ] ; then
      echo ""
      echo "<<[Error: Bot-level only must be numbers between 1 and 5]>>"
      custom_game_menu
    elif [ ${5} -lt 1 ] || [ ${5} -gt 5 ] ; then
      echo ""
      echo "<<[Error: Bot-level must be between 1 and 5]>>"
      custom_game_menu
    elif [ -z "${6}" ] ; then
      echo ""
      echo "<<[Error: Time-limit must be specified]>>"
      custom_game_menu
    elif [ ${timeLimit} -ne 0 ] ; then
      echo ""
      echo "<<[Error: Time-limit only must be numbers between 0 and 999]>>"
      custom_game_menu
    elif [ ${6} -lt 0 ] || [ ${6} -gt 999 ] ; then
      echo ""
      echo "<<[Error: Time-limit must be between 0 and 999]>>"
      custom_game_menu
    elif [ -z "${7}" ] ; then
      echo ""
      echo "<<[Error: Flags/frags-limit must be specified]>>"
      custom_game_menu
    elif [ ${FFLimit} -ne 0 ] ; then
      echo ""
      echo "<<[Error: Flags/frags-limit only must be numbers between 0 and 999]>>"
      custom_game_menu
    elif [ ${7} -lt 0 ] || [ ${7} -gt 999 ] ; then
      echo ""
      echo "<<[Error: Flags/frags-limit must be between 0 and 999]>>"
      custom_game_menu
    else
      clear_server
      cp server/basic.cfg ${BASEQ3_PATH}
      cp server/server${3}.cfg ${BASEQ3_PATH}
      cp server/bots.cfg ${BASEQ3_PATH}
      cp server/levels/levels${3}-${2}.cfg ${BASEQ3_PATH}
      echo "seta g_spskill ${5}" >> ${BASEQ3_PATH}/bots.cfg
      echo "seta bot_minplayers ${4}" >> ${BASEQ3_PATH}/bots.cfg
      echo "seta timelimit ${6}" >> ${BASEQ3_PATH}/server${3}.cfg
      if [ "${3}" == "CTF" ] ; then
        echo "seta capturelimit ${7}" >> ${BASEQ3_PATH}/server${3}.cfg
      elif [ "${3}" == "CTFI" ] ; then
        echo "seta capturelimit ${7}" >> ${BASEQ3_PATH}/server${3}.cfg
      else
        echo "seta fraglimit ${7}" >> ${BASEQ3_PATH}/server${3}.cfg
      fi
      echo "seta rconpassword ${RCON_PASSWORD}" >> ${BASEQ3_PATH}/server${3}.cfg
      echo "Running ${3} (Custom Game) ($2)" > ${STATUS_PATH}
      if [ "${3}" == "FT" ] ; then
        ./${RUN_BINARY} +set fs_game osp +exec basic.cfg +exec server${3}.cfg +exec levels${3}-${2}.cfg +exec bots.cfg
      elif [ "${3}" == "CTFI" ] ; then
        ./${RUN_BINARY} +set fs_game osp +exec basic.cfg +exec server${3}.cfg +exec levels${3}-${2}.cfg +exec bots.cfg
      elif [ "${3}" == "TDI" ] ; then
        ./${RUN_BINARY} +set fs_game osp +exec basic.cfg +exec server${3}.cfg +exec levels${3}-${2}.cfg +exec bots.cfg
      elif [ "${3}" == "FFAI" ] ; then
        ./${RUN_BINARY} +set fs_game osp +exec basic.cfg +exec server${3}.cfg +exec levels${3}-${2}.cfg +exec bots.cfg
      elif [ "${3}" == "CA" ] ; then
        ./${RUN_BINARY} +set fs_game osp +exec basic.cfg +exec server${3}.cfg +exec levels${3}-${2}.cfg +exec bots.cfg
      elif [ "${3}" == "CAI" ] ; then
        ./${RUN_BINARY} +set fs_game osp +exec basic.cfg +exec server${3}.cfg +exec levels${3}-${2}.cfg +exec bots.cfg
      else
        ./${RUN_BINARY} +exec basic.cfg +exec server${3}.cfg +exec levels${3}-${2}.cfg +exec bots.cfg
      fi
      #clear_server
      echo "Stopped" > ${STATUS_PATH}
    fi
  ;;
  ST|st|stop|STOP)
    # Close previous sessions
    clear_server
    echo "Stopped" > ${STATUS_PATH}
  ;;
  CL|cl)
    # Clear all server logs
    clear_server_logs
  ;;
  *)
    # Show menu
    echo ""
    echo "Quake 3 Server Script v${VERSION}"
    echo ""
    echo "Config.files: ${RUN_PATH}/server/*.cfg"
    echo "Log.files: ${BASEQ3_PATH}/*.log"
    echo "Status: ${STATUS_PATH}"
    echo ""
    echo "Syntax: q3aServ.sh <option> [1-5]"
    echo ""
    echo "Available options:"
    echo ""
    echo "CTF - Start Capture The Flag"
    echo "TD  - Start Team Deathmatch"
    echo "FFA - Start Free For All"
    echo "TOU - Start Tournament"
    echo "CG  - Custom Game"
    echo "CL  - Clear Logs"
    echo "ST  - Stop Current Server"
    echo ""
esac

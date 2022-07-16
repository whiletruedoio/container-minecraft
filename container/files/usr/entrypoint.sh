#!/usr/bin/env sh

set -e

## Download

echo "###################################################"
echo "# Downloading Minecraft ${MC_VER}"
echo "###################################################"

wget "${MC_URL}" -c -O /opt/minecraft/server.jar

## Config

if [ "${CREATE_CONF}" = false ]
then

  echo "###################################################"
  echo "# Skipping config file creation                   #"
  echo "###################################################"

else

  echo "###################################################"
  echo "# Creating config files                           #"
  echo "###################################################"

  cat << SERVPROP > /opt/minecraft/server.properties

allow-flight=${ALLOW_FLIGHT:-false}
allow-nether=${ALLOW_NETHER:-true}
broadcast-console-to-ops=${BROADCAST_CONSOLE_TO_OPS:-true}
broadcast-rcon-to-ops=${BROADCAST_RCON_TO_OPS:-true}
difficulty=${DIFFICULTY:-easy}
enable-command-block=${ENABLE_COMMAND_BLOCK:-false}
enable-jmx-monitoring=${ENABLE_JMX_MONITORING:-false}
enable-rcon=${ENABLE_RCON:-false}
enable-status=${ENABLE_STATUS:-true}
enable-query=${ENABLE_QUERY:-false}
enforce-secure-profile=${ENFORCE_SECURE_PROFILE:-true}
enforce-whitelist=${ENFORCE_WHITELIST:-false}
entity-broadcast-range-percentage=${ENTITY_BROADCAST_RANGE_PERCENTAGE:-100}
force-gamemode=${FORCE_GAMEMODE:-false}
function-permission-level=${FUNCTION_PERMISSION_LEVEL:-2}
gamemode=${GAMEMODE:-survival}
generate-structures=${GENERATE_STRUCTURES:-true}
generator-settings=${GENERATOR_SETTINGS:-}
hardcore=${HARDCORE:-false}
hide-online-players=${HIDE_ONLINE_PLAYERS:-false}
level-name=${LEVEL_NAME:-world}
level-seed=${LEVEL_SEED:-}
level-type=${LEVEL_TYPE:-normal}
max-chained-neighbor-updates=${MAX_CHAINED_NEIGHBOR_UPDATES:-1000000}
max-players=${MAX_PLAYERS:-20}
max-tick-time=${MAX_TICK_TIME:-60000}
max-world-size=${MAX_WORLD_SIZE:-29999984}
motd=${MOTD:-A Minecraft Server}
network-compression-threshold=${NETWORK_COMPRESSION_THRESHOLD:-256}
online-mode=${ONLINE_MODE:-true}
op-permission-level=${OP_PERMISSION_LEVEL:-4}
player-idle-timeout=${PLAYER_IDLE_TIMEOUT:-0}
prevent-proxy-connections=${PREVENT_PROXY_CONNECTIONS:-false}
previews-chat=${PREVIEWS_CHAT:-false}
pvp=${PVP:-true}
query.port=${QUERY_PORT:-25565}
rate-limit=${RATE_LIMIT:-0}
rcon.password=${RCON_PASSWORD:-}
rcon.port=${RCON_PORT:-25575}
resource-pack=${RESOURCE_PACK:-}
resource-pack-prompt=${RESOURCE_PACK_PROMPT:-}
resource-pack-sha1=${RESOURCE_PACK_SHA1:-}
require-resource-pack=${REQUIRE_RESOURCE_PACK:-false}
server-ip=${SERVER_IP:-}
server-port=${SERVER_PORT:-25565}
simulation-distance=${SIMULATION_DISTANCE:-10}
snooper-enabled=${SNOOPER_ENABLED:-false}
spawn-animals=${SPAWN_ANIMALS:-true}
spawn-monsters=${SPAWN_MONSTERS:-true}
spawn-npcs=${SPAWN_NPCS:-true}
spawn-protection=${SPAWN_PROTECTION:-16}
sync-chunk-writes=${SYNC_CHUNK_WRITES:-true}
use-native-transport=${USE_NATIVE_TRANSPORT:-true}
view-distance=${VIEW_DISTANCE:-10}
white-list=${WHITE_LIST:-false}

SERVPROP

fi

## Run

CMD="java -Xmx${XMX:-1024M} -Xms${XMS:-1024M} -jar /opt/minecraft/server.jar --nogui"

if [ "${EULA}" = "true" ]
then
  echo "###################################################"
  echo "# Starting Minecraft Server                       #"
  echo "###################################################"
  echo "EULA: ${EULA}"
  echo "XMS: ${XMS:-1024M}"
  echo "XMX: ${XMX:-1024M}"
  echo ""

  ${CMD}
else
  echo "###################################################"
  echo "# You need to acknowledge the Minecraft EULA      #"
  echo "# https://www.minecraft.net/download/server/      #"
  echo "# Please provide '--env EULA=true', if you do so. #"
  echo "###################################################"
  echo ""

  exit 1
fi

exit 0

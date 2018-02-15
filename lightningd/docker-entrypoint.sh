#!/bin/sh

# exit from script if error was raised.
set -e

BITCOIN_DATA=${BITCOIN_DATA:-/home/lightning/.bitcoin}

BITCOIN_RPC_HOST=${BITCOIN_RPC_HOST:-127.0.0.1}

BITCOIN_RPC_USER=${BITCOIN_RPC_USER:-bitcoin}

BITCOIN_RPC_PASSWORD=${BITCOIN_RPC_PASSWORD:-password}

BITCOIN_NETWORK=${BITCOIN_NETWORK:-bitcoin}

LIGHTNING_DATA=${LIGHTNING_DATA:-/home/lightning/.lightning}

LIGHTNING_ALIAS=${LIGHTNING_ALIAS:-lightning_node}

LIGHTNING_RGB=${LIGHTNING_RGB:-000000}

LIGHTNING_IPADDR=${LIGHTNING_IPADDR:-127.0.0.1}

LIGHTNING_DEBUG=${LIGHTNING_DEBUG:-info}

PARAMS=$(echo \
    "--bitcoin-datadir=$BITCOIN_DATA" \
    "--bitcoin-rpcconnect=$BITCOIN_RPC_HOST" \
    "--bitcoin-rpcuser=$BITCOIN_RPC_USER" \
    "--bitcoin-rpcpassword=$BITCOIN_RPC_PASSWORD" \
    "--network=$BITCOIN_NETWORK" \
    "--alias=$LIGHTNING_ALIAS" \
    "--rgb=$LIGHTNING_RGB" \
    "--ipaddr=$LIGHTNING_IPADDR" \
    "--log-level=$LIGHTNING_DEBUG"
)

# Add user parameters to command.
PARAMS="$PARAMS $@"

# Print command and start lightning node.
echo "Command: lightningd $PARAMS"

if [ "$1" = "bash" ] || [ "$1" = "sh" ]; then
    exec "$@"
else
    exec gosu lightning lightningd $PARAMS
fi
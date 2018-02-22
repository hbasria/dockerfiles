#!/bin/sh

# exit from script if error was raised.
set -e

BITCOIN_DATA=${BITCOIN_DATA:-/home/bitcoin/.bitcoin}

BITCOIN_RPC_USER=${BITCOIN_RPC_USER:-bitcoin}

BITCOIN_RPC_PASSWORD=${BITCOIN_RPC_PASSWORD:-password}

BITCOIN_RPC_ALLOW_IP=${BITCOIN_RPC_ALLOW_IP:-::/0}

BITCOIN_PRINT_TO_CONSOLE=${BITCOIN_PRINT_TO_CONSOLE:-1}

BITCOIN_DEBUG=${BITCOIN_DEBUG:-info}

PARAMS=$(echo \
    "-datadir=$BITCOIN_DATA" \
    "-rpcuser=$BITCOIN_RPC_USER" \
    "-rpcpassword=$BITCOIN_RPC_PASSWORD" \
    "-rpcallowip=$BITCOIN_RPC_ALLOW_IP" \
    "-debug=$BITCOIN_DEBUG"
)

if [ "$BITCOIN_PRINT_TO_CONSOLE" = "1" ]; then
    PARAMS="$PARAMS -printtoconsole"
fi

CMD=$1

shift;

PARAMS="$PARAMS $@"

# Print command and start bitcoin node.


if [ "$CMD" = "bitcoin-cli" ] || [ "$CMD" = "bitcoin-tx" ] || [ "$CMD" = "bitcoind" ]; then

    mkdir -p "$BITCOIN_DATA"

    if [ ! -s "$BITCOIN_DATA/bitcoin.conf" ]; then
        cat <<-EOF > "$BITCOIN_DATA/bitcoin.conf"
datadir=${BITCOIN_DATA:-/home/bitcoin/.bitcoin}
rpcuser=${BITCOIN_RPC_USER:-bitcoin}
rpcpassword=${BITCOIN_RPC_PASSWORD:-password}
printtoconsole=${BITCOIN_PRINT_TO_CONSOLE:-1}
rpcallowip=${BITCOIN_RPC_ALLOW_IP:-::/0}                
EOF
        chown -R bitcoin:bitcoin "$BITCOIN_DATA"
    fi
    echo "Command: $CMD $PARAMS"
    exec gosu bitcoin $CMD $PARAMS
else
    echo "Command: $CMD $@"
    exec $CMD $@
fi





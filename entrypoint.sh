#!/bin/sh
set -e

for F in /root/.aliyuncli/*; do envsubst < $F > $F; done

exec "$@"

#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
#rm -f /myapp/tmp/pids/server.pid

# desativa BUNDLE_APP_CONFIG para .bundle ficar na raiz do projeto
unset BUNDLE_APP_CONFIG
bundle --path /gems

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

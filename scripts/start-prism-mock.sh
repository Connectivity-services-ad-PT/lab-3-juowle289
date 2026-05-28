#!/usr/bin/env bash
set -euo pipefail

echo "Starting Prism mock server for Access Gate on port 4012..."
npx prism mock contracts/team-gate.openapi.yaml -p 4012 --host 0.0.0.0
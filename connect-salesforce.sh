#!/usr/bin/env bash
set -euo pipefail

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  echo "Usage: ./connect-salesforce.sh [alias] [instance_url]"
  echo "Example: ./connect-salesforce.sh salesforce-org https://login.salesforce.com"
  exit 0
fi

if ! command -v sf >/dev/null 2>&1; then
  echo "Error: Salesforce CLI (sf) is not installed."
  echo "Install it from https://developer.salesforce.com/tools/salesforcecli"
  exit 1
fi

alias_name="${1:-salesforce-org}"
instance_url="${2:-https://login.salesforce.com}"

sf org login web --alias "$alias_name" --instance-url "$instance_url" --set-default

echo "Connected Salesforce org with alias '$alias_name'."

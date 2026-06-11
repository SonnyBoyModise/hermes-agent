#!/bin/sh
# Ensure the internal data directory exists on the live volume
mkdir -p /opt/data/.hermes

# Write config.yaml to the live volume if it does not exist yet
if [ ! -f /opt/data/config.yaml ]; then
cat << 'EOF' > /opt/data/config.yaml
model:
  provider: "openrouter"
  default: "google/gemini-2.0-flash-001"
  base_url: "https://openrouter.ai/api/v1"
gateway:
  type: "telegram"
EOF
fi

# Write .env to the live volume if it does not exist yet
if [ ! -f /opt/data/.env ]; then
cat << 'EOF' > /opt/data/.env
OPENROUTER_API_KEY=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
TELEGRAM_BOT_TOKEN=8697149233:AAGa_8j-Qm2T3IGPEp-6edZgBpHq8ii8MWk
TELEGRAM_ALLOWED_USERS=7285553711
EOF
fi
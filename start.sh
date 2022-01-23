#!/bin/bash

CONFIG="/opt/config.json"

# If a url has been set use it, otherwise use the default
if [[ -z "${OVERRIDE_PKT_CONFIG_URL}" ]]; then
  echo "No custom config has been passed, so it will use the default one"
  cp /opt/pktfwd/config/lora_templates_sx1302/EU-global_conf.json /opt/config.json
else
  wget -O "/opt/sx1302/config.json" \
      "${OVERRIDE_PKT_CONFIG_URL}"
fi

/opt/sx1302/lora_pkt_fwd -c $CONFIG
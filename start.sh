#!/bin/bash

CONFIG="/opt/sx1302_hal/packet_forwarder/global_conf.json.sx1250.EU868"

# If a url has been set use it, otherwise use the default
if [[ -z "${OVERRIDE_PKT_CONFIG_URL}" ]]; then
  echo "No custom config has been passed, so it will use the default one"
  cp /opt/pktfwd/config/lora_templates_sx1302/EU-global_conf.json /opt/sx1302/config.json
else
  wget -O "/opt/sx1302/config.json" \
      "${OVERRIDE_CONFIG_URL}"
fi

/opt/sx1302/lora_pkt_fwd -c $CONFIG
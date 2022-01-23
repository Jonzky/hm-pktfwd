#!/bin/bash

CONFIG="/opt/config.json"

# If a url has been set use it, otherwise use the default
if [[ -z "${OVERRIDE_PKT_CONFIG_URL}" ]]; then
  echo "No custom config has been passed, so it will use the default one"
  cp /opt/pktfwd/config/lora_templates_sx1302/EU-global_conf.json $CONFIG
else
  wget -O $CONFIG \
      "${OVERRIDE_PKT_CONFIG_URL}"
fi

cp /opt/pktfwd/config/lora_templates_sx1302/local_conf.json /opt/local_conf.json
cp /opt/pktfwd/config/lora_templates_sx1302/local_conf.json /opt/local_conf.json

/opt/sx1302/lora_pkt_fwd -c $CONFIG
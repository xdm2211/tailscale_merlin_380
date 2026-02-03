#!/bin/sh
source /koolshare/scripts/base.sh

enable="$(dbus get tailscale_enable 2>/dev/null)"

if [ "$enable" = "1" ]; then
  /koolshare/scripts/tailscale_config "$1"
else
  # UI 关闭：确保不运行、不残留规则
  /koolshare/scripts/tailscale_config stop
fi

# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - chrony.install
  - chrony.config
  - chrony.service

extend:
  chrony_config__chrony.conf:
    augeas:
      - require:
        - pkg: chrony_install__pkg
  chrony_service__service:
    service:
      - watch:
        - augeas: chrony_config__chrony.conf
      - require:
        - pkg: chrony_install__pkg


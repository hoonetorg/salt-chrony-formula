# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "chrony/map.jinja" import chrony with context %}

chrony_service__service:
  service.{{ chrony.service.state }}:
    - name: {{ chrony.service.name }}
    - enable: {{ chrony.service.enable }}

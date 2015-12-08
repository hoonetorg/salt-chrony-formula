# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "chrony/map.jinja" import chrony with context %}

{#
chrony_config__chrony.conf:
  file.managed:
    - name: {{ chrony.config }}
    - source: salt://chrony/files/chrony.conf.jinja
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - context: 
      - chrony: {{chrony|yaml}}
#}

chrony_config__chrony.conf:
  augeas.change:
    - lens: chrony.conf
    - context: /files/etc/chrony.conf
{% if "server" in chrony or "allow" in chrony %}
    - changes:
      - rm server
  {% if "server" in chrony %}
    {% for server in chrony.server %}
      - set server[] {{server}}
      - set server[.]/iburst
    {% endfor %} 
  {% endif %}
{% endif %}

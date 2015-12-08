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
    - name: {{ chrony.config }}
#    - lens: chrony.conf
    - context: /files/etc/chrony.conf
{% if "server" in chrony or "allow" in chrony %}
    - changes:
  {% if "server" in chrony %}
      - rm server
    {% if chrony.server %}
      {% for server in chrony.server %}
      - set server[{{loop.index}}] {{server}}
      - set server[{{loop.index}}] iburst
      {% endfor %} 
    {% endif %}
  {% endif %}
  {% if "allow" in chrony %}
      - rm allow
    {% if chrony.allow %}
      {% for allow in chrony.allow %}
      - set allow[{{loop.index}}] {{allow}}
      {% endfor %} 
    {% endif %}
  {% endif %}
{% else %}
    - changes: []
{% endif %}

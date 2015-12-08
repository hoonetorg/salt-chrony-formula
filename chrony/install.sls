# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "chrony/map.jinja" import chrony with context %}

chrony_install__pkg:
  pkg.installed:
    - pkgs: {{ chrony.pkgs }}

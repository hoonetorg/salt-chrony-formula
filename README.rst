===================
salt-chrony-formula
===================

A saltstack formula that can install 
and configure chrony 
(an ntp implementation - server and client part).

.. note::

    Currently this formula can configue 
    upstream servers and allowed clients only.
    More to come.

Available states
================

.. contents::
    :local:

``chrony``
------------

Installs the chrony package, 
configure chronyand 
starts the associated chronyd service.

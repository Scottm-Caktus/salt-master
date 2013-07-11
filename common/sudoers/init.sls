/etc/sudoers:
  file.managed:
    - source: salt://sudo/sudoers
    - user: root
    - mode: 644

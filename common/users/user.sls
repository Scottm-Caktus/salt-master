include:
    - users.groups

graylog2:
  user.present:
    - name: graylog2
    - remove_groups: False
    - groups:
      - admin
      - login
#      - rvm


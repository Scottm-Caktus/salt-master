elastic_project_dir:
  file.directory:
    - name: /opt/graylog2
    - user: graylog2
    - group: admin
    - dir_mode: 775
    - makedirs: True
    - recurse:
        - user
        - group
        - mode
    - require:
      - group: admin
#      - cmd: elastic_install

elastic_install:
  cmd.script:
    - cwd: /opt/graylog2
    - name: salt://elasticsearch/elastic-install.sh
    - user: graylog2

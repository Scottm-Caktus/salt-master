elastic_install:
  cmd.script:
    - cwd: /opt
    - name: salt://elastic/elastic-install.sh
    - user: graylog2

elastic_project_dir:
  file.directory:
    - name: /opt
    - user: root
    - group: admin
    - dir_mode: 775
    - recurse:
        - user
        - group
        - mode
    - require:
      - group: admin
      - cmd: elastic_install


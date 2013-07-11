Mongo:
  pkgrepo.managed:
    - name: 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen'
    - file: '/etc/apt/sources.list.d/10gen.list'
    - keyserver: 'keyserver.ubuntu.com'
    - keyid: '7F0CEB10'
#    - dist: precise
    - require_in:
      - pkg: mongodb-10gen

mongodb-10gen:
  pkg.installed:
    - refresh: True

  


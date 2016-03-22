{% from "uwsgi/map.jinja" import uwsgi %}

uwsgi_upstart_conf:
  file.managed:
    - name: '/etc/init/uwsgi.conf'
    - source: 'salt://uwsgi/files/uwsgi.conf'
    - template: jinja
    - context:
        uid: {{ uwsgi.emperor.config.uid }}
        gid: {{ uwsgi.emperor.config.gid }}
        apps_enabled: {{ uwsgi.lookup.application_available }}

uwsgi:
  service.running:
    - enable: True
    - require:
      - file: uwsgi_upstart_conf

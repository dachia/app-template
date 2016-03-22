{% set app = salt['pillar.get']('app') %}

app_config:
  file.managed:
    - name: {{ app.path.conf }}
    - user: {{ app.user }}
    - group: {{ app.group }}
    - source: salt://app/files/config.jinja
    - template: jinja
    - context:
        config: {{ app.config|json() }}
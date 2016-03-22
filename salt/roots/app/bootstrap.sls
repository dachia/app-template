{% set app = salt['pillar.get']('app') %}

{{ app.path.app }}:
  file.directory:
    - user: '{{ app.user }}'
    - group: '{{ app.group }}'
    - recurse:
      - user
      - group

{{ app.path.env}}:
  virtualenv.managed:
    - cwd: '{{ app.path.app }}'
    - requirements: '{{ app.path.req }}'
    - user: '{{ app.user }}'
    - require:
      - file: {{ app.path.app }}

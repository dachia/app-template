{% set app = salt['pillar.get']('app') %}
include:
  - tools.nodejs

{{ app.path.app }}:
  file.directory:
    - user: '{{ app.user }}'
    - group: '{{ app.group }}'
    - recurse:
      - user
      - group

'app_virtualenv_bootstrap':
  virtualenv.managed:
    - name: {{ app.path.env}}
    - cwd: '{{ app.path.app }}'
    - requirements: '{{ app.path.req }}'
    - user: '{{ app.user }}'
    - require:
      - file: {{ app.path.app }}

'app_npm_bootstrap':
  npm.bootstrap:
    - name: {{ app.path.app }}
    - user: '{{ app.user }}'
    - require:
      - file: node_symlink
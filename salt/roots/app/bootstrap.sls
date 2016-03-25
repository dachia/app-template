{% set app = salt['pillar.get']('app') %}
include:
  - tools.nodejs

'app_virtualenv_bootstrap':
  virtualenv.managed:
    - name: {{ app.path.env}}
    - cwd: '{{ app.path.app }}'
    - requirements: '{{ app.path.req }}'
    - user: '{{ app.user }}'

'app_npm_bootstrap':
  cmd.run:
    - cwd: {{ app.path.app }}
    - name: npm install
    - user: '{{ app.user }}'
    - require:
      - file: node_symlink

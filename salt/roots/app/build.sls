{% set app = salt['pillar.get']('app') %}
include:
  - app.bootstrap

'app_gulp_build':
  cmd.run:
    - cwd: {{ app.path.app }}
    - name: gulp build
    - user: '{{ app.user }}'
    - require:
      - cmd: 'app_npm_bootstrap'

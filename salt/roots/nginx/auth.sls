{% set auth = salt['pillar.get']('auth') %}

apache2-utils:
  pkg.installed

{{ auth.user }}:
  webutil.user_exists:
    - password: {{ auth.password }}
    - htpasswd_file: {{ auth.htpasswd_file }}
    - force: true
    - require:
      - pkg: apache2-utils

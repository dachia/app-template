base:
  '*':
    - ntp.ng
    - timezone
    - users
    - users.profile

    - uwsgi.pip
    - uwsgi.application_config
    - uwsgi.upstart

    - nginx.ng

    - virtualenv

    - app

  '*.dev':
    - tools.fab

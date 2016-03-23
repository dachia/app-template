base:
  '*':
    - ntp.ng
    - timezone
    - users
    - users.profile

    - uwsgi.pip
    - uwsgi.application_config

    - virtualenv

    - app

    - uwsgi.upstart
    - nginx.ng

  '*.dev':
    - tools.fab
    - tools.nodejs
    - tools.gulp

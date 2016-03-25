base:
  '*':
    - ntp.ng
    - timezone
    - users
    - users.profile

    - uwsgi.pip
    - uwsgi.application_config

    - virtualenv

    - uwsgi.upstart
    - nginx.ng

  '*.prod':
    - app.config

  '*.dev':
    - app
    - tools.fab
    - tools.nodejs
    - tools.gulp

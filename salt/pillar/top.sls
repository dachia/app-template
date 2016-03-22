base:
  '*':
    - timezone
    - ntp
    - nginx
    - uwsgi

  '*.dev':
    - dev.app
    - dev.users

  '*.prod':
    - prod.app
    - prod.users

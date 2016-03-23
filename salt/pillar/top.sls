base:
  '*':
    - timezone
    - ntp
    - nginx
    - uwsgi
    - nodejs

  '*.dev':
    - dev.app
    - dev.users

  '*.prod':
    - prod.app
    - prod.users

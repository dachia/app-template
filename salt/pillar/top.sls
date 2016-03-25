base:
  '*':
    - timezone
    - ntp
    - uwsgi
    - nodejs

  '*.dev':
    - dev.users
    - dev.app
    - dev.nginx

  '*.prod':
    - prod.app
    - prod.users
    - prod.nginx
    - prod.auth

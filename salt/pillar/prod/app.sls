app:
  path:
    app: '/var/www/app'
    env: '/var/www/app/env'
    req: '/var/www/app/requirements.txt'
    conf: '/var/www/app/config/local.py'

  user: ubuntu
  group: www-data

  config:
    debug: true

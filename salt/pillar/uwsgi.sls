uwsgi:
  applications:
    managed:
      app.ini:
        enabled: True

        config:
          project: 'app'
          base: '/var/www'

          master: true
          uid: 'www-data'
          gid: 'www-data'
          home: '%(base)/%(project)/env' # virtual env home
          chdir: '%(base)/%(project)/'
          callable: 'app'
          wsgi-file: '%(base)/%(project)/wsgi.py'
          env: 'APP_SETTINGS=/var/www/app/config/local.py'

          py-autoreload: 3

          socket: '/tmp/%(project).sock'
          chmod-socket: 664
          vacuum: true

  emperor:
    opts: {}
    config:
      uid: 'www-data'
      gid: 'www-data'

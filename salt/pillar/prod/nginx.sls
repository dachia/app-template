nginx:
  ng:
    install_from_ppa: True
    ppa_version: stable
    from_source: False

    service:
      enable: True

    server:
      opts: {} # this partially exposes file.managed parameters as they relate to the main nginx.conf file

      # nginx.conf (main server) declarations
      # dictionaries map to blocks {} and lists cause the same declaration to repeat with different values
      config:
        worker_processes: auto

        http:
          gzip: 'on'

          gzip_types:
            - text/css
            - text/javascript
            - text/xml
            - text/plain
            - text/x-component
            - application/javascript
            - application/json
            - application/xml
            - application/rss+xml
            - application/octet-stream
            - font/truetype
            - font/opentype
            - application/vnd.ms-fontobject
            - image/svg+xml

          include:
            - /etc/nginx/mime.types
            - /etc/nginx/conf.d/*.conf
            - /etc/nginx/sites-enabled/*

    vhosts:
      managed:
        default:
          enabled: False
          config:


        com.dachia.app:
          enabled: True
          config:
            - server:
              - listen:
                - 80

              - root: /var/www/com.teadriven.booking/dist
              - index: index.html

              - auth_basic: '"For private eyes only"'
              - auth_basic_user_file: htpasswd

              - location /api:
                - include: uwsgi_params
                - uwsgi_pass: 'unix:///tmp/com.teadriven.booking.sock'

              - location /dist:
                  - alias: /var/www/com.teadriven.booking/dist/
                  - gzip_static: 'on'
                  - expires: 1y
                  - add_header: Cache-Control public
                  - add_header: ETag ""

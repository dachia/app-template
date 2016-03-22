ntp:
  ng:
    settings:
      ntpd: True

      ntp_conf:
        server: ['0.us.pool.ntp.org', '1.us.pool.ntp.org']
        restrict: ['127.0.0.1', '::1']
        driftfile: ['/var/lib/ntp/ntp.drift']
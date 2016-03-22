users:
  vagrant:
    sudouser: True
    empty_password: True
    groups:
      - vagrant
      - www-data
    sudo_rules:
      - ALL=(ALL) NOPASSWD:ALL
    manage_profile: True
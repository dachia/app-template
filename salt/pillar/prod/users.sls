users:
  ubuntu:
    sudouser: True
    empty_password: True
    groups:
      - ubuntu
      - www-data
    sudo_rules:
      - ALL=(ALL) NOPASSWD:ALL
    manage_profile: True
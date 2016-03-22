python-pip:
  pkg.installed

'fabric_installed':
  pip.installed:
    - name: fabric
    - require:
      - pkg: python-pip

include:
  - node

'node_purge_old':
  pkg.purged:
    - name: node


'node_symlink':
  file.symlink:
    - name: '/usr/bin/node'
    - target: '/usr/bin/nodejs'
    - require:
      - pkg: nodejs
#!/usr/bin/python
#  -*- coding: UTF-8 -*-
"""Fabric deploy commands.
"""
from fabric.api import env
from fabric.operations import sudo, put
from fabric.contrib.project import rsync_project, upload_project
from fabric.contrib.files import exists

env.user = "root"
env.colorize_errors = True
# env.sudo_prefix = "sudo -S"
env.key_filename = ["key.pem"]
# env.abort_on_prompts = True

REMOTE_PROJECT_PATH = "/var/www"
LOCAL_PROJECT_PATH = "/var/www/com.teadriven.booking"

REMOTE_USER = "ubuntu"
REMOTE_GROUP = "www-data"

REMOTE_SALT_PATH_ROOTS = "/srv/"
REMOTE_SALT_PATH_PILLAR = "/srv/"

LOCAL_SALT_PATH_ROOTS = "/srv/salt/"
LOCAL_SALT_PATH_PILLAR = "/srv/pillar/"

SALT_VER = "v2015.8.0"

LOCAL_MINION_CONFIG_PATH = "/vagrant/salt/minion.prod"
REMOTE_MINION_CONFIG_PATH = "/etc/salt/minion"


def deploy():
    """Copy app and salt states/pillars to host and run provision."""
    copy_project()
    copy_salt_roots_and_pillars()
    salt_highstate()
    set_app_owner()
    restart_servers()

def install_salt_and_dependencies():
    """Install salt and requirements."""
    install_gitfs()
    install_salt()


def copy_project():
    """Copy using rsync app source to remote host."""
    if not exists(REMOTE_PROJECT_PATH):
        sudo("mkdir -p %s" % REMOTE_PROJECT_PATH)
        sudo("chown %s:%s %s" % (REMOTE_USER,
                                 REMOTE_GROUP,
                                 REMOTE_PROJECT_PATH))

    rsync_project(local_dir=LOCAL_PROJECT_PATH,
                  remote_dir=REMOTE_PROJECT_PATH,
                  exclude=["*.pyc", ".sass-cache/", "env/", "node_modules/",
                           "vendor/", "config/local.py", "key.pem"])

def restart_servers():
    """Restart app servers nginx and uwsgi"""
    sudo("service uwsgi restart")
    sudo("service nginx restart")


def set_app_owner():
    """Set app owner"""
    sudo("chown -R %s:%s %s" % (REMOTE_USER,
                                REMOTE_GROUP,
                                REMOTE_PROJECT_PATH))

def salt_highstate():
    """Provision app, requires salt installed."""
    sudo("salt-call state.highstate")


def install_gitfs():
    """Install gitfs."""
    sudo("apt-get update")
    sudo("apt-get install -y python-git")


def copy_salt_roots_and_pillars():
    """Copy salt files to remote host."""
    if not exists(LOCAL_SALT_PATH_ROOTS):
        sudo("mkdir -p %s" % LOCAL_SALT_PATH_ROOTS)

    if not exists(LOCAL_SALT_PATH_PILLAR):
        sudo("mkdir -p %s" % LOCAL_SALT_PATH_PILLAR)

    upload_project(local_dir=LOCAL_SALT_PATH_ROOTS,
                   remote_dir=REMOTE_SALT_PATH_ROOTS,
                   use_sudo=True)

    upload_project(local_dir=LOCAL_SALT_PATH_PILLAR,
                   remote_dir=REMOTE_SALT_PATH_PILLAR,
                   use_sudo=True)

    put(LOCAL_MINION_CONFIG_PATH, REMOTE_MINION_CONFIG_PATH, use_sudo=True)
    sudo("service salt-minion restart")


def install_salt():
    """Download and install salt."""
    sudo("curl -L https://bootstrap.saltstack.com -o install_salt.sh")
    sudo("sh install_salt.sh -P git %s" % SALT_VER)

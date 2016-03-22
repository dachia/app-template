#!/usr/bin/python
#  -*- coding: UTF-8 -*-
"""Example views
"""
from flask import Blueprint, request

views = Blueprint(name="views",
                  import_name=__name__,
                  template_folder="templates")


@views.route("/")
@views.route("/index")
def index():
    """Homepage.

    """
    return "Blank project"
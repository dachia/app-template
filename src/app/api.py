#!/usr/bin/python
#  -*- coding: UTF-8 -*-
"""Example views
"""
from flask import Blueprint, request
from flask_restful import Api, Resource, url_for

api_bp = Blueprint(name="api",
                   import_name=__name__,
                   url_prefix='/api')
api = Api(api_bp)


class Token(Resource):
    def post(self):
        """Create """
    def get(self):
        """Get"""
        return {'result': 'get'}


api.add_resource(Token, '/token')

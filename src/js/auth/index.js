'use strict';

var authModule = require('angular').module('authModule', []);

authModule.controller('LoginCtrl', require('./controller/loginCtrl'));

authModule.factory('authSrv', require('./service/authSrv'));
'use strict';

var angular = require("angular");
var app = angular.module('bookingApp', ['ngRoute', 'authModule', 'partialsModule']);

app.config(function ($routeProvider) {
  var route = {
    controller: 'LoginCtrl',
    controllerAs: 'loginCtrl',
    templateUrl: '/partials/auth/login.html'
  };
  $routeProvider.when('/', route).otherwise({redirectTo: '/'});
});

require('angular-route');
require('../dist/templateCachePartials');
require('./auth');
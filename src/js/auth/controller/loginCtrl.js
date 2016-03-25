'use strict';

module.exports = ['authSrv', function(authSrv) {
  var self = this;
  self.email = "";
  self.password = "";

  self.authenticate = function (email, password) {
    console.log(authSrv.authenticate(email, password));
  }
}];
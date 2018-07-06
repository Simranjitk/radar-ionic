var exec = require('cordova/exec');

var PLUGIN_NAME = 'RadarPlugin';

var RadarPlugin = {
  setUserId: function(userId, cb){
    exec(cb, null, PLUGIN_NAME, 'setUserId', [userId]);
  },

  getPermission: function(cb){
    exec(cb, null, PLUGIN_NAME, 'getPermission', []);
  },

  startTracking: function(cb){
    exec(cb, null, PLUGIN_NAME, 'startTracking', []);
  },

  stopTracking: function(cb){
    exec(cb, null, PLUGIN_NAME, 'stopTracking', []);
  },

  checkPermissions: function(cb){
    exec(cb, null, PLUGIN_NAME, 'checkPermissions', []);
  }


};

module.exports = RadarPlugin;

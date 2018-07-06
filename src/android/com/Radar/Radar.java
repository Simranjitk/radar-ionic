package com.Radar;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;
import android.content.Context;

import com.onradar.sdk.Radar;

import android.util.Log;

import java.util.Date;

public class MyCordovaPlugin extends CordovaPlugin {
  private static final String TAG = "RadarPlugin";
    
  public void initialize(CordovaInterface cordova, CordovaWebView webView) {
    super.initialize(cordova, webView);
    Context context = this.cordova.getActivity().getApplicationContext();
    Radar.initialize(context, "your_radar_key");
    Log.d(TAG, "Initializing Radar Plugin");
  }

    public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
    if(action.equals("setUserId")){
      String userId = args.getString(0);
      Radar.setUserId(userId);
      final PluginResult result = new PluginResult(PluginResult.Status.OK, userId);
      callbackContext.sendPluginResult(result);
    }
    if(action.equals("startTracking")){
      Radar.startTracking();
      callbackContext.success(); 
    }
    if(action.equals("stopTracking")){
      Radar.stopTracking();
      callbackContext.success(); 
    }
    if(action.equals("checkPermissions")){
      Radar.requestPermissions(this.cordova.getActivity());
      callbackContext.success();
    }
    return true;
  }

}

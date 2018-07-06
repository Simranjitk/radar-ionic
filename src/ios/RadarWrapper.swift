import RadarSDK

@objc(RadarWrapper) class RadarWrapper : CDVPlugin {
    override func pluginInitialize() {
      Radar.initialize(publishableKey: "your_radar_key");
    }

    @objc(setUserId:)
    func setUserId(command: CDVInvokedUrlCommand) {
        let userId = command.arguments[0] as? String ?? ""
        var pluginResult : CDVPluginResult? = nil

        if userId.characters.count > 0 {
            Radar.setUserId(userId)
            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        }
        else{
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
        }

        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
    }

    @objc(checkPermissions:)
    func checkPermissions(command: CDVInvokedUrlCommand){
      Radar.requestAlwaysAuthorization()
      let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
      self.commandDelegate!.send(
          pluginResult,
          callbackId: command.callbackId
      )
    }

    @objc(startTracking:)
    func startTracking(command: CDVInvokedUrlCommand) {
      Radar.startTracking()
      let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
      self.commandDelegate!.send(
          pluginResult,
          callbackId: command.callbackId
      )
    }

    @objc(trackOnce:)
    func trackOnce(command: CDVInvokedUrlCommand) {
      Radar.trackOnce()
      let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
      self.commandDelegate!.send(
          pluginResult,
          callbackId: command.callbackId
      )
    }

    @objc(stopTracking:)
    func stopTracking(command: CDVInvokedUrlCommand){
        Radar.stopTracking()
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK)
        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
    }
}


import Foundation

public struct SiteDeviceCount {
    public let criticalNotification: Int32?
    public let gatewayDevice: Int32?
    public let guestClient: Int32?
    public let lanConfiguration: Int32?
    public let offlineDevice: Int32?
    public let offlineGatewayDevice: Int32?
    public let offlineWifiDevice: Int32?
    public let offlineWiredDevice: Int32?
    public let pendingUpdateDevice: Int32?
    public let totalDevice: Int32?
    public let wanConfiguration: Int32?
    public let wifiClient: Int32?
    public let wifiConfiguration: Int32?
    public let wifiDevice: Int32?
    public let wiredClient: Int32?
    public let wiredDevice: Int32?
    
    init(
        criticalNotification: Int32?,
        gatewayDevice: Int32?,
        guestClient: Int32?,
        lanConfiguration: Int32?,
        offlineDevice: Int32?,
        offlineGatewayDevice: Int32?,
        offlineWifiDevice: Int32?,
        offlineWiredDevice: Int32?,
        pendingUpdateDevice: Int32?,
        totalDevice: Int32?,
        wanConfiguration: Int32?,
        wifiClient: Int32?,
        wifiConfiguration: Int32?,
        wifiDevice: Int32?,
        wiredClient: Int32?,
        wiredDevice: Int32?
    ) {
        self.criticalNotification = criticalNotification
        self.gatewayDevice = gatewayDevice
        self.guestClient = guestClient
        self.lanConfiguration = lanConfiguration
        self.offlineDevice = offlineDevice
        self.offlineGatewayDevice = offlineGatewayDevice
        self.offlineWifiDevice = offlineWifiDevice
        self.offlineWiredDevice = offlineWiredDevice
        self.pendingUpdateDevice = pendingUpdateDevice
        self.totalDevice = totalDevice
        self.wanConfiguration = wanConfiguration
        self.wifiClient = wifiClient
        self.wifiConfiguration = wifiConfiguration
        self.wifiDevice = wifiDevice
        self.wiredClient = wiredClient
        self.wiredDevice = wiredDevice
    }
    
    internal init(response: Components.Schemas.SiteDeviceCounts?) {
        self.criticalNotification = response?.criticalNotification
        self.gatewayDevice = response?.gatewayDevice
        self.guestClient = response?.guestClient
        self.lanConfiguration = response?.lanConfiguration
        self.offlineDevice = response?.offlineDevice
        self.offlineGatewayDevice = response?.offlineGatewayDevice
        self.offlineWifiDevice = response?.offlineWifiDevice
        self.offlineWiredDevice = response?.offlineWiredDevice
        self.pendingUpdateDevice = response?.pendingUpdateDevice
        self.totalDevice = response?.totalDevice
        self.wanConfiguration = response?.wanConfiguration
        self.wifiClient = response?.wifiClient
        self.wifiConfiguration = response?.wifiConfiguration
        self.wifiDevice = response?.wifiDevice
        self.wiredClient = response?.wiredClient
        self.wiredDevice = response?.wiredDevice
    }
}

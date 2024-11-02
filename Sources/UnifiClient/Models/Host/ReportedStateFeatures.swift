import Foundation

// MARK: - ReportedStateFeatures
public struct ReportedStateFeatures {
    public let cloud: Cloud?
    public let cloudBackup: Bool?
    public let deviceList: DeviceList?
    public let directRemoteConnection: Bool?
    public let hasGateway: Bool?
    public let hasLCM: Bool?
    public let hasLED: Bool?
    public let infoApis: InfoApis?
    public let isAutomaticFailoverAvailable: Bool?
    public let mfa: Bool?
    public let notifications: Bool?
    public let sharedTokens: Bool?
    public let supportForm: Bool?
    public let teleport: Bool?
    public let teleportState: String?
    public let uidService: Bool?

    public init(cloud: Cloud, cloudBackup: Bool, deviceList: DeviceList, directRemoteConnection: Bool, hasGateway: Bool, hasLCM: Bool, hasLED: Bool, infoApis: InfoApis, isAutomaticFailoverAvailable: Bool, mfa: Bool, notifications: Bool, sharedTokens: Bool, supportForm: Bool, teleport: Bool, teleportState: String, uidService: Bool) {
        self.cloud = cloud
        self.cloudBackup = cloudBackup
        self.deviceList = deviceList
        self.directRemoteConnection = directRemoteConnection
        self.hasGateway = hasGateway
        self.hasLCM = hasLCM
        self.hasLED = hasLED
        self.infoApis = infoApis
        self.isAutomaticFailoverAvailable = isAutomaticFailoverAvailable
        self.mfa = mfa
        self.notifications = notifications
        self.sharedTokens = sharedTokens
        self.supportForm = supportForm
        self.teleport = teleport
        self.teleportState = teleportState
        self.uidService = uidService
    }
    
    internal init(response: Components.Schemas.ReportedStateFeatures?) {
        self.cloud = Cloud(response: response?.cloud)
        self.cloudBackup = response?.cloudBackup
        self.deviceList = DeviceList(response: response?.deviceList)
        self.directRemoteConnection = response?.directRemoteConnection
        self.hasGateway = response?.hasGateway
        self.hasLCM = response?.hasLCM
        self.hasLED = response?.hasLED
        self.infoApis = InfoApis(response: response?.infoApis)
        self.isAutomaticFailoverAvailable = response?.isAutomaticFailoverAvailable
        self.mfa = response?.mfa
        self.notifications = response?.notifications
        self.sharedTokens = response?.sharedTokens
        self.supportForm = response?.supportForm
        self.teleport = response?.teleport
        self.teleportState = response?.teleportState
        self.uidService = response?.uidService
    }
}

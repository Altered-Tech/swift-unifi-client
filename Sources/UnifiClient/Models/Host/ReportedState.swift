import Foundation

// MARK: - ReportedState
public struct ReportedState {
    public let anonid: String?
    public let apps: [App]?
    public let availableChannels: [String]?
    public let consolesOnSameLocalNetwork: [Any?]?
    public let controllerUUID: String?
    public let controllers: [Controller]?
    public let country: Int32?
    public let deviceErrorCode: String?
    public let deviceState: String?
    public let deviceStateLastChanged: Int32?
    public let directConnectDomain: String?
    public let features: ReportedStateFeatures?
    public let firmwareUpdate: FirmwareUpdate?
    public let hardware: Hardware?
    public let hostType: Int32?
    public let hostname: String?
    public let internetIssues5Min: InternetIssues5Min?
    public let ip: String?
    public let ipAddrs: [String]?
    public let isStacked: Bool?
    public let location: Location?
    public let mac: String?
    public let mgmtPort: Int32?
    public let name: String?
    public let releaseChannel: String?
    public let state: String?
    public let timezone: String?
    public let uidb: Uidb?
    public let unadoptedUnifiOSDevices: [Any?]?
    public let version: String?

    public init(anonid: String, apps: [App], availableChannels: [String], consolesOnSameLocalNetwork: [Any?], controllerUUID: String, controllers: [Controller], country: Int32, deviceErrorCode: String, deviceState: String, deviceStateLastChanged: Int32, directConnectDomain: String, features: ReportedStateFeatures, firmwareUpdate: FirmwareUpdate, hardware: Hardware, hostType: Int32, hostname: String, internetIssues5Min: InternetIssues5Min, ip: String, ipAddrs: [String], isStacked: Bool, location: Location, mac: String, mgmtPort: Int32, name: String, releaseChannel: String, state: String, timezone: String, uidb: Uidb, unadoptedUnifiOSDevices: [Any?], version: String) {
        self.anonid = anonid
        self.apps = apps
        self.availableChannels = availableChannels
        self.consolesOnSameLocalNetwork = consolesOnSameLocalNetwork
        self.controllerUUID = controllerUUID
        self.controllers = controllers
        self.country = country
        self.deviceErrorCode = deviceErrorCode
        self.deviceState = deviceState
        self.deviceStateLastChanged = deviceStateLastChanged
        self.directConnectDomain = directConnectDomain
        self.features = features
        self.firmwareUpdate = firmwareUpdate
        self.hardware = hardware
        self.hostType = hostType
        self.hostname = hostname
        self.internetIssues5Min = internetIssues5Min
        self.ip = ip
        self.ipAddrs = ipAddrs
        self.isStacked = isStacked
        self.location = location
        self.mac = mac
        self.mgmtPort = mgmtPort
        self.name = name
        self.releaseChannel = releaseChannel
        self.state = state
        self.timezone = timezone
        self.uidb = uidb
        self.unadoptedUnifiOSDevices = unadoptedUnifiOSDevices
        self.version = version
    }
    
    internal init(response: Components.Schemas.ReportedState?) {
        self.anonid = response?.anonid
        self.apps = response?.apps?.map{ App(responses: $0) }
        self.availableChannels = response?.availableChannels
        self.consolesOnSameLocalNetwork = response?.consolesOnSameLocalNetwork
        self.controllerUUID = response?.controller_uuid
        self.controllers = response?.controllers?.map{ Controller(response: $0) }
        self.country = response?.country
        self.deviceErrorCode = response?.deviceErrorCode
        self.deviceState = response?.deviceState
        self.directConnectDomain = response?.directConnectDomain
        self.features = ReportedStateFeatures(response: response?.features)
        self.firmwareUpdate = FirmwareUpdate(response: response?.firmwareUpdate)
        self.hardware = Hardware(response: response?.hardware)
        self.hostType = response?.host_type
        self.hostname = response?.hostname
        self.internetIssues5Min = InternetIssues5Min(response: response?.internetIssues5min)
        self.ip = response?.ip
        self.ipAddrs = response?.ipAddrs
        self.isStacked = response?.isStacked
        self.location = Location(response: response?.location)
        self.mac = response?.mac
        self.releaseChannel = response?.releaseChannel
        self.state = response?.state
        self.timezone = response?.timezone
        self.uidb = Uidb(response: response?.uidb)
        self.unadoptedUnifiOSDevices = response?.unadoptedUnifiOSDevices
        self.version = response?.version
        self.name = response?.name
        self.deviceStateLastChanged = response?.deviceStateLastChanged
        self.mgmtPort = response?.mgmt_port
    }
}

import Foundation

// MARK: - SiteDevice
public struct SiteDevices {
    public let devices: [Devices]?
    public let hostID: String?
    public let hostName: String?
    public let updatedAt: String?

    public init(devices: [Devices], hostID: String, hostName: String, updatedAt: String) {
        self.devices = devices
        self.hostID = hostID
        self.hostName = hostName
        self.updatedAt = updatedAt
    }
    
    internal init(response: Components.Schemas.SiteDevices?) {
        self.hostID = response?.hostId
        self.hostName = response?.hostName
        self.updatedAt = response?.updatedAt
        self.devices = response?.devices?.map{ Devices(response: $0) }
    }
}

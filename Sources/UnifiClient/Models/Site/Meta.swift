import Foundation

// MARK: - Meta
public struct Meta {
    public let desc: String?
    public let gatewayMAC: String?
    public let name: String?
    public let timezone: String?

    public init(desc: String, gatewayMAC: String, name: String, timezone: String) {
        self.desc = desc
        self.gatewayMAC = gatewayMAC
        self.name = name
        self.timezone = timezone
    }
    
    internal init(response: Components.Schemas.SiteDeviceInfo?) {
        self.desc = response?.desc
        self.gatewayMAC = response?.gatewayMac
        self.name = response?.name
        self.timezone = response?.timezone
    }
}

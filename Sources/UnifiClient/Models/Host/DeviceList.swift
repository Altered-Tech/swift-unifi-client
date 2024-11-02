import Foundation

// MARK: - DeviceList
public struct DeviceList {
    public let autolinkDevices: Bool?
    public let partialUpdates: Bool?
    public let ucp4Events: Bool?

    public init(autolinkDevices: Bool, partialUpdates: Bool, ucp4Events: Bool) {
        self.autolinkDevices = autolinkDevices
        self.partialUpdates = partialUpdates
        self.ucp4Events = ucp4Events
    }
    
    internal init(response: Components.Schemas.ReportedStateFeatures.deviceListPayload?) {
        self.autolinkDevices = response?.autolinkDevices
        self.partialUpdates = response?.partialUpdates
        self.ucp4Events = response?.ucp4Events
    }
}

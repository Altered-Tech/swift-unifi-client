import Foundation

// MARK: - FirmwareUpdate
public struct FirmwareUpdate {
    public let latestAvailableVersion: String?

    public init(latestAvailableVersion: String) {
        self.latestAvailableVersion = latestAvailableVersion
    }
    
    internal init(response: Components.Schemas.ReportedState.firmwareUpdatePayload?) {
        self.latestAvailableVersion = response?.latestAvailableVersion
    }
}

import Foundation

// MARK: - InfoApis
public struct InfoApis {
    public let firmwareUpdate: Bool?

    public init(firmwareUpdate: Bool) {
        self.firmwareUpdate = firmwareUpdate
    }
    
    internal init(response: Components.Schemas.ReportedStateFeatures.infoApisPayload?) {
        self.firmwareUpdate = response?.firmwareUpdate
    }
}

import Foundation

// MARK: - Images
public struct Images {
    public let imagesDefault: String?
    public let nopadding: String?
    public let topology: String?

    public init(imagesDefault: String, nopadding: String, topology: String) {
        self.imagesDefault = imagesDefault
        self.nopadding = nopadding
        self.topology = topology
    }
    
    internal init(response: Components.Schemas.ReportedState.uidbPayload.imagesPayload?) {
        self.imagesDefault = response?._default
        self.nopadding = response?.nopadding
        self.topology = response?.topology
    }
    
    internal init(response: Components.Schemas.Device.uidbPayload.imagesPayload?) {
        self.imagesDefault = response?._default
        self.nopadding = response?.nopadding
        self.topology = response?.topology
    }
}

import Foundation

// MARK: - Uidb
public struct Uidb {
    public let guid: String?
    public let id: String?
    public let images: Images?

    public init(guid: String, id: String, images: Images) {
        self.guid = guid
        self.id = id
        self.images = images
    }
    
    internal init(response: Components.Schemas.ReportedState.uidbPayload?) {
        self.guid = response?.guid
        self.id = response?.id
        self.images = Images(response: response?.images)
    }
}

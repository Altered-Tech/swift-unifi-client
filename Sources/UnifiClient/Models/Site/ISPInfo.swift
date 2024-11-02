import Foundation

// MARK: - ISPInfo
public struct ISPInfo {
    public let name: String?
    public let organization: String?

    public init(name: String, organization: String) {
        self.name = name
        self.organization = organization
    }
    
    internal init(response: Components.Schemas.Site.statisticsPayload.ispInfoPayload?) {
        self.name = response?.name
        self.organization = response?.organization
    }
}

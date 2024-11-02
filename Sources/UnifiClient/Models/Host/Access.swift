import Foundation

// MARK: - Access
public struct ApplicationInfo {
    public let owned: Bool?
    public let isRequired: Bool?
    public let supported: Bool?

    public init(owned: Bool, isRequired: Bool, supported: Bool) {
        self.owned = owned
        self.isRequired = isRequired
        self.supported = supported
    }
    
    internal init(response: Components.Schemas.ApplicationInfo?) {
        self.owned = response?.owned
        self.isRequired = response?.required
        self.supported = response?.supported
    }
}

import Foundation

// MARK: - ControllerFeatures
public struct ControllerFeatures {
    public let stackable: Bool?

    public init(stackable: Bool) {
        self.stackable = stackable
    }
    
    internal init(response: Components.Schemas.Controller.featuresPayload?) {
        self.stackable = response?.stackable
    }
}

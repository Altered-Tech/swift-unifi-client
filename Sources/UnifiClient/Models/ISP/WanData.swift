import Foundation

// MARK: - WanData
public struct WanData {
    public let wan: WAN

    public init(wan: WAN) {
        self.wan = wan
    }
    
    internal init(response: Components.Schemas.Period.dataPayload?) {
        self.wan = WAN(response: response?.wan)
    }
}

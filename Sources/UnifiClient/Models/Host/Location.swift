import Foundation

// MARK: - Location
public struct Location {
    public let lat: Double?
    public let long: Double?
    public let radius: Int32?
    public let text: String?

    public init(lat: Double, long: Double, radius: Int32, text: String) {
        self.lat = lat
        self.long = long
        self.radius = radius
        self.text = text
    }
    
    internal init(response: Components.Schemas.ReportedState.locationPayload?) {
        self.lat = response?.lat
        self.long = response?.long
        self.radius = response?.radius
        self.text = response?.text
    }
}

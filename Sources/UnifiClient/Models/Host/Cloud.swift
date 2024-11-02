import Foundation

// MARK: - Cloud
public struct Cloud {
    public let applicationEvents: Bool?
    public let applicationEventsHTTP: Bool?

    public init(applicationEvents: Bool, applicationEventsHTTP: Bool) {
        self.applicationEvents = applicationEvents
        self.applicationEventsHTTP = applicationEventsHTTP
    }
    
    internal init(response: Components.Schemas.ReportedStateFeatures.cloudPayload?) {
        self.applicationEvents = response?.applicationEvents
        self.applicationEventsHTTP = response?.applicationEventsHttp
    }
}


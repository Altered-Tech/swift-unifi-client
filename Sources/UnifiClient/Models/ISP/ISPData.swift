import Foundation

// MARK: - ISPData
public struct ISPData {
    public let metricType: String?
    public let periods: [Period]?
    public let hostID: String?
    public let siteID: String?

    public init(metricType: String, periods: [Period], hostID: String, siteID: String) {
        self.metricType = metricType
        self.periods = periods
        self.hostID = hostID
        self.siteID = siteID
    }
    
    internal init(response: Components.Schemas.ISPData?) {
        self.siteID = response?.siteId
        self.hostID = response?.hostId
        self.metricType = response?.metricType
        self.periods = response?.periods?.map{ Period(response: $0) }
    }
}

import Foundation

// MARK: - Period
public struct Period {
    public let data: WanData?
    public let metricTime: String?
    public let version: String?

    public init(data: WanData, metricTime: String, version: String) {
        self.data = data
        self.metricTime = metricTime
        self.version = version
    }
    
    internal init(response: Components.Schemas.Period?) {
        self.version = response?.version
        self.metricTime = response?.metricTime
        self.data = WanData(response: response?.data)
    }
}

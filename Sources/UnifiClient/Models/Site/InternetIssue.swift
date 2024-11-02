import Foundation

// MARK: - InternetIssue
public struct InternetIssue {
    public let highLatency: Bool?
    public let index: Int32?
    public let latencyAvgMS: Int32?
    public let latencyMaxMS: Int32?

    public init(highLatency: Bool?, index: Int32?, latencyAvgMS: Int32?, latencyMaxMS: Int32?) {
        self.highLatency = highLatency
        self.index = index
        self.latencyAvgMS = latencyAvgMS
        self.latencyMaxMS = latencyMaxMS
    }
    
    internal init(response: Components.Schemas.InternetIssues?) {
        self.highLatency = response?.highLatency
        self.index = response?.index
        self.latencyAvgMS = response?.latencyAvgMs
        self.latencyMaxMS = response?.latencyMaxMs
    }
}

import Foundation

// MARK: - Percentages
public struct Percentages {
    public let txRetry: Double?
    public let wanUptime: Double?

    public init(txRetry: Double, wanUptime: Double) {
        self.txRetry = txRetry
        self.wanUptime = wanUptime
    }
    
    internal init(response: Components.Schemas.Site.statisticsPayload.percentagesPayload?) {
        self.txRetry = response?.txRetry
        self.wanUptime = response?.wanUptime
    }
}

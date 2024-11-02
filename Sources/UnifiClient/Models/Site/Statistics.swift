import Foundation

// MARK: - Statistics
public struct Statistics {
    public let counts: SiteDeviceCount?
    public let internetIssues: [InternetIssue]?
    public let ispInfo: ISPInfo?
    public let percentages: Percentages?

    public init(counts: SiteDeviceCount, internetIssues: [InternetIssue], ispInfo: ISPInfo, percentages: Percentages) {
        self.counts = counts
        self.internetIssues = internetIssues
        self.ispInfo = ispInfo
        self.percentages = percentages
    }
    
    internal init(response: Components.Schemas.Site.statisticsPayload?) {
        self.counts = SiteDeviceCount(response: response?.counts)
        self.internetIssues = response?.internetIssues?.map { InternetIssue(response: $0) }
        self.ispInfo = ISPInfo(response: response?.ispInfo)
        self.percentages = Percentages(response: response?.percentages)
    }
}

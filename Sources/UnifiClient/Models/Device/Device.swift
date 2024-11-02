import Foundation

// MARK: - Device
public struct AllSiteDevices {
    public let siteDevices: [SiteDevices]?
    public let httpStatusCode: Int32?
    public let traceID: String?

    public init(siteDevices: [SiteDevices], httpStatusCode: Int32, traceID: String) {
        self.siteDevices = siteDevices
        self.httpStatusCode = httpStatusCode
        self.traceID = traceID
    }
    
    internal init(response: Components.Schemas.AllSiteDevices?) {
        self.httpStatusCode = response?.httpStatusCode
        self.traceID = response?.traceId
        self.siteDevices = response?.data?.map { SiteDevices(response: $0) }
    }
}

import Foundation

// MARK: - Sites
public struct Sites {
    public let sites: [Site]?
    public let httpStatusCode: Int32?
    public let traceID: String?

    public init(sites: [Site], httpStatusCode: Int32, traceID: String) {
        self.sites = sites
        self.httpStatusCode = httpStatusCode
        self.traceID = traceID
    }
    
    internal init(response: Components.Schemas.Sites?) {
        self.httpStatusCode = response?.httpStatusCode
        self.traceID = response?.traceId
        self.sites = response?.data?.map { Site(response: $0) }
    }
}

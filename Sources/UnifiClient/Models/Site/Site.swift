import Foundation

// MARK: - Site
public struct Site {
    public let hostID: String?
    public let isOwner: Bool?
    public let meta: Meta?
    public let permission: String?
    public let siteID: String?
    public let statistics: Statistics?
    public let subscriptionEndTime: String?

    public init(hostID: String, isOwner: Bool, meta: Meta, permission: String, siteID: String, statistics: Statistics, subscriptionEndTime: String) {
        self.hostID = hostID
        self.isOwner = isOwner
        self.meta = meta
        self.permission = permission
        self.siteID = siteID
        self.statistics = statistics
        self.subscriptionEndTime = subscriptionEndTime
    }
    
    internal init(response: Components.Schemas.Site?) {
        self.hostID = response?.hostId
        self.isOwner = response?.isOwner
        self.meta = Meta(response: response?.meta)
        self.permission = response?.permission
        self.siteID = response?.siteId
        self.statistics = Statistics(response: response?.statistics)
        self.subscriptionEndTime = response?.subscriptionEndTime
    }
}

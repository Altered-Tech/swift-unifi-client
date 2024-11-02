import Foundation

// MARK: - Applications
public struct Applications {
    public let access: ApplicationInfo?
    public let connect: ApplicationInfo?
    public let innerspace: ApplicationInfo?
    public let network: ApplicationInfo?
    public let protect: ApplicationInfo?
    public let talk: ApplicationInfo?

    public init(access: ApplicationInfo, connect: ApplicationInfo, innerspace: ApplicationInfo, network: ApplicationInfo, protect: ApplicationInfo, talk: ApplicationInfo) {
        self.access = access
        self.connect = connect
        self.innerspace = innerspace
        self.network = network
        self.protect = protect
        self.talk = talk
    }
    
    internal init(response: Components.Schemas.Applications?) {
        self.access = ApplicationInfo(response: response?.access)
        self.connect = ApplicationInfo(response: response?.connect)
        self.innerspace = ApplicationInfo(response: response?.innerspace)
        self.network = ApplicationInfo(response: response?.network)
        self.protect = ApplicationInfo(response: response?.protect)
        self.talk = ApplicationInfo(response: response?.talk)
    }
}

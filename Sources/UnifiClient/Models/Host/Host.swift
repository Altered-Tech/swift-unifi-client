import Foundation

// MARK: - Host
public struct Host {
    public let hardwareID: String?
    public let id: String?
    public let ipAddress: String?
    public let isBlocked: Bool?
    public let lastConnectionStateChange: String?
    public let latestBackupTime: String?
    public let owner: Bool?
    public let registrationTime: String?
    public let reportedState: ReportedState?
    public let type: String?
    public let userData: UserData?

    public init(hardwareID: String, id: String, ipAddress: String, isBlocked: Bool, lastConnectionStateChange: String, latestBackupTime: String, owner: Bool, registrationTime: String, reportedState: ReportedState, type: String, userData: UserData) {
        self.hardwareID = hardwareID
        self.id = id
        self.ipAddress = ipAddress
        self.isBlocked = isBlocked
        self.lastConnectionStateChange = lastConnectionStateChange
        self.latestBackupTime = latestBackupTime
        self.owner = owner
        self.registrationTime = registrationTime
        self.reportedState = reportedState
        self.type = type
        self.userData = userData
    }
    
    public init(client: Components.Schemas.Host?) {
        self.hardwareID = client?.hardwareId
        self.id = client?.id
        self.ipAddress = client?.ipAddress
        self.isBlocked = client?.isBlocked
        self.lastConnectionStateChange = client?.lastConnectionStateChange
        self.latestBackupTime = client?.latestBackupTime
        self.owner = client?.owner
        self.registrationTime = client?.registrationTime
        self.reportedState = ReportedState(response: client?.reportedState)
        self.type = client?._type
        self.userData = UserData(client: client?.userData)
    }
}

public struct Hosts {
    public let traceId: String?
    public let message: String?
    public let httpStatusCode: Int?
    public let hosts: [Host]?
    
    public init(
        traceId: String?,
        message: String?,
        httpStatusCode: Int?,
        hosts: [Host]?
    ) {
        self.traceId = traceId
        self.message = message
        self.httpStatusCode = httpStatusCode
        self.hosts = hosts
    }
    
    internal init(client: Components.Schemas.Hosts) {
        self.httpStatusCode = client.httpStatusCode
        self.message = client.message
        self.traceId = client.traceId
        self.hosts = client.data?.map{ Host(client: $0) }
    }
}

public struct HostId {
    public let traceId: String?
    public let message: String?
    public let httpStatusCode: Int?
    public let host: Host?
    
    public init(
        traceId: String?,
        message: String?,
        httpStatusCode: Int?,
        host: Host?
    ) {
        self.traceId = traceId
        self.message = message
        self.httpStatusCode = httpStatusCode
        self.host = host
    }
    
    internal init(client: Components.Schemas.HostId) {
        self.httpStatusCode = client.httpStatusCode
        self.message = client.message
        self.traceId = client.traceId
        self.host = Host(client: client.data)
    }
}

import Foundation

// MARK: - UserData
public struct UserData {
    public let apps: [String]?
    public let consoleGroupMembers: [ConsoleGroupMember]?
    public let controllers: [String]?
    public let email: String?
    public let features: UserDataFeatures?
    public let fullName: String?
    public let localID: String?
    public let permissions: Permissions?
    public let role: String?
    public let roleID: String?
    public let status: String?

    public init(apps: [String], consoleGroupMembers: [ConsoleGroupMember], controllers: [String], email: String, features: UserDataFeatures, fullName: String, localID: String, permissions: Permissions, role: String, roleID: String, status: String) {
        self.apps = apps
        self.consoleGroupMembers = consoleGroupMembers
        self.controllers = controllers
        self.email = email
        self.features = features
        self.fullName = fullName
        self.localID = localID
        self.permissions = permissions
        self.role = role
        self.roleID = roleID
        self.status = status
    }
    
    public init(client: Components.Schemas.UserData?) {
        self.apps = client?.apps
        self.consoleGroupMembers = client?.consoleGroupMembers?.map{ ConsoleGroupMember(response: $0)}
        self.controllers = client?.controllers
        self.email = client?.email
        self.features = UserDataFeatures(response: client?.features)
        self.fullName = client?.fullName
        self.localID = client?.localId
        self.permissions = Permissions(response: client?.permissions)
        self.role = client?.role
        self.roleID = client?.roleId
        self.status = client?.status
    }
}

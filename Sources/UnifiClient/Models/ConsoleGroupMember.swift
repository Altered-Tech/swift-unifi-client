import Foundation

// MARK: - ConsoleGroupMember
public struct ConsoleGroupMember {
    public let mac: String?
    public let role: String?
    public let roleAttributes: RoleAttributes?
    public let sysID: Int?

    public init(mac: String, role: String, roleAttributes: RoleAttributes, sysID: Int) {
        self.mac = mac
        self.role = role
        self.roleAttributes = roleAttributes
        self.sysID = sysID
    }
    
    internal init(response: Components.Schemas.ConsoleGroupMember?) {
        self.mac = response?.mac
        self.role = response?.role
        self.roleAttributes = RoleAttributes(response: response?.roleAttributes)
        self.sysID = response?.sysID
    }
}

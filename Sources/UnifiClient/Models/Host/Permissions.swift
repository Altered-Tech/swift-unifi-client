import Foundation

// MARK: - Permissions
public struct Permissions {
    public let networkManagement: [String]?
    public let protectManagement: [String]?
    public let systemManagementLocation: [String]?
    public let systemManagementUser: [String]?

    public init(networkManagement: [String], protectManagement: [String], systemManagementLocation: [String], systemManagementUser: [String]) {
        self.networkManagement = networkManagement
        self.protectManagement = protectManagement
        self.systemManagementLocation = systemManagementLocation
        self.systemManagementUser = systemManagementUser
    }
    
    internal init(response: Components.Schemas.UserData.permissionsPayload?) {
        self.networkManagement = response?.network_period_management
        self.protectManagement = response?.protect_period_management
        self.systemManagementLocation = response?.system_period_management_period_location
        self.systemManagementUser = response?.system_period_management_period_user
    }
}

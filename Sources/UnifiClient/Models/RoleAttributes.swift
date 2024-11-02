import Foundation

// MARK: - RoleAttributes
public struct RoleAttributes {
    public let applications: Applications?
    public let candidateRoles: [String]?
    public let connectedState: String?
    public let connectedStateLastChanged: String?

    public init(applications: Applications, candidateRoles: [String], connectedState: String, connectedStateLastChanged: String) {
        self.applications = applications
        self.candidateRoles = candidateRoles
        self.connectedState = connectedState
        self.connectedStateLastChanged = connectedStateLastChanged
    }
    
    internal init(response: Components.Schemas.RoleAttributes?) {
        self.applications = Applications(response: response?.applications)
        self.candidateRoles = response?.candidateRoles
        self.connectedState = response?.connectedState
        self.connectedStateLastChanged = response?.connectedStateLastChanged
    }
}

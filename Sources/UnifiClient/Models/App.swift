import Foundation

// MARK: - App
public struct App {
    public let controllerStatus: String?
    public let name: String?
    public let port: Int32?
    public let swaiVersion: Int32?
    public let type: String?
    public let version: String?

    public init(controllerStatus: String, name: String, port: Int32, swaiVersion: Int32, type: String, version: String) {
        self.controllerStatus = controllerStatus
        self.name = name
        self.port = port
        self.swaiVersion = swaiVersion
        self.type = type
        self.version = version
    }
    
    internal init(responses: Components.Schemas.App?) {
        self.controllerStatus = responses?.controllerStatus
        self.name = responses?.name
        self.port = responses?.port
        self.swaiVersion = responses?.swaiVersion
        self.type = responses?._type
        self.version = responses?.version
    }
}

import Foundation

// MARK: - Controller
public struct Controller {
    public let abridged: Bool?
    public let controllerStatus: String?
    public let initialDeviceListSynced: Bool?
    public let installState: String?
    public let isConfigured: Bool?
    public let isInstalled: Bool?
    public let isRunning: Bool?
    public let name: String?
    public let port: Int32?
    public let releaseChannel: String?
    public let controllerRequired: Bool?
    public let state: String?
    public let status: String?
    public let statusMessage: String?
    public let swaiVersion: Int32?
    public let type: String?
    public let uiVersion: String?
    public let unadoptedDevices: [Any?]?
    public let updatable: Bool?
    public let updateAvailable: String?
    public let version: String?
    public let features: ControllerFeatures?
    public let installable: Bool?
    public let isGeofencingEnabled: Bool?
    public let restorePercentage: Int32?

    public init(abridged: Bool?, controllerStatus: String?, initialDeviceListSynced: Bool?, installState: String?, isConfigured: Bool?, isInstalled: Bool?, isRunning: Bool?, name: String?, port: Int32?, releaseChannel: String?, controllerRequired: Bool?, state: String?, status: String?, statusMessage: String?, swaiVersion: Int32?, type: String?, uiVersion: String?, unadoptedDevices: [Any?]?, updatable: Bool?, updateAvailable: String?, version: String?, features: ControllerFeatures?, installable: Bool?, isGeofencingEnabled: Bool?, restorePercentage: Int32?) {
        self.abridged = abridged
        self.controllerStatus = controllerStatus
        self.initialDeviceListSynced = initialDeviceListSynced
        self.installState = installState
        self.isConfigured = isConfigured
        self.isInstalled = isInstalled
        self.isRunning = isRunning
        self.name = name
        self.port = port
        self.releaseChannel = releaseChannel
        self.controllerRequired = controllerRequired
        self.state = state
        self.status = status
        self.statusMessage = statusMessage
        self.swaiVersion = swaiVersion
        self.type = type
        self.uiVersion = uiVersion
        self.unadoptedDevices = unadoptedDevices
        self.updatable = updatable
        self.updateAvailable = updateAvailable
        self.version = version
        self.features = features
        self.installable = installable
        self.isGeofencingEnabled = isGeofencingEnabled
        self.restorePercentage = restorePercentage
    }
    
    internal init(response: Components.Schemas.Controller?) {
        self.abridged = response?.abridged
        self.controllerStatus = response?.controllerStatus
        self.initialDeviceListSynced = response?.initialDeviceListSynced
        self.installState = response?.installState
        self.isConfigured = response?.isConfigured
        self.isInstalled = response?.isInstalled
        self.isRunning = response?.isRunning
        self.name = response?.name
        self.port = response?.port
        self.releaseChannel = response?.releaseChannel
        self.controllerRequired = response?.required
        self.state = response?.state
        self.status = response?.status
        self.statusMessage = response?.statusMessage
        self.swaiVersion = response?.swaiVersion
        self.type = response?._type
        self.uiVersion = response?.uiVersion
        self.unadoptedDevices = response?.unadoptedDevices
        self.updatable = response?.updatable
        self.updateAvailable = response?.updateAvailable
        self.version = response?.version
        self.features = ControllerFeatures(response: response?.features)
        self.installable = response?.installable
        self.isGeofencingEnabled = response?.isGeofencingEnabled
        self.restorePercentage = response?.restorePercentage
    }
}

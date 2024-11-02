import Foundation

// MARK: - DeviceElement
public struct Devices {
    public let adoptionTime: String?
    public let firmwareStatus: String?
    public let id: String?
    public let ip: String?
    public let isConsole: Bool?
    public let isManaged: Bool?
    public let mac: String?
    public let model: String?
    public let name: String?
    public let note: String?
    public let productLine: String?
    public let shortname: String?
    public let startupTime: String?
    public let status: String?
    public let uidb: Uidb?
    public let updateAvailable: String?
    public let version: String?

    public init(adoptionTime: String, firmwareStatus: String, id: String, ip: String, isConsole: Bool, isManaged: Bool, mac: String, model: String, name: String, note: String, productLine: String, shortname: String, startupTime: String, status: String, uidb: Uidb, updateAvailable: String, version: String) {
        self.adoptionTime = adoptionTime
        self.firmwareStatus = firmwareStatus
        self.id = id
        self.ip = ip
        self.isConsole = isConsole
        self.isManaged = isManaged
        self.mac = mac
        self.model = model
        self.name = name
        self.note = note
        self.productLine = productLine
        self.shortname = shortname
        self.startupTime = startupTime
        self.status = status
        self.uidb = uidb
        self.updateAvailable = updateAvailable
        self.version = version
    }
    
    internal init(response: Components.Schemas.Device?) {
        self.adoptionTime = response?.adoptionTime
        self.firmwareStatus = response?.firmwareStatus
        self.id = response?.id
        self.ip = response?.ip
        self.isConsole = response?.isConsole
        self.isManaged = response?.isManaged
        self.mac = response?.mac
        self.model = response?.model
        self.name = response?.name
        self.note = response?.note
        self.productLine = response?.productLine
        self.shortname = response?.shortname
        self.startupTime = response?.startupTime
        self.status = response?.status
        self.uidb = Uidb(response: response?.uidb)
        self.updateAvailable = response?.updateAvailable
        self.version = response?.version
    }
}

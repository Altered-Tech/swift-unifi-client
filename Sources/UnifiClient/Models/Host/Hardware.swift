import Foundation

// MARK: - Hardware
public struct Hardware {
    public let bom: String?
    public let cpuID: String?
    public let debianCodename: String?
    public let firmwareVersion: String?
    public let hwrev: Int32?
    public let mac: String?
    public let name: String?
    public let qrid: String?
    public let reboot: String?
    public let serialno: String?
    public let shortname: String?
    public let subtype: String?
    public let sysid: Int32?
    public let upgrade: String?
    public let uuid: String?

    public init(bom: String?, cpuID: String?, debianCodename: String?, firmwareVersion: String?, hwrev: Int32?, mac: String?, name: String?, qrid: String?, reboot: String?, serialno: String?, shortname: String?, subtype: String?, sysid: Int32?, upgrade: String?, uuid: String?) {
        self.bom = bom
        self.cpuID = cpuID
        self.debianCodename = debianCodename
        self.firmwareVersion = firmwareVersion
        self.hwrev = hwrev
        self.mac = mac
        self.name = name
        self.qrid = qrid
        self.reboot = reboot
        self.serialno = serialno
        self.shortname = shortname
        self.subtype = subtype
        self.sysid = sysid
        self.upgrade = upgrade
        self.uuid = uuid
    }
    
    internal init(response: Components.Schemas.Hardware?) {
        self.bom = response?.bom
        self.cpuID = response?.cpu_period_id
        self.debianCodename = response?.debianCodename
        self.firmwareVersion = response?.firmwareVersion
        self.hwrev = response?.hwrev
        self.mac = response?.mac
        self.name = response?.name
        self.qrid = response?.qrid
        self.reboot = response?.reboot
        self.serialno = response?.serialno
        self.shortname = response?.shortname
        self.subtype = response?.subtype
        self.sysid = response?.sysid
        self.upgrade = response?.upgrade
        self.uuid = response?.uuid
    }
}

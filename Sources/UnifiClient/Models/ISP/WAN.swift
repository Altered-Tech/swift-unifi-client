import Foundation

// MARK: - WAN
public struct WAN {
    public let avgLatency: Int32?
    public let downloadKbps: Int32?
    public let downtime: Int32?
    public let ispAsn: String?
    public let ispName: String?
    public let maxLatency: Int32?
    public let packetLoss: Int32?
    public let uploadKbps: Int32?
    public let uptime: Int32?

    public init(avgLatency: Int32, downloadKbps: Int32, downtime: Int32, ispAsn: String, ispName: String, maxLatency: Int32, packetLoss: Int32, uploadKbps: Int32, uptime: Int32) {
        self.avgLatency = avgLatency
        self.downloadKbps = downloadKbps
        self.downtime = downtime
        self.ispAsn = ispAsn
        self.ispName = ispName
        self.maxLatency = maxLatency
        self.packetLoss = packetLoss
        self.uploadKbps = uploadKbps
        self.uptime = uptime
    }
    
    internal init(response: Components.Schemas.Period.dataPayload.wanPayload?) {
        self.avgLatency = response?.avgLatency
        self.downloadKbps = response?.download_kbps
        self.downtime = response?.downtime
        self.ispAsn = response?.ispAsn
        self.ispName = response?.ispName
        self.maxLatency = response?.maxLatency
        self.packetLoss = response?.packetLoss
        self.uploadKbps = response?.upload_kbps
        self.uptime = response?.uptime
    }
}

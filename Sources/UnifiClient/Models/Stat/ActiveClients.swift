//
//  ActiveClients.swift
//  swift-unifi-client
//
//  Created by Michael Einreinhof on 10/11/24.
//

extension UnifiClient {
    public func activeClients(site: String) async throws -> [UnifiActiveClient]? {
        let path: String = "\(basePath)/\(site)/stat/sta"
        do {
            let result: UnifiResponse<UnifiActiveClient>? = try await getData(path: path, method: .GET)
            return result?.data ?? nil
        } catch {
            unifiClientLogger.error("Failed to get active clients for site \(site): \(error)")
            throw error
        }
    }
}

public struct UnifiActiveClient: Codable {
    let siteId: String?
    let assocTime: Int?
    let latestAssocTime: Int?
    let oui: String?
    let userId: String?
    let lastUplinkName: String?
    let lastIp: String?
    let firstSeen: Int?
    let lastSeen: Int?
    let isGuest: Bool?
    let disconnectTimestamp: Int?
    let useFixedip: Bool?
    let localDnsRecord: String?
    let isWired: Bool?
    let usergroupId: String?
    let lastUplinkMac: String?
    let lastConnectionNetworkName: String?
    let mac: String?
    let virtualNetworkOverrideEnabled: Bool?
    let lastConnectionNetworkId: String?
    let noted: Bool?
    let name: String?
    let localDnsRecordEnabled: Bool?
    let virtualNetworkOverrideId: String?
    let Id: String?
    let fixedIp: String?
    let UptimeByUsw: Int?
    let LastSeenByUsw: Int?
    let IsGuestByUsw: Bool?
    let ip: String?
    let swMac: String?
    let swPort: Int?
    let wiredRateMbps: Int?
    let swDepth: Int?
    let network: String?
    let networkId: String?
    let satisfaction: Int?
    let anomalies: Int?
    let satisfactionAvg: String?
    let uptime: Int?
    let eagerlyDiscovered: Bool?
    let vlan: Int?
    let apMac: String?
    let lastRadio: String?
    let lastIpv6: [String]?
    let hostname: String?
    let wlanconfId: String?
    let UptimeByUap: Int?
    let LastSeenByUap: Int?
    let IsGuestByUap: Bool?
    let channel: Int?
    let radio: String?
    let radioName: String?
    let essid: String?
    let bssid: String?
    let powersaveEnabled: Bool?
    let is11R: Bool?
    let userGroupIdComputed: String?
    let anonClientId: String?
    let ccq: Int?
    let dhcpendTime: Int?
    let idletime: Int?
    let noise: Int?
    let nss: Int?
    let rxRate: Int?
    let rssi: Int?
    let satisfactionReal: Int?
    let satisfactionReason: Int?
    let signal: Int?
    let txMcs: Int?
    let txPower: Int?
    let txRate: Int?
    let txRetryBurstCount: Int?
    let hostnameSource: String?
    let isMlo: Bool?
    let radioProto: String?
    let channelWidth: Int?
    let txBytes: Int?
    let rxBytes: Int?
    let txPackets: Int?
    let rxPackets: Int?
    let authorized: Bool?
    let qosPolicyApplied: Bool?
    let bytesR: Double?
    let txBytesR: Double?
    let rxBytesR: Double?
    let txRetries: Int?
    let wifiTxAttempts: Int?
    let wifiTxDropped: Int?
    let wifiTxRetriesPercentage: Double?
    let satisfactionNow: Int?
    let unifiDeviceInfoFromUcore: String?
    let wiredTxBytes: Int?
    let wiredRxBytes: Int?
    let wiredTxPackets: Int?
    let wiredRxPackets: Int?
    let wiredTxBytesR: Double?
    let wiredRxBytesR: Double?
    let ipv6Addresses: [String]?
    let roamCount: Int?

    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case assocTime = "assoc_time"
        case latestAssocTime = "latest_assoc_time"
        case oui
        case userId = "user_id"
        case lastUplinkName = "last_uplink_name"
        case lastIp = "last_ip"
        case firstSeen = "first_seen"
        case lastSeen = "last_seen"
        case isGuest = "is_guest"
        case disconnectTimestamp = "disconnect_timestamp"
        case useFixedip = "use_fixedip"
        case localDnsRecord = "local_dns_record"
        case isWired = "is_wired"
        case usergroupId = "usergroup_id"
        case lastUplinkMac = "last_uplink_mac"
        case lastConnectionNetworkName = "last_connection_network_name"
        case mac
        case virtualNetworkOverrideEnabled = "virtual_network_override_enabled"
        case lastConnectionNetworkId = "last_connection_network_id"
        case noted
        case name
        case localDnsRecordEnabled = "local_dns_record_enabled"
        case virtualNetworkOverrideId = "virtual_network_override_id"
        case Id = "_id"
        case fixedIp = "fixed_ip"
        case UptimeByUsw = "_uptime_by_usw"
        case LastSeenByUsw = "_last_seen_by_usw"
        case IsGuestByUsw = "_is_guest_by_usw"
        case ip
        case swMac = "sw_mac"
        case swPort = "sw_port"
        case wiredRateMbps = "wired_rate_mbps"
        case swDepth = "sw_depth"
        case network
        case networkId = "network_id"
        case satisfaction
        case anomalies
        case satisfactionAvg = "satisfaction_avg"
        case uptime
        case eagerlyDiscovered = "eagerly_discovered"
        case vlan
        case apMac = "ap_mac"
        case lastRadio = "last_radio"
        case lastIpv6 = "last_ipv6"
        case hostname
        case wlanconfId = "wlanconf_id"
        case UptimeByUap = "_uptime_by_uap"
        case LastSeenByUap = "_last_seen_by_uap"
        case IsGuestByUap = "_is_guest_by_uap"
        case channel
        case radio
        case radioName = "radio_name"
        case essid
        case bssid
        case powersaveEnabled = "powersave_enabled"
        case is11R = "is_11r"
        case userGroupIdComputed = "user_group_id_computed"
        case anonClientId = "anon_client_id"
        case ccq
        case dhcpendTime = "dhcpend_time"
        case idletime
        case noise
        case nss
        case rxRate = "rx_rate"
        case rssi
        case satisfactionReal = "satisfaction_real"
        case satisfactionReason = "satisfaction_reason"
        case signal
        case txMcs = "tx_mcs"
        case txPower = "tx_power"
        case txRate = "tx_rate"
        case txRetryBurstCount = "tx_retry_burst_count"
        case hostnameSource = "hostname_source"
        case isMlo = "is_mlo"
        case radioProto = "radio_proto"
        case channelWidth = "channel_width"
        case txBytes = "tx_bytes"
        case rxBytes = "rx_bytes"
        case txPackets = "tx_packets"
        case rxPackets = "rx_packets"
        case authorized
        case qosPolicyApplied = "qos_policy_applied"
        case bytesR = "bytes-r"
        case txBytesR = "tx_bytes-r"
        case rxBytesR = "rx_bytes-r"
        case txRetries = "tx_retries"
        case wifiTxAttempts = "wifi_tx_attempts"
        case wifiTxDropped = "wifi_tx_dropped"
        case wifiTxRetriesPercentage = "wifi_tx_retries_percentage"
        case satisfactionNow = "satisfaction_now"
        case unifiDeviceInfoFromUcore = "unifi_device_info_from_ucore"
        case wiredTxBytes = "wired-tx_bytes"
        case wiredRxBytes = "wired-rx_bytes"
        case wiredTxPackets = "wired-tx_packets"
        case wiredRxPackets = "wired-rx_packets"
        case wiredTxBytesR = "wired-tx_bytes-r"
        case wiredRxBytesR = "wired-rx_bytes-r"
        case ipv6Addresses = "ipv6_addresses"
        case roamCount = "roam_count"
    }
}

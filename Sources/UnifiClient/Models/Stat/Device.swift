////
////  Device.swift
////  Helix
////
////  Created by Michael Einreinhof on 10/1/24.
////
//
//import Foundation
//
//extension UnifiClient {
//    public func devicesBasic(site: String) async throws -> [UnifiDeviceBasic]? {
//        let path = "\(basePath)/\(site)/stat/device-basic"
//        do {
//            let result: UnifiResponse<UnifiDeviceBasic>? = try await getData(path: path, method: .GET)
//            return result?.data ?? nil
//        } catch {
//            unifiClientLogger.error("Failed to get devices for site \(site): \(error)")
//            throw error
//        }
//    }
//    
//    public func devicesDetailed(site: String) async throws -> [UnifiDevice]? {
//        let path = "\(basePath)/\(site)/stat/device"
//        do {
//            let result: UnifiResponse<UnifiDevice>? = try await getData(path: path, method: .GET)
//            return result?.data ?? nil
//        } catch {
//            unifiClientLogger.error("Failed to get devices for site \(site): \(error)")
//            throw error
//        }
//    }
//}
//
//public struct UnifiDeviceBasic: Codable {
//    let mac: String
//    let state: Int
//    let adopted, disabled: Bool
//    let type, model: String
//    let inGatewayMode: Bool
//    let name: String
//
//    enum CodingKeys: String, CodingKey {
//        case mac, state, adopted, disabled, type, model
//        case inGatewayMode = "in_gateway_mode"
//        case name
//    }
//}
//
//public struct UnifiDevice: Codable {
//    let requiredVersion: String
//    let portTable: [PortTable]
//    let licenseState: String
//    let lcmBrightnessOverride: Bool?
//    let type: String
//    let boardRev: Int
//    let setupID: String
//    let hwCaps, rebootDuration: Int
//    let snmpContact: String?
//    let configNetwork: ConfigNetwork
//    let syslogKey, model: String
//    let slimcfgCaps: Int?
//    let manufacturerID, sysid: Int
//    let ip: String
//    let fw2Caps: Int
//    let jumboframeEnabled: Bool?
//    let lastConnectionNetworkName, shortname, version: String
//    let adoptionCompleted: Bool
//    let unsupportedReason: Int
//    let anonID: String
//    let stpVersion: String?
//    let lastConnectionNetworkID: String
//    let siteID: String
//    let adoptedAt: Int
//    let name: String
//    let fwCaps: Int
//    let lcmBrightness: Int?
//    let id: String
//    let internet: Bool
//    let mgmtNetworkID: String?
//    let gatewayMAC: String
//    let stpPriority, lcmNightModeBegins: String?
//    let twoPhaseAdopt: Bool
//    let portOverrides: [PortOverride]?
//    let informIP, cfgversion, mac: String
//    let provisionedAt: Int
//    let informURL: String
//    let upgradeDuration: Int
//    let ethernetTable: [EthernetTable]
//    let flowctrlEnabled: Bool?
//    let unsupported: Bool
//    let bleCaps, sysErrorCaps: Int
//    let dot1XPortctrlEnabled: Bool
//    let lastUplink: LastUplink
//    let etherLighting: EtherLighting?
//    let disconnectedAt: Int
//    let architecture: String
//    let xAESGcm, hasFan, modelIncompatible: Bool
//    let xAuthkey, xSSHHostkeyFingerprint: String
//    let satisfaction: Int
//    let modelInEOL: Bool
//    let anomalies: Int?
//    let hasTemperature: Bool
//    let switchCaps: [String: Int]
//    let adoptedByClient, snmpLocation: String?
//    let modelInLts: Bool
//    let kernelVersion, serial: String
//    let powerSourceCtrlEnabled: Bool?
//    let lcmNightModeEnds: String?
//    let adopted: Bool
//    let hashID, deviceID: String
//    let uplink: Uplink
//    let state, startDisconnectedMillis, credentialCaps: Int
//    let unifiDeviceDefault: Bool
//    let discoveredVia, adoptIP: String
//    let adoptURL: String
//    let xAdoptUsername, xAdoptPassword: String
//    let adoptState, adoptTries, lastSeen, minInformIntervalSeconds: Int
//    let upgradable, adoptableWhenUpgraded, rollupgrade: Bool
//    let knownCfgversion: String
//    let unifiDeviceUptime, uptime: Int
//    let locating: Bool
//    let startConnectedMillis: Int
//    let prevNonBusyState: Int?
//    let nextInterval: Int
//    let connectRequestIP, connectRequestPort: String
//    let sysStats: SysStats
//    let systemStats: SystemStats
//    let sshSessionTable: [String]
//    let lldpTable: [LldpTable]
//    let displayableVersion: String
//    let connectionNetworkID: String
//    let connectionNetworkName: String
//    let startupTimestamp: Int
//    let isAccessPoint, safeForAutoupgrade: Bool
//    let generalTemperature: Int?
//    let overheating: Bool?
//    let totalMaxPower: Int?
//    let downlinkTable: [DownlinkTable]
//    let uplinkDepth: Int?
//    let downlinkLldpMacs: [String]
//    let dhcpServerTable: [String]?
//    let totalUsedPower: Double?
//    let detailedStates: DetailedStates
//    let stat: Stat
//    let txBytes, rxBytes, bytes, numSta: Int
//    let userNumSta, guestNumSta: Int
//    let xHasSSHHostkey: Bool
//    let hasSpeaker, meshStaVapEnabled: Bool?
//    let outdoorModeOverride: String?
//    let supportWifi6E: Bool?
//    let ledOverrideColor: String?
//    let scanRadioTable: [String]?
//    let xVwirekey: String?
//    let supportsFingerprintMl: Bool?
//    let countryCode: Int?
//    let wlangroupIDNa: String?
//    let countrycodeTable: [Int]?
//    let antennaTable: [AntennaTable]?
//    let wifiCaps: Int?
//    let wlangroupIDNg: String?
//    let atfEnabled: Bool?
//    let radioTable: [RadioTable]?
//    let connectedAt: Int?
//    let ipv6: [String]?
//    let ledOverride: String?
//    let wifiCaps2: Int?
//    let hasEth1: Bool?
//    let vwireTable: [String]?
//    let fixedApAvailable: Bool?
//    let ledOverrideColorBrightness: Int?
//    let guid: String?
//    let scanning, spectrumScanning: Bool?
//    let meshv3PeerMAC, elementPeerMAC: String?
//    let guestKicks: Int?
//    let guestToken, hideChWidth: String?
//    let isolated: Bool?
//    let radioTableStats: [RadioTableStat]?
//    let vapTable: [VapTable]?
//    let vwireVapTable: [VwireVapTable]?
//    let bytesD, txBytesD, rxBytesD: Int?
//    let bytesR: Double?
//    let vwireEnabled: Bool?
//    let uplinkTable: [String]?
//    let userWLANNumSta, guestWLANNumSta: Int?
//    let portStats: [String]?
//
//    enum CodingKeys: String, CodingKey {
//        case requiredVersion = "required_version"
//        case portTable = "port_table"
//        case licenseState = "license_state"
//        case lcmBrightnessOverride = "lcm_brightness_override"
//        case type
//        case boardRev = "board_rev"
//        case setupID = "setup_id"
//        case hwCaps = "hw_caps"
//        case rebootDuration = "reboot_duration"
//        case snmpContact = "snmp_contact"
//        case configNetwork = "config_network"
//        case syslogKey = "syslog_key"
//        case model
//        case slimcfgCaps = "slimcfg_caps"
//        case manufacturerID = "manufacturer_id"
//        case sysid, ip
//        case fw2Caps = "fw2_caps"
//        case jumboframeEnabled = "jumboframe_enabled"
//        case lastConnectionNetworkName = "last_connection_network_name"
//        case shortname, version
//        case adoptionCompleted = "adoption_completed"
//        case unsupportedReason = "unsupported_reason"
//        case anonID = "anon_id"
//        case stpVersion = "stp_version"
//        case lastConnectionNetworkID = "last_connection_network_id"
//        case siteID = "site_id"
//        case adoptedAt = "adopted_at"
//        case name
//        case fwCaps = "fw_caps"
//        case lcmBrightness = "lcm_brightness"
//        case id = "_id"
//        case internet
//        case mgmtNetworkID = "mgmt_network_id"
//        case gatewayMAC = "gateway_mac"
//        case stpPriority = "stp_priority"
//        case lcmNightModeBegins = "lcm_night_mode_begins"
//        case twoPhaseAdopt = "two_phase_adopt"
//        case portOverrides = "port_overrides"
//        case informIP = "inform_ip"
//        case cfgversion, mac
//        case provisionedAt = "provisioned_at"
//        case informURL = "inform_url"
//        case upgradeDuration = "upgrade_duration"
//        case ethernetTable = "ethernet_table"
//        case flowctrlEnabled = "flowctrl_enabled"
//        case unsupported
//        case bleCaps = "ble_caps"
//        case sysErrorCaps = "sys_error_caps"
//        case dot1XPortctrlEnabled = "dot1x_portctrl_enabled"
//        case lastUplink = "last_uplink"
//        case etherLighting = "ether_lighting"
//        case disconnectedAt = "disconnected_at"
//        case architecture
//        case xAESGcm = "x_aes_gcm"
//        case hasFan = "has_fan"
//        case modelIncompatible = "model_incompatible"
//        case xAuthkey = "x_authkey"
//        case xSSHHostkeyFingerprint = "x_ssh_hostkey_fingerprint"
//        case satisfaction
//        case modelInEOL = "model_in_eol"
//        case anomalies
//        case hasTemperature = "has_temperature"
//        case switchCaps = "switch_caps"
//        case adoptedByClient = "adopted_by_client"
//        case snmpLocation = "snmp_location"
//        case modelInLts = "model_in_lts"
//        case kernelVersion = "kernel_version"
//        case serial
//        case powerSourceCtrlEnabled = "power_source_ctrl_enabled"
//        case lcmNightModeEnds = "lcm_night_mode_ends"
//        case adopted
//        case hashID = "hash_id"
//        case deviceID = "device_id"
//        case uplink, state
//        case startDisconnectedMillis = "start_disconnected_millis"
//        case credentialCaps = "credential_caps"
//        case unifiDeviceDefault = "default"
//        case discoveredVia = "discovered_via"
//        case adoptIP = "adopt_ip"
//        case adoptURL = "adopt_url"
//        case xAdoptUsername = "x_adopt_username"
//        case xAdoptPassword = "x_adopt_password"
//        case adoptState = "adopt_state"
//        case adoptTries = "adopt_tries"
//        case lastSeen = "last_seen"
//        case minInformIntervalSeconds = "min_inform_interval_seconds"
//        case upgradable
//        case adoptableWhenUpgraded = "adoptable_when_upgraded"
//        case rollupgrade
//        case knownCfgversion = "known_cfgversion"
//        case unifiDeviceUptime = "uptime"
//        case uptime = "_uptime"
//        case locating
//        case startConnectedMillis = "start_connected_millis"
//        case prevNonBusyState = "prev_non_busy_state"
//        case nextInterval = "next_interval"
//        case connectRequestIP = "connect_request_ip"
//        case connectRequestPort = "connect_request_port"
//        case sysStats = "sys_stats"
//        case systemStats = "system-stats"
//        case sshSessionTable = "ssh_session_table"
//        case lldpTable = "lldp_table"
//        case displayableVersion = "displayable_version"
//        case connectionNetworkID = "connection_network_id"
//        case connectionNetworkName = "connection_network_name"
//        case startupTimestamp = "startup_timestamp"
//        case isAccessPoint = "is_access_point"
//        case safeForAutoupgrade = "safe_for_autoupgrade"
//        case generalTemperature = "general_temperature"
//        case overheating
//        case totalMaxPower = "total_max_power"
//        case downlinkTable = "downlink_table"
//        case uplinkDepth = "uplink_depth"
//        case downlinkLldpMacs = "downlink_lldp_macs"
//        case dhcpServerTable = "dhcp_server_table"
//        case totalUsedPower = "total_used_power"
//        case detailedStates = "detailed_states"
//        case stat
//        case txBytes = "tx_bytes"
//        case rxBytes = "rx_bytes"
//        case bytes
//        case numSta = "num_sta"
//        case userNumSta = "user-num_sta"
//        case guestNumSta = "guest-num_sta"
//        case xHasSSHHostkey = "x_has_ssh_hostkey"
//        case hasSpeaker = "has_speaker"
//        case meshStaVapEnabled = "mesh_sta_vap_enabled"
//        case outdoorModeOverride = "outdoor_mode_override"
//        case supportWifi6E = "support_wifi6e"
//        case ledOverrideColor = "led_override_color"
//        case scanRadioTable = "scan_radio_table"
//        case xVwirekey = "x_vwirekey"
//        case supportsFingerprintMl = "supports_fingerprint_ml"
//        case countryCode = "country_code"
//        case wlangroupIDNa = "wlangroup_id_na"
//        case countrycodeTable = "countrycode_table"
//        case antennaTable = "antenna_table"
//        case wifiCaps = "wifi_caps"
//        case wlangroupIDNg = "wlangroup_id_ng"
//        case atfEnabled = "atf_enabled"
//        case radioTable = "radio_table"
//        case connectedAt = "connected_at"
//        case ipv6
//        case ledOverride = "led_override"
//        case wifiCaps2 = "wifi_caps2"
//        case hasEth1 = "has_eth1"
//        case vwireTable = "vwire_table"
//        case fixedApAvailable = "fixed_ap_available"
//        case ledOverrideColorBrightness = "led_override_color_brightness"
//        case guid, scanning
//        case spectrumScanning = "spectrum_scanning"
//        case meshv3PeerMAC = "meshv3_peer_mac"
//        case elementPeerMAC = "element_peer_mac"
//        case guestKicks = "guest_kicks"
//        case guestToken = "guest_token"
//        case hideChWidth = "hide_ch_width"
//        case isolated
//        case radioTableStats = "radio_table_stats"
//        case vapTable = "vap_table"
//        case vwireVapTable = "vwire_vap_table"
//        case bytesD = "bytes-d"
//        case txBytesD = "tx_bytes-d"
//        case rxBytesD = "rx_bytes-d"
//        case bytesR = "bytes-r"
//        case vwireEnabled
//        case uplinkTable = "uplink_table"
//        case userWLANNumSta = "user-wlan-num_sta"
//        case guestWLANNumSta = "guest-wlan-num_sta"
//        case portStats = "port_stats"
//    }
//}
//
//// MARK: - AntennaTable
//public struct AntennaTable: Codable {
//    let wifi1Gain: Int?
//    let antennaTableDefault: Bool
//    let name: String
//    let wifi2Gain: Int?
//    let id: Int
//    let wifi0Gain, rai0Gain, ra0Gain: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case wifi1Gain = "wifi1_gain"
//        case antennaTableDefault = "default"
//        case name
//        case wifi2Gain = "wifi2_gain"
//        case id
//        case wifi0Gain = "wifi0_gain"
//        case rai0Gain = "rai0_gain"
//        case ra0Gain = "ra0_gain"
//    }
//}
//
//// MARK: - RadioTableStat
//struct RadioTableStat: Codable {
//    let name: String
//    let lastChannel: Int
//    let radio: Radio
//    let astTxto, astCst, astBeXmit: String?
//    let cuTotal, cuSelfRx, cuSelfTx, gain: Int
//    let satisfaction: Int
//    let state: State
//    let channel, extchannel, txPower, txPackets: Int
//    let txRetries, numSta, guestNumSta, userNumSta: Int
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case lastChannel = "last_channel"
//        case radio
//        case astTxto = "ast_txto"
//        case astCst = "ast_cst"
//        case astBeXmit = "ast_be_xmit"
//        case cuTotal = "cu_total"
//        case cuSelfRx = "cu_self_rx"
//        case cuSelfTx = "cu_self_tx"
//        case gain, satisfaction, state, channel, extchannel
//        case txPower = "tx_power"
//        case txPackets = "tx_packets"
//        case txRetries = "tx_retries"
//        case numSta = "num_sta"
//        case guestNumSta = "guest-num_sta"
//        case userNumSta = "user-num_sta"
//    }
//}
//
//// MARK: - PortTable
//public struct PortTable: Codable {
//    let portIdx: Int
//    let media: Media
//    let portPoe: Bool
//    let poeCaps: Int
//    let speedCaps: Int
//    let opMode: String?
//    let forward: String?
//    let poeMode: String?
//    let autoneg: Bool?
//    let dot1xMode: String
//    let dot1xStatus: Dot1XStatus
//    let enable: Bool
//    let flowctrlRx: Bool
//    let flowctrlTx: Bool
//    let fullDuplex: Bool
//    let isUplink: Bool
//    let jumbo: Bool
//    let macTableCount: Int
//    let poeClass: PoeClass?
//    let poeCurrent: String?
//    let poeEnable: Bool?
//    let poeGood: Bool?
//    let poePower: String?
//    let poeVoltage: String?
//    let rxBroadcast: Int
//    let rxBytes: Int
//    let rxDropped: Int
//    let rxErrors: Int
//    let rxMulticast: Int
//    let rxPackets: Int
//    let satisfaction: Int
//    let satisfactionReason: Int
//    let speed: Int
//    let stpPathcost: Int
//    let stpState: Dot1XStatus
//    let txBroadcast: Int
//    let txBytes: Int
//    let txDropped: Int
//    let txErrors: Int
//    let txMulticast: Int
//    let txPackets: Int
//    let up: Bool
//    let txBytesR: Double
//    let rxBytesR: Double
//    let bytesR: Double
//    let settingPreference: PoeMode?
//    let portSecurityEnabled: Bool?
//    let stormctrlUcastRate: Int?
//    let stormctrlBcastRate: Int?
//    let stormctrlMcastEnabled: Bool?
//    let stormctrlUcastEnabled: Bool?
//    let egressRateLimitKbpsEnabled: Bool?
//    let isolation: Bool?
//    let taggedVlanMgmt: PoeMode?
//    let stormctrlBcastEnabled: Bool?
//    let voiceNetworkconfId: String?
//    let stpPortMode: Bool?
//    let portKeepaliveEnabled: Bool?
//    let stormctrlMcastRate: Int?
//    let nativeNetworkconfId: String?
//    let name: String
//    let portSecurityMacAddress: [String]?
//    let lldpmedEnabled: Bool?
//    let masked: Bool?
//    let aggregatedBy: Bool?
//    let locating: Bool?
//    let excludedNetworkconfIDS: [String]?
//    let sfpCompliance, sfpCurrent: String?
//    let sfpFound: Bool?
//    let sfpPart, sfpRev: String?
//    let sfpRxfault: Bool?
//    let sfpRxpower, sfpSerial, sfpTemperature: String?
//    let sfpTxfault: Bool?
//    let sfpTxpower, sfpVendor, sfpVoltage: String?
//
//    enum CodingKeys: String, CodingKey {
//        case portIdx = "port_idx"
//        case media
//        case portPoe = "port_poe"
//        case poeCaps = "poe_caps"
//        case speedCaps = "speed_caps"
//        case opMode = "op_mode"
//        case forward
//        case poeMode = "poe_mode"
//        case autoneg
//        case dot1xMode = "dot1x_mode"
//        case dot1xStatus = "dot1x_status"
//        case enable
//        case flowctrlRx = "flowctrl_rx"
//        case flowctrlTx = "flowctrl_tx"
//        case fullDuplex = "full_duplex"
//        case isUplink = "is_uplink"
//        case jumbo
//        case macTableCount = "mac_table_count"
//        case poeClass = "poe_class"
//        case poeCurrent = "poe_current"
//        case poeEnable = "poe_enable"
//        case poeGood = "poe_good"
//        case poePower = "poe_power"
//        case poeVoltage = "poe_voltage"
//        case rxBroadcast = "rx_broadcast"
//        case rxBytes = "rx_bytes"
//        case rxDropped = "rx_dropped"
//        case rxErrors = "rx_errors"
//        case rxMulticast = "rx_multicast"
//        case rxPackets = "rx_packets"
//        case satisfaction
//        case satisfactionReason = "satisfaction_reason"
//        case speed
//        case stpPathcost = "stp_pathcost"
//        case stpState = "stp_state"
//        case txBroadcast = "tx_broadcast"
//        case txBytes = "tx_bytes"
//        case txDropped = "tx_dropped"
//        case txErrors = "tx_errors"
//        case txMulticast = "tx_multicast"
//        case txPackets = "tx_packets"
//        case up
//        case txBytesR = "tx_bytes-r"
//        case rxBytesR = "rx_bytes-r"
//        case bytesR = "bytes-r"
//        case settingPreference = "setting_preference"
//        case portSecurityEnabled = "port_security_enabled"
//        case stormctrlUcastRate = "stormctrl_ucast_rate"
//        case stormctrlBcastRate = "stormctrl_bcast_rate"
//        case stormctrlMcastEnabled = "stormctrl_mcast_enabled"
//        case stormctrlUcastEnabled = "stormctrl_ucast_enabled"
//        case egressRateLimitKbpsEnabled = "egress_rate_limit_kbps_enabled"
//        case isolation
//        case taggedVlanMgmt = "tagged_vlan_mgmt"
//        case stormctrlBcastEnabled = "stormctrl_bcast_enabled"
//        case voiceNetworkconfId = "voice_networkconf_id"
//        case stpPortMode = "stp_port_mode"
//        case portKeepaliveEnabled = "port_keepalive_enabled"
//        case stormctrlMcastRate = "stormctrl_mcast_rate"
//        case nativeNetworkconfId = "native_networkconf_id"
//        case name
//        case portSecurityMacAddress = "port_security_mac_address"
//        case lldpmedEnabled = "lldpmed_enabled"
//        case masked
//        case aggregatedBy = "aggregated_by"
//        case locating
//        case excludedNetworkconfIDS = "excluded_networkconf_ids"
//        case sfpCompliance = "sfp_compliance"
//        case sfpCurrent = "sfp_current"
//        case sfpFound = "sfp_found"
//        case sfpPart = "sfp_part"
//        case sfpRev = "sfp_rev"
//        case sfpRxfault = "sfp_rxfault"
//        case sfpRxpower = "sfp_rxpower"
//        case sfpSerial = "sfp_serial"
//        case sfpTemperature = "sfp_temperature"
//        case sfpTxfault = "sfp_txfault"
//        case sfpTxpower = "sfp_txpower"
//        case sfpVendor = "sfp_vendor"
//        case sfpVoltage = "sfp_voltage"
//    }
//}
//
//// MARK: - Media
//public enum Media: String, Codable {
//    case ge = "GE"
//    case sfp = "SFP+"
//    case the2P5Ge = "2P5GE"
//}
//
//// MARK: - PoeClass
//public enum PoeClass: String, Codable {
//    case class0 = "Class 0"
//    case class1 = "Class 1"
//    case class3 = "Class 3"
//    case class4 = "Class 4"
//    case unknown = "Unknown"
//}
//
//// MARK: - ConfigNetwork
//public struct ConfigNetwork: Codable {
//    let type: String?
//    let bondingEnabled: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case type
//        case bondingEnabled = "bonding_enabled"
//    }
//}
//
//
//// MARK: - Dot1XStatus
//public enum Dot1XStatus: String, Codable {
//    case disabled = "disabled"
//    case forwarding = "forwarding"
//}
//
//// MARK: - VapTable
//struct VapTable: Codable {
//    let avgClientSignal: Int
//    let bssid: String
//    let bw, ccq, channel: Int
//    let essid: String
//    let extchannel: Int?
//    let id: String
//    let macFilterRejections: Int
//    let name: String
//    let numSta: Int
//    let radio: Radio
//    let radioName: String
//    let rxBytes, rxCrypts, rxDropped, rxErrors: Int
//    let rxFrags, rxNwids, rxPackets: Int
//    let rxTCPStats: XTCPStats
//    let satisfaction: Int
//    let state: State
//    let txBytes, txCombinedRetries, txDataMpduBytes, txDropped: Int
//    let txErrors, txPackets, txPower, txRetries: Int
//    let txRTSRetries, txSuccess: Int
//    let txTCPStats: XTCPStats
//    let txTotal: Int
//    let up: Bool
//    let usage: Usage
//    let wifiTxAttempts, wifiTxDropped: Int
//    let t: String
//    let wlanconfID: String
//    let isGuest, isWEP: Bool
//    let apMAC: String
//    let mapID: String?
//    let siteID: String
//    let wifiTxLatencyMOV: WifiTxLatencyMOV?
//    let anomaliesBarChart, anomaliesBarChartNow: [String: Int]?
//    let dnsAvgLatency, icmpAvgRtt, numSatisfactionSta: Int?
//    let reasonsBarChart, reasonsBarChartNow: [String: Int]?
//
//    enum CodingKeys: String, CodingKey {
//        case avgClientSignal = "avg_client_signal"
//        case bssid, bw, ccq, channel, essid, extchannel, id
//        case macFilterRejections = "mac_filter_rejections"
//        case name
//        case numSta = "num_sta"
//        case radio
//        case radioName = "radio_name"
//        case rxBytes = "rx_bytes"
//        case rxCrypts = "rx_crypts"
//        case rxDropped = "rx_dropped"
//        case rxErrors = "rx_errors"
//        case rxFrags = "rx_frags"
//        case rxNwids = "rx_nwids"
//        case rxPackets = "rx_packets"
//        case rxTCPStats = "rx_tcp_stats"
//        case satisfaction, state
//        case txBytes = "tx_bytes"
//        case txCombinedRetries = "tx_combined_retries"
//        case txDataMpduBytes = "tx_data_mpdu_bytes"
//        case txDropped = "tx_dropped"
//        case txErrors = "tx_errors"
//        case txPackets = "tx_packets"
//        case txPower = "tx_power"
//        case txRetries = "tx_retries"
//        case txRTSRetries = "tx_rts_retries"
//        case txSuccess = "tx_success"
//        case txTCPStats = "tx_tcp_stats"
//        case txTotal = "tx_total"
//        case up, usage
//        case wifiTxAttempts = "wifi_tx_attempts"
//        case wifiTxDropped = "wifi_tx_dropped"
//        case t
//        case wlanconfID = "wlanconf_id"
//        case isGuest = "is_guest"
//        case isWEP = "is_wep"
//        case apMAC = "ap_mac"
//        case mapID = "map_id"
//        case siteID = "site_id"
//        case wifiTxLatencyMOV = "wifi_tx_latency_mov"
//        case anomaliesBarChart = "anomalies_bar_chart"
//        case anomaliesBarChartNow = "anomalies_bar_chart_now"
//        case dnsAvgLatency = "dns_avg_latency"
//        case icmpAvgRtt = "icmp_avg_rtt"
//        case numSatisfactionSta = "num_satisfaction_sta"
//        case reasonsBarChart = "reasons_bar_chart"
//        case reasonsBarChartNow = "reasons_bar_chart_now"
//    }
//}
//
//// MARK: - PortOverride
//public struct PortOverride: Codable {
//    let settingPreference: String
//    let opMode: OpMode
//    let portSecurityEnabled: Bool
//    let poeMode: String?
//    let stormctrlUcastRate: Int
//    let forward: Forward
//    let stormctrlBcastRate: Int
//    let stormctrlMcastEnabled: Bool
//    let stormctrlUcastEnabled: Bool
//    let egressRateLimitKbpsEnabled: Bool
//    let isolation: Bool
//    let taggedVlanMgmt: PoeMode
//    let portIdx: Int
//    let stormctrlBcastEnabled: Bool
//    let voiceNetworkconfId: String
//    let stpPortMode: Bool
//    let portKeepaliveEnabled: Bool
//    let stormctrlMcastRate: Int
//    let nativeNetworkconfId: String
//    let name: String
//    let portSecurityMacAddress: [String]?
//    let autoneg: Bool
//    let lldpmedEnabled: Bool
//    let excludedNetworkconfIDS: String?
//
//    enum CodingKeys: String, CodingKey {
//        case settingPreference = "setting_preference"
//        case opMode = "op_mode"
//        case portSecurityEnabled = "port_security_enabled"
//        case poeMode = "poe_mode"
//        case stormctrlUcastRate = "stormctrl_ucast_rate"
//        case forward
//        case stormctrlBcastRate = "stormctrl_bcast_rate"
//        case stormctrlMcastEnabled = "stormctrl_mcast_enabled"
//        case stormctrlUcastEnabled = "stormctrl_ucast_enabled"
//        case egressRateLimitKbpsEnabled = "egress_rate_limit_kbps_enabled"
//        case isolation
//        case taggedVlanMgmt = "tagged_vlan_mgmt"
//        case portIdx = "port_idx"
//        case stormctrlBcastEnabled = "stormctrl_bcast_enabled"
//        case voiceNetworkconfId = "voice_networkconf_id"
//        case stpPortMode = "stp_port_mode"
//        case portKeepaliveEnabled = "port_keepalive_enabled"
//        case stormctrlMcastRate = "stormctrl_mcast_rate"
//        case nativeNetworkconfId = "native_networkconf_id"
//        case name
//        case portSecurityMacAddress = "port_security_mac_address"
//        case autoneg
//        case lldpmedEnabled = "lldpmed_enabled"
//        case excludedNetworkconfIDS = "excluded_networkconf_ids"
//    }
//}
//
//// MARK: - RadioTable
//struct RadioTable: Codable {
//    let antennaGain: Int
//    let builtinAntenna: Bool
//    let vwireEnabled, is11Be: Bool?
//    let channel: Channel
//    let maxTxpower: Int
//    let channelOptimizationEnabled: Bool
//    let minRssiEnabled: Bool?
//    let builtinAntGain: Int
//    let is11AC: Bool
//    let ht: Int
//    let radio: Radio
//    let nss: Int
//    let txPowerMode: String
//    let is11Ax: Bool
//    let name: String
//    let minTxpower, radioCaps, antennaID, radioCaps2: Int
//    let currentAntennaGain: Int
//    let hasEht240, hasDFS, hasHt160, hasFccdfs: Bool?
//    let hasEht320: Bool?
//    let txPower: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case antennaGain = "antenna_gain"
//        case builtinAntenna = "builtin_antenna"
//        case vwireEnabled = "vwire_enabled"
//        case is11Be = "is_11be"
//        case channel
//        case maxTxpower = "max_txpower"
//        case channelOptimizationEnabled = "channel_optimization_enabled"
//        case minRssiEnabled = "min_rssi_enabled"
//        case builtinAntGain = "builtin_ant_gain"
//        case is11AC = "is_11ac"
//        case ht, radio, nss
//        case txPowerMode = "tx_power_mode"
//        case is11Ax = "is_11ax"
//        case name
//        case minTxpower = "min_txpower"
//        case radioCaps = "radio_caps"
//        case antennaID = "antenna_id"
//        case radioCaps2 = "radio_caps2"
//        case currentAntennaGain = "current_antenna_gain"
//        case hasEht240 = "has_eht240"
//        case hasDFS = "has_dfs"
//        case hasHt160 = "has_ht160"
//        case hasFccdfs = "has_fccdfs"
//        case hasEht320 = "has_eht320"
//        case txPower = "tx_power"
//    }
//}
//
//// MARK: - Channel
//public enum Channel: Codable {
//    case enumeration(PoeMode)
//    case integer(Int)
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(Int.self) {
//            self = .integer(x)
//            return
//        }
//        if let x = try? container.decode(PoeMode.self) {
//            self = .enumeration(x)
//            return
//        }
//        throw DecodingError.typeMismatch(Channel.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Channel"))
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .enumeration(let x):
//            try container.encode(x)
//        case .integer(let x):
//            try container.encode(x)
//        }
//    }
//}
//
//// MARK: - Operation Mode
//public enum OpMode: String, Codable {
//    case opModeSwitch = "switch"
//}
//
//// MARK: - Forward
//public enum Forward: String, Codable {
//    case all = "all"
//    case customize = "customize"
//}
//
//// MARK: - PoeMode
//public enum PoeMode: String, Codable {
//    case auto = "auto"
//}
//
//// MARK: - EthernetTable
//public struct EthernetTable: Codable {
//    let numPort: Int?
//    let name: String?
//    let mac: String?
//
//    enum CodingKeys: String, CodingKey {
//        case numPort = "num_port"
//        case name
//        case mac
//    }
//}
//
//// MARK: - LastUplink
//public struct LastUplink: Codable {
//    let portIdx: Int?
//    let uplinkMac: String?
//    let uplinkRemotePort: Int?
//    let type: String?
//
//    enum CodingKeys: String, CodingKey {
//        case portIdx = "port_idx"
//        case uplinkMac = "uplink_mac"
//        case uplinkRemotePort = "uplink_remote_port"
//        case type
//    }
//}
//
//// MARK: - Etherlighting
//public struct EtherLighting: Codable {
//    let mode: String?
//    let brightness: Int?
//    let behavior: String?
//
//    enum CodingKeys: String, CodingKey {
//        case mode
//        case brightness
//        case behavior
//    }
//}
//
//// MARK: - SwitchCaps
//public struct SwitchCaps: Codable {
//    let maxAggregateSessions: Int?
//    let featureCaps: Int?
//    let etherlightCaps: Int?
//    let maxCustomIpAcls: Int?
//    let maxCustomMacAcls: Int?
//    let maxGlobalAcls: Int?
//    let maxReservedRoutes: Int?
//    let vlanCaps: Int?
//    let maxVlanCount: Int?
//    let maxStaticRoutes: Int?
//    let maxMirrorSessions: Int?
//    let maxL3Intf: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case maxAggregateSessions = "max_aggregate_sessions"
//        case featureCaps = "feature_caps"
//        case etherlightCaps = "etherlight_caps"
//        case maxCustomIpAcls = "max_custom_ip_acls"
//        case maxCustomMacAcls = "max_custom_mac_acls"
//        case maxGlobalAcls = "max_global_acls"
//        case maxReservedRoutes = "max_reserved_routes"
//        case vlanCaps = "vlan_caps"
//        case maxVlanCount = "max_vlan_count"
//        case maxStaticRoutes = "max_static_routes"
//        case maxMirrorSessions = "max_mirror_sessions"
//        case maxL3Intf = "max_l3_intf"
//    }
//}
//
//// MARK: - UplinkModel
//public struct UplinkModel: Codable {
//    let ip: String?
//    let mac: String?
//    let name: String?
//    let netmask: String?
//    let numPort: Int?
//    let rxBytes: Int?
//    let rxDropped: Int?
//    let rxErrors: Int?
//    let rxMulticast: Int?
//    let rxPackets: Int?
//    let txBytes: Int?
//    let txDropped: Int?
//    let txErrors: Int?
//    let txPackets: Int?
//    let portIdx: Int?
//    let media: String?
//    let fullDuplex: Bool?
//    let speed: Int?
//    let maxSpeed: Int?
//    let type: String?
//    let txBytesR: Double?
//    let rxBytesR: Double?
//    let uplinkSource: String?
//
//    enum CodingKeys: String, CodingKey {
//        case ip
//        case mac
//        case name
//        case netmask
//        case numPort = "num_port"
//        case rxBytes = "rx_bytes"
//        case rxDropped = "rx_dropped"
//        case rxErrors = "rx_errors"
//        case rxMulticast = "rx_multicast"
//        case rxPackets = "rx_packets"
//        case txBytes = "tx_bytes"
//        case txDropped = "tx_dropped"
//        case txErrors = "tx_errors"
//        case txPackets = "tx_packets"
//        case portIdx = "port_idx"
//        case media
//        case fullDuplex = "full_duplex"
//        case speed
//        case maxSpeed = "max_speed"
//        case type
//        case txBytesR = "tx_bytes-r"
//        case rxBytesR = "rx_bytes-r"
//        case uplinkSource = "uplink_source"
//    }
//}
//
//// MARK: - SysStats
//public struct SysStats: Codable {
//    let loadavg1: String?
//    let loadavg15: String?
//    let loadavg5: String?
//    let memBuffer: Int?
//    let memTotal: Int?
//    let memUsed: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case loadavg1 = "loadavg_1"
//        case loadavg15 = "loadavg_15"
//        case loadavg5 = "loadavg_5"
//        case memBuffer = "mem_buffer"
//        case memTotal = "mem_total"
//        case memUsed = "mem_used"
//    }
//}
//
//// MARK: - SystemStats
//public struct SystemStats: Codable {
//    let cpu: String?
//    let mem: String?
//    let uptime: String?
//
//    enum CodingKeys: String, CodingKey {
//        case cpu
//        case mem
//        case uptime
//    }
//}
//
//// MARK: - LldpTable
//public struct LldpTable: Codable {
//    let chassisId: String?
//    let isWired: Bool?
//    let localPortIdx: Int?
//    let localPortName: String?
//    let portId: String?
//
//    enum CodingKeys: String, CodingKey {
//        case chassisId = "chassis_id"
//        case isWired = "is_wired"
//        case localPortIdx = "local_port_idx"
//        case localPortName = "local_port_name"
//        case portId = "port_id"
//    }
//}
//
//// MARK: - DownlinkTable
//public struct DownlinkTable: Codable {
//    let mac: String?
//    let portIdx: Int?
//    let speed: Int?
//    let fullDuplex: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case mac
//        case portIdx = "port_idx"
//        case speed
//        case fullDuplex = "full_duplex"
//    }
//}
//
//// MARK: - DetailedStates
//public struct DetailedStates: Codable {
//    let deviceNearPowerLimit: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case deviceNearPowerLimit = "device_near_power_limit"
//    }
//}
//
//// MARK: - XTCPStats
//struct XTCPStats: Codable {
//    let goodbytes, latAvg, latMax, latMin: Int
//    let latSamples, latSum, retries, stalls: Int
//
//    enum CodingKeys: String, CodingKey {
//        case goodbytes
//        case latAvg = "lat_avg"
//        case latMax = "lat_max"
//        case latMin = "lat_min"
//        case latSamples = "lat_samples"
//        case latSum = "lat_sum"
//        case retries, stalls
//    }
//}
//
//// MARK: - Usage aka User
//public enum Usage: String, Codable {
//    case user = "user"
//}
//
//// MARK: - WifiTxLatencyMOV
//struct WifiTxLatencyMOV: Codable {
//    let avg, max, min, total: Int
//    let totalCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case avg, max, min, total
//        case totalCount = "total_count"
//    }
//}
//
//// MARK: - VwireVapTable
//public struct VwireVapTable: Codable {
//    let state: State
//    let radio: Radio
//    let radioName, bssid: String
//
//    enum CodingKeys: String, CodingKey {
//        case state, radio
//        case radioName = "radio_name"
//        case bssid
//    }
//}
//
//// MARK: - Stat
//public struct Stat: Codable {
//    let sw: Switch?
//
//    enum CodingKeys: String, CodingKey {
//        case sw
//    }
//}
//
//// MARK: - State
//public enum State: String, Codable {
//    case run = "RUN"
//}
//
//enum Radio: String, Codable {
//    case na = "na"
//    case ng = "ng"
//    case the6E = "6e"
//}
//
//// MARK: - Uplink
//struct Uplink: Codable {
//    let ip: String?
//    let mac, name: String
//    let netmask: String?
//    let numPort, rxBytes, rxDropped, rxErrors: Int
//    let rxMulticast, rxPackets, txBytes, txDropped: Int
//    let txErrors, txPackets, portIdx: Int
//    let media: Media?
//    let fullDuplex: Bool
//    let speed, maxSpeed: Int
//    let type: String
//    let txBytesR, rxBytesR: Double
//    let uplinkSource: String
//    let uplinkMAC: String?
//    let uplinkRemotePort: Int?
//    let uplinkDeviceName: String?
//    let lagMember, up: Bool?
//    let uplinkPortPoeCaps: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case ip, mac, name, netmask
//        case numPort = "num_port"
//        case rxBytes = "rx_bytes"
//        case rxDropped = "rx_dropped"
//        case rxErrors = "rx_errors"
//        case rxMulticast = "rx_multicast"
//        case rxPackets = "rx_packets"
//        case txBytes = "tx_bytes"
//        case txDropped = "tx_dropped"
//        case txErrors = "tx_errors"
//        case txPackets = "tx_packets"
//        case portIdx = "port_idx"
//        case media
//        case fullDuplex = "full_duplex"
//        case speed
//        case maxSpeed = "max_speed"
//        case type
//        case txBytesR = "tx_bytes-r"
//        case rxBytesR = "rx_bytes-r"
//        case uplinkSource = "uplink_source"
//        case uplinkMAC = "uplink_mac"
//        case uplinkRemotePort = "uplink_remote_port"
//        case uplinkDeviceName = "uplink_device_name"
//        case lagMember = "lag_member"
//        case up
//        case uplinkPortPoeCaps = "uplink_port_poe_caps"
//    }
//}
//
//// MARK: - Switch
//public struct Switch: Codable {
//    let siteID: String
//    let o, oid, sw: String
//    let time: Int
//    let datetime: Date
//    let rxPackets, rxBytes, rxErrors, rxDropped: Int
//    let rxCrypts, rxFrags, txPackets, txBytes: Int
//    let txErrors, txDropped, txRetries, rxMulticast: Int
//    let rxBroadcast, txMulticast, txBroadcast, bytes: Int
//    let duration: Int
//    let port4TxPackets, port4TxBytes, port4TxMulticast, port4TxBroadcast: Int?
//    let port6TxPackets, port6TxBytes, port6TxMulticast, port6TxBroadcast: Int?
//    let port7RxPackets, port7RxBytes, port7TxPackets, port7TxBytes: Int
//    let port7RxBroadcast, port7TxMulticast, port7TxBroadcast: Int
//    let port8RxPackets, port8RxBytes, port8TxPackets, port8TxBytes: Int?
//    let port8TxMulticast, port8TxBroadcast, port9RxPackets, port9RxBytes: Int?
//    let port9TxPackets, port9TxBytes, port9RxMulticast, port9RxBroadcast: Int?
//    let port9TxMulticast, port9TxBroadcast, port12RxPackets, port12RxBytes: Int?
//    let port12TxPackets, port12TxBytes, port12RxMulticast, port12RxBroadcast: Int?
//    let port12TxMulticast, port12TxBroadcast, port13RxPackets, port13RxBytes: Int?
//    let port13TxPackets, port13TxBytes, port13RxMulticast, port13RxBroadcast: Int?
//    let port13TxMulticast, port13TxBroadcast: Int?
//    let port15RxPackets, port15RxBytes, port15TxPackets, port15TxBytes: Int
//    let port15RxMulticast, port15RxBroadcast, port15TxMulticast, port15TxBroadcast: Int
//    let port16RxPackets, port16RxBytes, port16TxPackets, port16TxBytes: Int
//    let port16RxMulticast, port16TxMulticast, port16TxBroadcast: Int
//    let port17RxPackets, port17RxBytes, port17TxPackets, port17TxBytes: Int?
//    let port17RxBroadcast, port17TxMulticast, port17TxBroadcast, port4RxPackets: Int?
//    let port4RxBytes, port4RxMulticast, port6RxPackets, port6RxBytes: Int?
//    let port6RxBroadcast, port6RxMulticast, port8RxMulticast, port17RxMulticast: Int?
//    let port4RxBroadcast: Int?
//    let port7RxMulticast, port16RxBroadcast: Int
//    let port17RxErrors, port3RxPackets, port3RxBytes, port3TxPackets: Int?
//    let port3TxBytes, port3TxMulticast, port3TxBroadcast, port14TxPackets: Int?
//    let port14TxBytes, port14TxMulticast, port14TxBroadcast, port14RxPackets: Int?
//    let port14RxBytes, port14RxMulticast, port14RxBroadcast, port3RxBroadcast: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case siteID = "site_id"
//        case o, oid, sw, time, datetime
//        case rxPackets = "rx_packets"
//        case rxBytes = "rx_bytes"
//        case rxErrors = "rx_errors"
//        case rxDropped = "rx_dropped"
//        case rxCrypts = "rx_crypts"
//        case rxFrags = "rx_frags"
//        case txPackets = "tx_packets"
//        case txBytes = "tx_bytes"
//        case txErrors = "tx_errors"
//        case txDropped = "tx_dropped"
//        case txRetries = "tx_retries"
//        case rxMulticast = "rx_multicast"
//        case rxBroadcast = "rx_broadcast"
//        case txMulticast = "tx_multicast"
//        case txBroadcast = "tx_broadcast"
//        case bytes, duration
//        case port4TxPackets = "port_4-tx_packets"
//        case port4TxBytes = "port_4-tx_bytes"
//        case port4TxMulticast = "port_4-tx_multicast"
//        case port4TxBroadcast = "port_4-tx_broadcast"
//        case port6TxPackets = "port_6-tx_packets"
//        case port6TxBytes = "port_6-tx_bytes"
//        case port6TxMulticast = "port_6-tx_multicast"
//        case port6TxBroadcast = "port_6-tx_broadcast"
//        case port7RxPackets = "port_7-rx_packets"
//        case port7RxBytes = "port_7-rx_bytes"
//        case port7TxPackets = "port_7-tx_packets"
//        case port7TxBytes = "port_7-tx_bytes"
//        case port7RxBroadcast = "port_7-rx_broadcast"
//        case port7TxMulticast = "port_7-tx_multicast"
//        case port7TxBroadcast = "port_7-tx_broadcast"
//        case port8RxPackets = "port_8-rx_packets"
//        case port8RxBytes = "port_8-rx_bytes"
//        case port8TxPackets = "port_8-tx_packets"
//        case port8TxBytes = "port_8-tx_bytes"
//        case port8TxMulticast = "port_8-tx_multicast"
//        case port8TxBroadcast = "port_8-tx_broadcast"
//        case port9RxPackets = "port_9-rx_packets"
//        case port9RxBytes = "port_9-rx_bytes"
//        case port9TxPackets = "port_9-tx_packets"
//        case port9TxBytes = "port_9-tx_bytes"
//        case port9RxMulticast = "port_9-rx_multicast"
//        case port9RxBroadcast = "port_9-rx_broadcast"
//        case port9TxMulticast = "port_9-tx_multicast"
//        case port9TxBroadcast = "port_9-tx_broadcast"
//        case port12RxPackets = "port_12-rx_packets"
//        case port12RxBytes = "port_12-rx_bytes"
//        case port12TxPackets = "port_12-tx_packets"
//        case port12TxBytes = "port_12-tx_bytes"
//        case port12RxMulticast = "port_12-rx_multicast"
//        case port12RxBroadcast = "port_12-rx_broadcast"
//        case port12TxMulticast = "port_12-tx_multicast"
//        case port12TxBroadcast = "port_12-tx_broadcast"
//        case port13RxPackets = "port_13-rx_packets"
//        case port13RxBytes = "port_13-rx_bytes"
//        case port13TxPackets = "port_13-tx_packets"
//        case port13TxBytes = "port_13-tx_bytes"
//        case port13RxMulticast = "port_13-rx_multicast"
//        case port13RxBroadcast = "port_13-rx_broadcast"
//        case port13TxMulticast = "port_13-tx_multicast"
//        case port13TxBroadcast = "port_13-tx_broadcast"
//        case port15RxPackets = "port_15-rx_packets"
//        case port15RxBytes = "port_15-rx_bytes"
//        case port15TxPackets = "port_15-tx_packets"
//        case port15TxBytes = "port_15-tx_bytes"
//        case port15RxMulticast = "port_15-rx_multicast"
//        case port15RxBroadcast = "port_15-rx_broadcast"
//        case port15TxMulticast = "port_15-tx_multicast"
//        case port15TxBroadcast = "port_15-tx_broadcast"
//        case port16RxPackets = "port_16-rx_packets"
//        case port16RxBytes = "port_16-rx_bytes"
//        case port16TxPackets = "port_16-tx_packets"
//        case port16TxBytes = "port_16-tx_bytes"
//        case port16RxMulticast = "port_16-rx_multicast"
//        case port16TxMulticast = "port_16-tx_multicast"
//        case port16TxBroadcast = "port_16-tx_broadcast"
//        case port17RxPackets = "port_17-rx_packets"
//        case port17RxBytes = "port_17-rx_bytes"
//        case port17TxPackets = "port_17-tx_packets"
//        case port17TxBytes = "port_17-tx_bytes"
//        case port17RxBroadcast = "port_17-rx_broadcast"
//        case port17TxMulticast = "port_17-tx_multicast"
//        case port17TxBroadcast = "port_17-tx_broadcast"
//        case port4RxPackets = "port_4-rx_packets"
//        case port4RxBytes = "port_4-rx_bytes"
//        case port4RxMulticast = "port_4-rx_multicast"
//        case port6RxPackets = "port_6-rx_packets"
//        case port6RxBytes = "port_6-rx_bytes"
//        case port6RxBroadcast = "port_6-rx_broadcast"
//        case port6RxMulticast = "port_6-rx_multicast"
//        case port8RxMulticast = "port_8-rx_multicast"
//        case port17RxMulticast = "port_17-rx_multicast"
//        case port4RxBroadcast = "port_4-rx_broadcast"
//        case port7RxMulticast = "port_7-rx_multicast"
//        case port16RxBroadcast = "port_16-rx_broadcast"
//        case port17RxErrors = "port_17-rx_errors"
//        case port3RxPackets = "port_3-rx_packets"
//        case port3RxBytes = "port_3-rx_bytes"
//        case port3TxPackets = "port_3-tx_packets"
//        case port3TxBytes = "port_3-tx_bytes"
//        case port3TxMulticast = "port_3-tx_multicast"
//        case port3TxBroadcast = "port_3-tx_broadcast"
//        case port14TxPackets = "port_14-tx_packets"
//        case port14TxBytes = "port_14-tx_bytes"
//        case port14TxMulticast = "port_14-tx_multicast"
//        case port14TxBroadcast = "port_14-tx_broadcast"
//        case port14RxPackets = "port_14-rx_packets"
//        case port14RxBytes = "port_14-rx_bytes"
//        case port14RxMulticast = "port_14-rx_multicast"
//        case port14RxBroadcast = "port_14-rx_broadcast"
//        case port3RxBroadcast = "port_3-rx_broadcast"
//    }
//}
//

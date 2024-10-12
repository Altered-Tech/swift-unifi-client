//
//  Device.swift
//  Helix
//
//  Created by Michael Einreinhof on 10/1/24.
//

import Foundation

extension UnifiClient {
    public func devicesBasic(site: String) async throws -> [UnifiDeviceBasic]? {
        let path = "\(basePath)/\(site)/stat/device-basic"
        do {
            let result: UnifiResponse<UnifiDeviceBasic>? = try await getData(path: path, method: .GET)
            return result?.data ?? nil
        } catch {
            unifiClientLogger.error("Failed to get devices for site \(site): \(error)")
            throw error
        }
    }
    
    public func devicesDetailed(site: String) async throws -> [UnifiDevice]? {
        let path = "\(basePath)/\(site)/stat/device"
        do {
            let result: UnifiResponse<UnifiDevice>? = try await getData(path: path, method: .GET)
            return result?.data ?? nil
        } catch {
            unifiClientLogger.error("Failed to get devices for site \(site): \(error)")
            throw error
        }
    }
}

public struct UnifiDeviceBasic: Codable {
    let mac: String
    let state: Int
    let adopted: Bool
    let disabled: Bool
    let type: String
    let model: String
    let inGatewayMode: Bool
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case mac
        case state
        case adopted
        case disabled
        case type
        case model
        case inGatewayMode = "in_gateway_mode"
        case name
    }
}

public struct UnifiDevice: Codable {
    let requiredVersion: String?
    let portTable: [PortTable]?
    let licenseState: String?
    let lcmBrightnessOverride: Bool?
    let type: String?
    let boardRev: Int?
    let setupId: String?
    let hwCaps: Int?
    let rebootDuration: Int?
    let snmpContact: String?
    let configNetwork: ConfigNetwork?
    let syslogKey: String?
    let model: String?
    let slimcfgCaps: Int?
    let manufacturerId: Int?
    let sysid: Int?
    let ip: String?
    let fw2Caps: Int?
    let jumboframeEnabled: Bool?
    let lastConnectionNetworkName: String?
    let shortname: String?
    let version: String?
    let adoptionCompleted: Bool?
    let unsupportedReason: Int?
    let anonId: String?
    let stpVersion: String?
    let lastConnectionNetworkId: String?
    let siteId: String?
    let adoptedAt: Int?
    let name: String?
    let fwCaps: Int?
    let lcmBrightness: Int?
    let Id: String?
    let internet: Bool?
    let mgmtNetworkId: String?
    let gatewayMac: String?
    let stpPriority: String?
    let lcmNightModeBegins: String?
    let twoPhaseAdopt: Bool?
    let portOverrides: [PortOverrides]?
    let informIp: String?
    let cfgversion: String?
    let mac: String?
    let provisionedAt: Int?
    let informUrl: String?
    let upgradeDuration: Int?
    let ethernetTable: [EthernetTable]?
    let flowctrlEnabled: Bool?
    let unsupported: Bool?
    let bleCaps: Int?
    let sysErrorCaps: Int?
    let dot1xPortctrlEnabled: Bool?
    let lastUplink: LastUplink?
    let etherLighting: EtherLighting?
    let disconnectedAt: Int?
    let architecture: String?
    let xAesGcm: Bool?
    let hasFan: Bool?
    let modelIncompatible: Bool?
    let xAuthkey: String?
    let xSshHostkeyFingerprint: String?
    let satisfaction: Int?
    let modelInEol: Bool?
    let anomalies: Int?
    let hasTemperature: Bool?
    let switchCaps: SwitchCaps?
    let adoptedByClient: String?
    let snmpLocation: String?
    let modelInLts: Bool?
    let kernelVersion: String?
    let serial: String?
    let powerSourceCtrlEnabled: Bool?
    let lcmNightModeEnds: String?
    let adopted: Bool?
    let hashId: String?
    let deviceId: String?
    let uplink: UplinkModel?
    let state: Int?
    let startDisconnectedMillis: Int?
    let credentialCaps: Int?
    let standard: Bool?
    let discoveredVia: String?
    let adoptIp: String?
    let adoptUrl: String?
    let xAdoptUsername: String?
    let xAdoptPassword: String?
    let adoptState: Int?
    let adoptTries: Int?
    let lastSeen: Int?
    let minInformIntervalSeconds: Int?
    let upgradable: Bool?
    let adoptableWhenUpgraded: Bool?
    let rollupgrade: Bool?
    let knownCfgversion: String?
    let uptime: Int?
    let Uptime: Int?
    let locating: Bool?
    let startConnectedMillis: Int?
    let prevNonBusyState: Int?
    let nextInterval: Int?
    let connectRequestIp: String?
    let connectRequestPort: String?
    let sysStats: SysStats?
    let systemStats: SystemStats?
    let sshSessionTable: [String]?
    let lldpTable: [LldpTable]?
    let displayableVersion: String?
    let connectionNetworkId: String?
    let connectionNetworkName: String?
    let startupTimestamp: Int?
    let isAccessPoint: Bool?
    let safeForAutoupgrade: Bool?
    let generalTemperature: Int?
    let overheating: Bool?
    let totalMaxPower: Int?
    let downlinkTable: [DownlinkTable]?
    let uplinkDepth: Int?
    let downlinkLldpMacs: [String]?
    let dhcpServerTable: [String]?
    let totalUsedPower: Double?
    let detailedStates: DetailedStates?
    let stat: Stat?
    let txBytes: Int?
    let rxBytes: Int?
    let bytes: Int?
    let numSta: Int?
    let userNumSta: Int?
    let guestNumSta: Int?
    let xHasSshHostkey: Bool?

    enum CodingKeys: String, CodingKey {
        case requiredVersion = "required_version"
        case portTable = "port_table"
        case licenseState = "license_state"
        case lcmBrightnessOverride = "lcm_brightness_override"
        case type
        case boardRev = "board_rev"
        case setupId = "setup_id"
        case hwCaps = "hw_caps"
        case rebootDuration = "reboot_duration"
        case snmpContact = "snmp_contact"
        case configNetwork = "config_network"
        case syslogKey = "syslog_key"
        case model
        case slimcfgCaps = "slimcfg_caps"
        case manufacturerId = "manufacturer_id"
        case sysid
        case ip
        case fw2Caps = "fw2_caps"
        case jumboframeEnabled = "jumboframe_enabled"
        case lastConnectionNetworkName = "last_connection_network_name"
        case shortname
        case version
        case adoptionCompleted = "adoption_completed"
        case unsupportedReason = "unsupported_reason"
        case anonId = "anon_id"
        case stpVersion = "stp_version"
        case lastConnectionNetworkId = "last_connection_network_id"
        case siteId = "site_id"
        case adoptedAt = "adopted_at"
        case name
        case fwCaps = "fw_caps"
        case lcmBrightness = "lcm_brightness"
        case Id = "_id"
        case internet
        case mgmtNetworkId = "mgmt_network_id"
        case gatewayMac = "gateway_mac"
        case stpPriority = "stp_priority"
        case lcmNightModeBegins = "lcm_night_mode_begins"
        case twoPhaseAdopt = "two_phase_adopt"
        case portOverrides = "port_overrides"
        case informIp = "inform_ip"
        case cfgversion
        case mac
        case provisionedAt = "provisioned_at"
        case informUrl = "inform_url"
        case upgradeDuration = "upgrade_duration"
        case ethernetTable = "ethernet_table"
        case flowctrlEnabled = "flowctrl_enabled"
        case unsupported
        case bleCaps = "ble_caps"
        case sysErrorCaps = "sys_error_caps"
        case dot1xPortctrlEnabled = "dot1x_portctrl_enabled"
        case lastUplink = "last_uplink"
        case etherLighting = "ether_lighting"
        case disconnectedAt = "disconnected_at"
        case architecture
        case xAesGcm = "x_aes_gcm"
        case hasFan = "has_fan"
        case modelIncompatible = "model_incompatible"
        case xAuthkey = "x_authkey"
        case xSshHostkeyFingerprint = "x_ssh_hostkey_fingerprint"
        case satisfaction
        case modelInEol = "model_in_eol"
        case anomalies
        case hasTemperature = "has_temperature"
        case switchCaps = "switch_caps"
        case adoptedByClient = "adopted_by_client"
        case snmpLocation = "snmp_location"
        case modelInLts = "model_in_lts"
        case kernelVersion = "kernel_version"
        case serial
        case powerSourceCtrlEnabled = "power_source_ctrl_enabled"
        case lcmNightModeEnds = "lcm_night_mode_ends"
        case adopted
        case hashId = "hash_id"
        case deviceId = "device_id"
        case uplink
        case state
        case startDisconnectedMillis = "start_disconnected_millis"
        case credentialCaps = "credential_caps"
        case standard
        case discoveredVia = "discovered_via"
        case adoptIp = "adopt_ip"
        case adoptUrl = "adopt_url"
        case xAdoptUsername = "x_adopt_username"
        case xAdoptPassword = "x_adopt_password"
        case adoptState = "adopt_state"
        case adoptTries = "adopt_tries"
        case lastSeen = "last_seen"
        case minInformIntervalSeconds = "min_inform_interval_seconds"
        case upgradable
        case adoptableWhenUpgraded = "adoptable_when_upgraded"
        case rollupgrade
        case knownCfgversion = "known_cfgversion"
        case uptime
        case Uptime = "_uptime"
        case locating
        case startConnectedMillis = "start_connected_millis"
        case prevNonBusyState = "prev_non_busy_state"
        case nextInterval = "next_interval"
        case connectRequestIp = "connect_request_ip"
        case connectRequestPort = "connect_request_port"
        case sysStats = "sys_stats"
        case systemStats = "system-stats"
        case sshSessionTable = "ssh_session_table"
        case lldpTable = "lldp_table"
        case displayableVersion = "displayable_version"
        case connectionNetworkId = "connection_network_id"
        case connectionNetworkName = "connection_network_name"
        case startupTimestamp = "startup_timestamp"
        case isAccessPoint = "is_access_point"
        case safeForAutoupgrade = "safe_for_autoupgrade"
        case generalTemperature = "general_temperature"
        case overheating
        case totalMaxPower = "total_max_power"
        case downlinkTable = "downlink_table"
        case uplinkDepth = "uplink_depth"
        case downlinkLldpMacs = "downlink_lldp_macs"
        case dhcpServerTable = "dhcp_server_table"
        case totalUsedPower = "total_used_power"
        case detailedStates = "detailed_states"
        case stat
        case txBytes = "tx_bytes"
        case rxBytes = "rx_bytes"
        case bytes
        case numSta = "num_sta"
        case userNumSta = "user-num_sta"
        case guestNumSta = "guest-num_sta"
        case xHasSshHostkey = "x_has_ssh_hostkey"
    }
}

public struct PortTable: Codable {
    let portIdx: Int?
    let media: String?
    let portPoe: Bool?
    let poeCaps: Int?
    let speedCaps: Int?
    let opMode: String?
    let forward: String?
    let poeMode: String?
    let autoneg: Bool?
    let dot1xMode: String?
    let dot1xStatus: String?
    let enable: Bool?
    let flowctrlRx: Bool?
    let flowctrlTx: Bool?
    let fullDuplex: Bool?
    let isUplink: Bool?
    let jumbo: Bool?
    let macTableCount: Int?
    let poeClass: String?
    let poeCurrent: String?
    let poeEnable: Bool?
    let poeGood: Bool?
    let poePower: String?
    let poeVoltage: String?
    let rxBroadcast: Int?
    let rxBytes: Int?
    let rxDropped: Int?
    let rxErrors: Int?
    let rxMulticast: Int?
    let rxPackets: Int?
    let satisfaction: Int?
    let satisfactionReason: Int?
    let speed: Int?
    let stpPathcost: Int?
    let stpState: String?
    let txBroadcast: Int?
    let txBytes: Int?
    let txDropped: Int?
    let txErrors: Int?
    let txMulticast: Int?
    let txPackets: Int?
    let up: Bool?
    let txBytesR: Double?
    let rxBytesR: Double?
    let bytesR: Double?
    let settingPreference: String?
    let portSecurityEnabled: Bool?
    let stormctrlUcastRate: Int?
    let stormctrlBcastRate: Int?
    let stormctrlMcastEnabled: Bool?
    let stormctrlUcastEnabled: Bool?
    let egressRateLimitKbpsEnabled: Bool?
    let isolation: Bool?
    let taggedVlanMgmt: String?
    let stormctrlBcastEnabled: Bool?
    let voiceNetworkconfId: String?
    let stpPortMode: Bool?
    let portKeepaliveEnabled: Bool?
    let stormctrlMcastRate: Int?
    let nativeNetworkconfId: String?
    let name: String?
    let portSecurityMacAddress: [String]?
    let lldpmedEnabled: Bool?
    let masked: Bool?
    let aggregatedBy: Bool?
    let locating: Bool?

    enum CodingKeys: String, CodingKey {
        case portIdx = "port_idx"
        case media
        case portPoe = "port_poe"
        case poeCaps = "poe_caps"
        case speedCaps = "speed_caps"
        case opMode = "op_mode"
        case forward
        case poeMode = "poe_mode"
        case autoneg
        case dot1xMode = "dot1x_mode"
        case dot1xStatus = "dot1x_status"
        case enable
        case flowctrlRx = "flowctrl_rx"
        case flowctrlTx = "flowctrl_tx"
        case fullDuplex = "full_duplex"
        case isUplink = "is_uplink"
        case jumbo
        case macTableCount = "mac_table_count"
        case poeClass = "poe_class"
        case poeCurrent = "poe_current"
        case poeEnable = "poe_enable"
        case poeGood = "poe_good"
        case poePower = "poe_power"
        case poeVoltage = "poe_voltage"
        case rxBroadcast = "rx_broadcast"
        case rxBytes = "rx_bytes"
        case rxDropped = "rx_dropped"
        case rxErrors = "rx_errors"
        case rxMulticast = "rx_multicast"
        case rxPackets = "rx_packets"
        case satisfaction
        case satisfactionReason = "satisfaction_reason"
        case speed
        case stpPathcost = "stp_pathcost"
        case stpState = "stp_state"
        case txBroadcast = "tx_broadcast"
        case txBytes = "tx_bytes"
        case txDropped = "tx_dropped"
        case txErrors = "tx_errors"
        case txMulticast = "tx_multicast"
        case txPackets = "tx_packets"
        case up
        case txBytesR = "tx_bytes-r"
        case rxBytesR = "rx_bytes-r"
        case bytesR = "bytes-r"
        case settingPreference = "setting_preference"
        case portSecurityEnabled = "port_security_enabled"
        case stormctrlUcastRate = "stormctrl_ucast_rate"
        case stormctrlBcastRate = "stormctrl_bcast_rate"
        case stormctrlMcastEnabled = "stormctrl_mcast_enabled"
        case stormctrlUcastEnabled = "stormctrl_ucast_enabled"
        case egressRateLimitKbpsEnabled = "egress_rate_limit_kbps_enabled"
        case isolation
        case taggedVlanMgmt = "tagged_vlan_mgmt"
        case stormctrlBcastEnabled = "stormctrl_bcast_enabled"
        case voiceNetworkconfId = "voice_networkconf_id"
        case stpPortMode = "stp_port_mode"
        case portKeepaliveEnabled = "port_keepalive_enabled"
        case stormctrlMcastRate = "stormctrl_mcast_rate"
        case nativeNetworkconfId = "native_networkconf_id"
        case name
        case portSecurityMacAddress = "port_security_mac_address"
        case lldpmedEnabled = "lldpmed_enabled"
        case masked
        case aggregatedBy = "aggregated_by"
        case locating
    }
}



public struct ConfigNetwork: Codable {
    let type: String?
    let bondingEnabled: Bool?

    enum CodingKeys: String, CodingKey {
        case type
        case bondingEnabled = "bonding_enabled"
    }
}



public struct PortOverrides: Codable {
    let settingPreference: String?
    let opMode: String?
    let portSecurityEnabled: Bool?
    let poeMode: String?
    let stormctrlUcastRate: Int?
    let forward: String?
    let stormctrlBcastRate: Int?
    let stormctrlMcastEnabled: Bool?
    let stormctrlUcastEnabled: Bool?
    let egressRateLimitKbpsEnabled: Bool?
    let isolation: Bool?
    let taggedVlanMgmt: String?
    let portIdx: Int?
    let stormctrlBcastEnabled: Bool?
    let voiceNetworkconfId: String?
    let stpPortMode: Bool?
    let portKeepaliveEnabled: Bool?
    let stormctrlMcastRate: Int?
    let nativeNetworkconfId: String?
    let name: String?
    let portSecurityMacAddress: [String]?
    let autoneg: Bool?
    let lldpmedEnabled: Bool?

    enum CodingKeys: String, CodingKey {
        case settingPreference = "setting_preference"
        case opMode = "op_mode"
        case portSecurityEnabled = "port_security_enabled"
        case poeMode = "poe_mode"
        case stormctrlUcastRate = "stormctrl_ucast_rate"
        case forward
        case stormctrlBcastRate = "stormctrl_bcast_rate"
        case stormctrlMcastEnabled = "stormctrl_mcast_enabled"
        case stormctrlUcastEnabled = "stormctrl_ucast_enabled"
        case egressRateLimitKbpsEnabled = "egress_rate_limit_kbps_enabled"
        case isolation
        case taggedVlanMgmt = "tagged_vlan_mgmt"
        case portIdx = "port_idx"
        case stormctrlBcastEnabled = "stormctrl_bcast_enabled"
        case voiceNetworkconfId = "voice_networkconf_id"
        case stpPortMode = "stp_port_mode"
        case portKeepaliveEnabled = "port_keepalive_enabled"
        case stormctrlMcastRate = "stormctrl_mcast_rate"
        case nativeNetworkconfId = "native_networkconf_id"
        case name
        case portSecurityMacAddress = "port_security_mac_address"
        case autoneg
        case lldpmedEnabled = "lldpmed_enabled"
    }
}



public struct EthernetTable: Codable {
    let numPort: Int?
    let name: String?
    let mac: String?

    enum CodingKeys: String, CodingKey {
        case numPort = "num_port"
        case name
        case mac
    }
}



public struct LastUplink: Codable {
    let portIdx: Int?
    let uplinkMac: String?
    let uplinkRemotePort: Int?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case portIdx = "port_idx"
        case uplinkMac = "uplink_mac"
        case uplinkRemotePort = "uplink_remote_port"
        case type
    }
}



public struct EtherLighting: Codable {
    let mode: String?
    let brightness: Int?
    let behavior: String?

    enum CodingKeys: String, CodingKey {
        case mode
        case brightness
        case behavior
    }
}



public struct SwitchCaps: Codable {
    let maxAggregateSessions: Int?
    let featureCaps: Int?
    let etherlightCaps: Int?
    let maxCustomIpAcls: Int?
    let maxCustomMacAcls: Int?
    let maxGlobalAcls: Int?
    let maxReservedRoutes: Int?
    let vlanCaps: Int?
    let maxVlanCount: Int?
    let maxStaticRoutes: Int?
    let maxMirrorSessions: Int?
    let maxL3Intf: Int?

    enum CodingKeys: String, CodingKey {
        case maxAggregateSessions = "max_aggregate_sessions"
        case featureCaps = "feature_caps"
        case etherlightCaps = "etherlight_caps"
        case maxCustomIpAcls = "max_custom_ip_acls"
        case maxCustomMacAcls = "max_custom_mac_acls"
        case maxGlobalAcls = "max_global_acls"
        case maxReservedRoutes = "max_reserved_routes"
        case vlanCaps = "vlan_caps"
        case maxVlanCount = "max_vlan_count"
        case maxStaticRoutes = "max_static_routes"
        case maxMirrorSessions = "max_mirror_sessions"
        case maxL3Intf = "max_l3_intf"
    }
}



public struct UplinkModel: Codable {
    let ip: String?
    let mac: String?
    let name: String?
    let netmask: String?
    let numPort: Int?
    let rxBytes: Int?
    let rxDropped: Int?
    let rxErrors: Int?
    let rxMulticast: Int?
    let rxPackets: Int?
    let txBytes: Int?
    let txDropped: Int?
    let txErrors: Int?
    let txPackets: Int?
    let portIdx: Int?
    let media: String?
    let fullDuplex: Bool?
    let speed: Int?
    let maxSpeed: Int?
    let type: String?
    let txBytesR: Double?
    let rxBytesR: Double?
    let uplinkSource: String?

    enum CodingKeys: String, CodingKey {
        case ip
        case mac
        case name
        case netmask
        case numPort = "num_port"
        case rxBytes = "rx_bytes"
        case rxDropped = "rx_dropped"
        case rxErrors = "rx_errors"
        case rxMulticast = "rx_multicast"
        case rxPackets = "rx_packets"
        case txBytes = "tx_bytes"
        case txDropped = "tx_dropped"
        case txErrors = "tx_errors"
        case txPackets = "tx_packets"
        case portIdx = "port_idx"
        case media
        case fullDuplex = "full_duplex"
        case speed
        case maxSpeed = "max_speed"
        case type
        case txBytesR = "tx_bytes-r"
        case rxBytesR = "rx_bytes-r"
        case uplinkSource = "uplink_source"
    }
}



public struct SysStats: Codable {
    let loadavg1: String?
    let loadavg15: String?
    let loadavg5: String?
    let memBuffer: Int?
    let memTotal: Int?
    let memUsed: Int?

    enum CodingKeys: String, CodingKey {
        case loadavg1 = "loadavg_1"
        case loadavg15 = "loadavg_15"
        case loadavg5 = "loadavg_5"
        case memBuffer = "mem_buffer"
        case memTotal = "mem_total"
        case memUsed = "mem_used"
    }
}



public struct SystemStats: Codable {
    let cpu: String?
    let mem: String?
    let uptime: String?

    enum CodingKeys: String, CodingKey {
        case cpu
        case mem
        case uptime
    }
}



public struct LldpTable: Codable {
    let chassisId: String?
    let isWired: Bool?
    let localPortIdx: Int?
    let localPortName: String?
    let portId: String?

    enum CodingKeys: String, CodingKey {
        case chassisId = "chassis_id"
        case isWired = "is_wired"
        case localPortIdx = "local_port_idx"
        case localPortName = "local_port_name"
        case portId = "port_id"
    }
}



public struct DownlinkTable: Codable {
    let mac: String?
    let portIdx: Int?
    let speed: Int?
    let fullDuplex: Bool?

    enum CodingKeys: String, CodingKey {
        case mac
        case portIdx = "port_idx"
        case speed
        case fullDuplex = "full_duplex"
    }
}



public struct DetailedStates: Codable {
    let deviceNearPowerLimit: Bool?

    enum CodingKeys: String, CodingKey {
        case deviceNearPowerLimit = "device_near_power_limit"
    }
}



public struct Stat: Codable {
    let sw: Switch?

    enum CodingKeys: String, CodingKey {
        case sw
    }
}

public struct Switch: Codable {
    let siteId: String?
    let o: String?
    let oid: String?
    let sw: String?
    let time: Int?
    let datetime: String?
    let rxPackets: Int?
    let rxBytes: Int?
    let rxErrors: Double?
    let rxDropped: Double?
    let rxCrypts: Double?
    let rxFrags: Double?
    let txPackets: Double?
    let txBytes: Int?
    let txErrors: Double?
    let txDropped: Double?
    let txRetries: Double?
    let rxMulticast: Double?
    let rxBroadcast: Double?
    let txMulticast: Double?
    let txBroadcast: Double?
    let bytes: Int?
    let duration: Double?
    let port4TxPackets: Double?
    let port4TxBytes: Int?
    let port4TxMulticast: Double?
    let port4TxBroadcast: Double?
    let port6TxPackets: Double?
    let port6TxBytes: Int?
    let port6TxMulticast: Double?
    let port6TxBroadcast: Double?
    let port7RxPackets: Int?
    let port7RxBytes: Int?
    let port7TxPackets: Int?
    let port7TxBytes: Int?
    let port7RxBroadcast: Double?
    let port7TxMulticast: Double?
    let port7TxBroadcast: Double?
    let port8RxPackets: Double?
    let port8RxBytes: Double?
    let port8TxPackets: Double?
    let port8TxBytes: Int?
    let port8TxMulticast: Double?
    let port8TxBroadcast: Double?
    let port9RxPackets: Int?
    let port9RxBytes: Int?
    let port9TxPackets: Double?
    let port9TxBytes: Int?
    let port9RxMulticast: Double?
    let port9RxBroadcast: Double?
    let port9TxMulticast: Double?
    let port9TxBroadcast: Double?
    let port12RxPackets: Int?
    let port12RxBytes: Int?
    let port12TxPackets: Int?
    let port12TxBytes: Int?
    let port12RxMulticast: Double?
    let port12RxBroadcast: Double?
    let port12TxMulticast: Double?
    let port12TxBroadcast: Double?
    let port13RxPackets: Int?
    let port13RxBytes: Int?
    let port13TxPackets: Int?
    let port13TxBytes: Int?
    let port13RxMulticast: Double?
    let port13RxBroadcast: Double?
    let port13TxMulticast: Double?
    let port13TxBroadcast: Double?
    let port15RxPackets: Int?
    let port15RxBytes: Int?
    let port15TxPackets: Int?
    let port15TxBytes: Int?
    let port15RxMulticast: Double?
    let port15RxBroadcast: Double?
    let port15TxMulticast: Double?
    let port15TxBroadcast: Double?
    let port16RxPackets: Double?
    let port16RxBytes: Double?
    let port16TxPackets: Double?
    let port16TxBytes: Int?
    let port16RxMulticast: Double?
    let port16TxMulticast: Double?
    let port16TxBroadcast: Double?
    let port17RxPackets: Int?
    let port17RxBytes: Double?
    let port17TxPackets: Int?
    let port17TxBytes: Int?
    let port17RxBroadcast: Double?
    let port17TxMulticast: Double?
    let port17TxBroadcast: Double?
    let port4RxPackets: Double?
    let port4RxBytes: Double?
    let port4RxMulticast: Double?
    let port6RxPackets: Double?
    let port6RxBytes: Double?
    let port6RxBroadcast: Double?
    let port6RxMulticast: Double?
    let port8RxMulticast: Double?
    let port17RxMulticast: Double?
    let port4RxBroadcast: Double?
    let port7RxMulticast: Double?
    let port16RxBroadcast: Double?

    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case o
        case oid
        case sw
        case time
        case datetime
        case rxPackets = "rx_packets"
        case rxBytes = "rx_bytes"
        case rxErrors = "rx_errors"
        case rxDropped = "rx_dropped"
        case rxCrypts = "rx_crypts"
        case rxFrags = "rx_frags"
        case txPackets = "tx_packets"
        case txBytes = "tx_bytes"
        case txErrors = "tx_errors"
        case txDropped = "tx_dropped"
        case txRetries = "tx_retries"
        case rxMulticast = "rx_multicast"
        case rxBroadcast = "rx_broadcast"
        case txMulticast = "tx_multicast"
        case txBroadcast = "tx_broadcast"
        case bytes
        case duration
        case port4TxPackets = "port_4-tx_packets"
        case port4TxBytes = "port_4-tx_bytes"
        case port4TxMulticast = "port_4-tx_multicast"
        case port4TxBroadcast = "port_4-tx_broadcast"
        case port6TxPackets = "port_6-tx_packets"
        case port6TxBytes = "port_6-tx_bytes"
        case port6TxMulticast = "port_6-tx_multicast"
        case port6TxBroadcast = "port_6-tx_broadcast"
        case port7RxPackets = "port_7-rx_packets"
        case port7RxBytes = "port_7-rx_bytes"
        case port7TxPackets = "port_7-tx_packets"
        case port7TxBytes = "port_7-tx_bytes"
        case port7RxBroadcast = "port_7-rx_broadcast"
        case port7TxMulticast = "port_7-tx_multicast"
        case port7TxBroadcast = "port_7-tx_broadcast"
        case port8RxPackets = "port_8-rx_packets"
        case port8RxBytes = "port_8-rx_bytes"
        case port8TxPackets = "port_8-tx_packets"
        case port8TxBytes = "port_8-tx_bytes"
        case port8TxMulticast = "port_8-tx_multicast"
        case port8TxBroadcast = "port_8-tx_broadcast"
        case port9RxPackets = "port_9-rx_packets"
        case port9RxBytes = "port_9-rx_bytes"
        case port9TxPackets = "port_9-tx_packets"
        case port9TxBytes = "port_9-tx_bytes"
        case port9RxMulticast = "port_9-rx_multicast"
        case port9RxBroadcast = "port_9-rx_broadcast"
        case port9TxMulticast = "port_9-tx_multicast"
        case port9TxBroadcast = "port_9-tx_broadcast"
        case port12RxPackets = "port_12-rx_packets"
        case port12RxBytes = "port_12-rx_bytes"
        case port12TxPackets = "port_12-tx_packets"
        case port12TxBytes = "port_12-tx_bytes"
        case port12RxMulticast = "port_12-rx_multicast"
        case port12RxBroadcast = "port_12-rx_broadcast"
        case port12TxMulticast = "port_12-tx_multicast"
        case port12TxBroadcast = "port_12-tx_broadcast"
        case port13RxPackets = "port_13-rx_packets"
        case port13RxBytes = "port_13-rx_bytes"
        case port13TxPackets = "port_13-tx_packets"
        case port13TxBytes = "port_13-tx_bytes"
        case port13RxMulticast = "port_13-rx_multicast"
        case port13RxBroadcast = "port_13-rx_broadcast"
        case port13TxMulticast = "port_13-tx_multicast"
        case port13TxBroadcast = "port_13-tx_broadcast"
        case port15RxPackets = "port_15-rx_packets"
        case port15RxBytes = "port_15-rx_bytes"
        case port15TxPackets = "port_15-tx_packets"
        case port15TxBytes = "port_15-tx_bytes"
        case port15RxMulticast = "port_15-rx_multicast"
        case port15RxBroadcast = "port_15-rx_broadcast"
        case port15TxMulticast = "port_15-tx_multicast"
        case port15TxBroadcast = "port_15-tx_broadcast"
        case port16RxPackets = "port_16-rx_packets"
        case port16RxBytes = "port_16-rx_bytes"
        case port16TxPackets = "port_16-tx_packets"
        case port16TxBytes = "port_16-tx_bytes"
        case port16RxMulticast = "port_16-rx_multicast"
        case port16TxMulticast = "port_16-tx_multicast"
        case port16TxBroadcast = "port_16-tx_broadcast"
        case port17RxPackets = "port_17-rx_packets"
        case port17RxBytes = "port_17-rx_bytes"
        case port17TxPackets = "port_17-tx_packets"
        case port17TxBytes = "port_17-tx_bytes"
        case port17RxBroadcast = "port_17-rx_broadcast"
        case port17TxMulticast = "port_17-tx_multicast"
        case port17TxBroadcast = "port_17-tx_broadcast"
        case port4RxPackets = "port_4-rx_packets"
        case port4RxBytes = "port_4-rx_bytes"
        case port4RxMulticast = "port_4-rx_multicast"
        case port6RxPackets = "port_6-rx_packets"
        case port6RxBytes = "port_6-rx_bytes"
        case port6RxBroadcast = "port_6-rx_broadcast"
        case port6RxMulticast = "port_6-rx_multicast"
        case port8RxMulticast = "port_8-rx_multicast"
        case port17RxMulticast = "port_17-rx_multicast"
        case port4RxBroadcast = "port_4-rx_broadcast"
        case port7RxMulticast = "port_7-rx_multicast"
        case port16RxBroadcast = "port_16-rx_broadcast"
    }
}



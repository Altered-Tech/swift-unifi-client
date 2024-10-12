//
//  SysInfo.swift
//  swift-unifi-client
//
//  Created by Michael Einreinhof on 10/11/24.
//

extension UnifiClient {
    public func sysInfo(site: String) async throws -> [UnifiSysInfo]? {
        let path: String = "\(basePath)/\(site)/stat/sysinfo"
        do {
            let result: UnifiResponse<UnifiSysInfo>? = try await getData(path: path, method: .GET)
            return result?.data ?? nil
        } catch {
            unifiClientLogger.error("Failed to get system information for site \(site): \(error)")
            throw error
        }
    }
}

public struct UnifiSysInfo: Codable {
    let timezone: String
    let autobackup: Bool
    let build: String
    let version: String
    let previousVersion: String
    let dataRetentionDays: Int
    let dataRetentionTimeInHoursFor5MinutesScale: Int
    let dataRetentionTimeInHoursForHourlyScale: Int
    let dataRetentionTimeInHoursForDailyScale: Int
    let dataRetentionTimeInHoursForMonthlyScale: Int
    let dataRetentionTimeInHoursForOthers: Int
    let updateAvailable: Bool
    let updateDownloaded: Bool
    let liveChat: String
    let storeEnabled: String
    let hostname: String
    let name: String
    let ipAddrs: [String]
    let informPort: Int
    let httpsPort: Int
    let portalHttpPort: Int
    let overrideInformHost: Bool
    let imageMapsUseGoogleEngine: Bool
    let radiusDisconnectRunning: Bool
    let facebookWifiRegistered: Bool
    let ssoAppId: String
    let ssoAppSec: String
    let uptime: Int
    let anonymousControllerId: String
    let hasWebrtcSupport: Bool
    let debugSettingPreference: String
    let debugMgmt: String
    let debugSystem: String
    let debugDevice: String
    let debugSdn: String
    let ubntDeviceType: String
    let cloudkeyVersion: String
    let cloudkeyStorageLimitations: Bool
    let cloudkeySdcardMounted: Bool
    let cloudkeyUsingFakeSystemProperties: Bool
    let ltsDeviceCount: Int
    let unsupportedDeviceCount: Int
    let unsupportedDeviceList: [String]
    let unifiGoEnabled: Bool
    let defaultSiteDeviceAuthPasswordAlert: Bool
    let isCloudConsole: Bool
    let consoleDisplayVersion: String

    enum CodingKeys: String, CodingKey {
        case timezone
        case autobackup
        case build
        case version
        case previousVersion = "previous_version"
        case dataRetentionDays = "data_retention_days"
        case dataRetentionTimeInHoursFor5MinutesScale = "data_retention_time_in_hours_for_5minutes_scale"
        case dataRetentionTimeInHoursForHourlyScale = "data_retention_time_in_hours_for_hourly_scale"
        case dataRetentionTimeInHoursForDailyScale = "data_retention_time_in_hours_for_daily_scale"
        case dataRetentionTimeInHoursForMonthlyScale = "data_retention_time_in_hours_for_monthly_scale"
        case dataRetentionTimeInHoursForOthers = "data_retention_time_in_hours_for_others"
        case updateAvailable = "update_available"
        case updateDownloaded = "update_downloaded"
        case liveChat = "live_chat"
        case storeEnabled = "store_enabled"
        case hostname
        case name
        case ipAddrs = "ip_addrs"
        case informPort = "inform_port"
        case httpsPort = "https_port"
        case portalHttpPort = "portal_http_port"
        case overrideInformHost = "override_inform_host"
        case imageMapsUseGoogleEngine = "image_maps_use_google_engine"
        case radiusDisconnectRunning = "radius_disconnect_running"
        case facebookWifiRegistered = "facebook_wifi_registered"
        case ssoAppId = "sso_app_id"
        case ssoAppSec = "sso_app_sec"
        case uptime
        case anonymousControllerId = "anonymous_controller_id"
        case hasWebrtcSupport = "has_webrtc_support"
        case debugSettingPreference = "debug_setting_preference"
        case debugMgmt = "debug_mgmt"
        case debugSystem = "debug_system"
        case debugDevice = "debug_device"
        case debugSdn = "debug_sdn"
        case ubntDeviceType = "ubnt_device_type"
        case cloudkeyVersion = "cloudkey_version"
        case cloudkeyStorageLimitations = "cloudkey_storage_limitations"
        case cloudkeySdcardMounted = "cloudkey_sdcard_mounted"
        case cloudkeyUsingFakeSystemProperties = "cloudkey_using_fake_system_properties"
        case ltsDeviceCount = "lts_device_count"
        case unsupportedDeviceCount = "unsupported_device_count"
        case unsupportedDeviceList = "unsupported_device_list"
        case unifiGoEnabled = "unifi_go_enabled"
        case defaultSiteDeviceAuthPasswordAlert = "default_site_device_auth_password_alert"
        case isCloudConsole = "is_cloud_console"
        case consoleDisplayVersion = "console_display_version"
    }
}

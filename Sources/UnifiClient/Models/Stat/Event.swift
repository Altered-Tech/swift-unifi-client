//
//  Event.swift
//  swift-unifi-client
//
//  Created by Michael Einreinhof on 10/11/24.
//

extension UnifiClient {
    public func events(site: String) async throws -> [UnifiEvent]? {
        let path: String = "\(basePath)/\(site)/stat/event"
        do {
            let result: UnifiResponse<UnifiEvent>? = try await getData(path: path, method: .GET)
            return result?.data ?? nil
        } catch {
            unifiClientLogger.error("Failed to get system events for site \(site): \(error)")
            throw error
        }
    }
}

public struct UnifiEvent: Codable {
    let duration: Int?
    let msg: String?
    let time: Int?
    let datetime: String?
    let bytes: Int?
    let siteId: String?
    let subsystem: String?
    let id: String?
    let user: String?
    let isNegative: Bool?
    let key: String?
    let network: String?
    let apTo: String?
    let channelFrom: Int?
    let channel: String?
    let ssid: String?
    let radio: String?
    let radioFrom: String?
    let apFrom: String?
    let radioTo: String?
    let channelTo: Int?
    let apModel: String?
    let apDisplayname: String?
    let ap: String?
    let apName: String?
    let hostname: String?
    let sw: String?
    let swName: String?
    let swModel: String?
    let swDisplayname: String?
    let port: Int?
    let versionTo: String?
    let versionFrom: String?
    let admin: String?
    let isAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case duration
        case msg
        case time
        case datetime
        case bytes
        case siteId = "site_id"
        case subsystem
        case id = "_id"
        case user
        case isNegative = "is_negative"
        case key
        case network
        case apTo = "ap_to"
        case channelFrom = "channel_from"
        case channel
        case ssid
        case radio
        case radioFrom = "radio_from"
        case apFrom = "ap_from"
        case radioTo = "radio_to"
        case channelTo = "channel_to"
        case apModel = "ap_model"
        case apDisplayname = "ap_displayName"
        case ap
        case apName = "ap_name"
        case hostname
        case sw
        case swName = "sw_name"
        case swModel = "sw_model"
        case swDisplayname = "sw_displayName"
        case port
        case versionTo = "version_to"
        case versionFrom = "version_from"
        case admin
        case isAdmin = "is_admin"
    }
}

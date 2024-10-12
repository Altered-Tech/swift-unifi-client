//
//  RogueAP.swift
//  swift-unifi-client
//
//  Created by Michael Einreinhof on 10/11/24.
//

extension UnifiClient {
    public func rogueAPs(site: String) async throws -> [RogueAP]? {
        let path: String = "\(basePath)/\(site)/stat/rogueap"
        do {
            let result: UnifiResponse<RogueAP>? = try await getData(path: path, method: .GET)
            return result?.data ?? nil
        } catch {
            unifiClientLogger.error("Failed to get rogue ap list for site \(site): \(error)")
            throw error
        }
    }
}

public struct RogueAP: Codable {
    let centerFreq: Int?
    let apMac: String?
    let rssi: Int?
    let lastSeen: Int?
    let essid: String?
    let bssid: String?
    let channel: Int?
    let freq: Int?
    let isAdhoc: Bool?
    let radio: String?
    let radioName: String?
    let security: String?
    let rssiAge: Int?
    let bw: Int?
    let isUbnt: Bool?
    let reportTime: Int?
    let siteId: String?
    let noise: Int?
    let Id: String?
    let band: String?
    let isRogue: Bool?
    let signal: Int?
    let age: Int?
    let oui: String?

    enum CodingKeys: String, CodingKey {
        case centerFreq = "center_freq"
        case apMac = "ap_mac"
        case rssi
        case lastSeen = "last_seen"
        case essid
        case bssid
        case channel
        case freq
        case isAdhoc = "is_adhoc"
        case radio
        case radioName = "radio_name"
        case security
        case rssiAge = "rssi_age"
        case bw
        case isUbnt = "is_ubnt"
        case reportTime = "report_time"
        case siteId = "site_id"
        case noise
        case Id = "_id"
        case band
        case isRogue = "is_rogue"
        case signal
        case age
        case oui
    }
}



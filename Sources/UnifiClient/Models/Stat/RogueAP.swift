////
////  RogueAP.swift
////  swift-unifi-client
////
////  Created by Michael Einreinhof on 10/11/24.
////
//
//extension UnifiClient {
//    public func rogueAPs(site: String) async throws -> [UnifiRogueAP]? {
//        let path: String = "\(basePath)/\(site)/stat/rogueap"
//        do {
//            let result: UnifiResponse<UnifiRogueAP>? = try await getData(path: path, method: .GET)
//            return result?.data ?? nil
//        } catch {
//            unifiClientLogger.error("Failed to get rogue ap list for site \(site): \(error)")
//            throw error
//        }
//    }
//}
//public struct UnifiRogueAP: Codable {
//    let centerFreq: Int
//    let apMAC: String
//    let rssi, lastSeen: Int
//    let essid, bssid: String
//    let channel, freq: Int
//    let isAdhoc: Bool
//    let radio: String
//    let radioName: RadioName
//    let security: Security
//    let rssiAge, bw: Int
//    let isUbnt: Bool
//    let reportTime: Int
//    let siteID: String
//    let noise: Int
//    let id: String?
//    let band: Radio
//    let isRogue: Bool
//    let signal, age: Int
//    let oui: String
//
//    enum CodingKeys: String, CodingKey {
//        case centerFreq = "center_freq"
//        case apMAC = "ap_mac"
//        case rssi
//        case lastSeen = "last_seen"
//        case essid, bssid, channel, freq
//        case isAdhoc = "is_adhoc"
//        case radio
//        case radioName = "radio_name"
//        case security
//        case rssiAge = "rssi_age"
//        case bw
//        case isUbnt = "is_ubnt"
//        case reportTime = "report_time"
//        case siteID = "site_id"
//        case noise
//        case id = "_id"
//        case band
//        case isRogue = "is_rogue"
//        case signal, age, oui
//    }
//}
//
//public enum Security: String, Codable {
//    case securityOpen = "Open"
//    case wpa2EnterpriseAESCCMP = "WPA2-Enterprise (AES/CCMP)"
//    case wpa2EnterpriseTKIPAESCCMP = "WPA2-Enterprise (TKIP/AES/CCMP)"
//    case wpa2PersonalAESCCMP = "WPA2-Personal (AES/CCMP)"
//    case wpa2PersonalTKIPAESCCMP = "WPA2-Personal (TKIP/AES/CCMP)"
//    case wpa2WPA3PersonalAESCCMP = "WPA2+WPA3-Personal (AES/CCMP)"
//    case wpa3WPA2PersonalAESCCMP = "WPA3/WPA2-Personal (AES/CCMP)"
//    case wpaWPA2EnterpriseAESCCMP = "WPA/WPA2-Enterprise (AES/CCMP)"
//    case wpaWPA2EnterpriseTKIPAESCCMP = "WPA/WPA2-Enterprise (TKIP/AES/CCMP)"
//    case wpaWPA2PersonalAESCCMP = "WPA/WPA2-Personal (AES/CCMP)"
//    case wpaWPA2PersonalTKIPAESCCMP = "WPA/WPA2-Personal (TKIP/AES/CCMP)"
//}
//
//public enum RadioName: String, Codable {
//    case ra0 = "ra0"
//    case wifi0 = "wifi0"
//    case wifi1 = "wifi1"
//}

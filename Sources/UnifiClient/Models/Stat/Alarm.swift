////
////  Alarm.swift
////  swift-unifi-client
////
////  Created by Michael Einreinhof on 10/11/24.
////
//
//import Foundation
//
//extension UnifiClient {
//    public func alarms(site: String) async throws -> [UnifiAlarm]? {
//        let path: String = "\(basePath)/\(site)/stat/alarm"
//        do {
//            let result: UnifiResponse<UnifiAlarm>? = try await getData(path: path, method: .GET)
//            return result?.data ?? nil
//        } catch {
//            unifiClientLogger.error("Failed to get system events for site \(site): \(error)")
//            throw error
//        }
//    }
//}
//
//public struct UnifiAlarm: Codable {
//    let msg: String
//    let apModel: String?
//    let apDisplayname: String?
//    let subsystem: Subsystem
//    let ap: String?
//    let archived: Bool
//    let apName: String?
//    let time: Int
//    let datetime: Date
//    let siteId: String
//    let id: String
//    let isNegative: Bool
//    let key: AlarmKey
//    let sw: String?
//    let swName: String?
//    let swModel: String?
//    let swDisplayname: String?
//
//    enum CodingKeys: String, CodingKey {
//        case msg
//        case apModel = "ap_model"
//        case apDisplayname = "ap_displayName"
//        case subsystem
//        case ap
//        case archived
//        case apName = "ap_name"
//        case time
//        case datetime
//        case siteId = "site_id"
//        case id = "_id"
//        case isNegative = "is_negative"
//        case key
//        case sw
//        case swName = "sw_name"
//        case swModel = "sw_model"
//        case swDisplayname = "sw_displayName"
//    }
//}
//
//public enum AlarmKey: String, Codable {
//    case evtAPLostContact = "EVT_AP_Lost_Contact"
//    case evtSWLostContact = "EVT_SW_Lost_Contact"
//}

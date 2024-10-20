////
////  Health.swift
////  swift-unifi-client
////
////  Created by Michael Einreinhof on 10/11/24.
////
//
//extension UnifiClient {
//    public func health(site: String) async throws -> [UnifiHealth]? {
//        let path: String = "\(basePath)/\(site)/stat/health"
//        do {
//            let result: UnifiResponse<UnifiHealth>? = try await getData(path: path, method: .GET)
//            return result?.data ?? nil
//        } catch {
//            unifiClientLogger.error("Failed to get health for site \(site): \(error)")
//            throw error
//        }
//    }
//}
//
//public struct UnifiHealth: Codable {
//    let subsystem: Subsystem
//    let numUser, numGuest, numIot, txBytesR: Int?
//    let rxBytesR: Int?
//    let status: String
//    let numAp, numAdopted, numDisabled, numDisconnected: Int?
//    let numPending, numGw, numSw: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case subsystem
//        case numUser = "num_user"
//        case numGuest = "num_guest"
//        case numIot = "num_iot"
//        case txBytesR = "tx_bytes-r"
//        case rxBytesR = "rx_bytes-r"
//        case status
//        case numAp = "num_ap"
//        case numAdopted = "num_adopted"
//        case numDisabled = "num_disabled"
//        case numDisconnected = "num_disconnected"
//        case numPending = "num_pending"
//        case numGw = "num_gw"
//        case numSw = "num_sw"
//    }
//}

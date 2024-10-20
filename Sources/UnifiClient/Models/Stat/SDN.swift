////
////  SDN.swift
////  swift-unifi-client
////
////  Created by Michael Einreinhof on 10/11/24.
////
//
//extension UnifiClient {
//    public func sdn(site: String) async throws -> [SDN]? {
//        let path: String = "\(basePath)/\(site)/stat/sdn"
//        do {
//            let result: UnifiResponse<SDN>? = try await getData(path: path, method: .GET)
//            return result?.data ?? nil
//        } catch {
//            unifiClientLogger.error("Failed to get sdn info for site \(site): \(error)")
//            throw error
//        }
//    }
//}
//
//public struct SDN: Codable {
//    let enabled: Bool?
//    let connected: Bool?
//    let isCloudKey: Bool?
//    let isUdm: Bool?
//    let ubicEnv: String?
//    let hasSsoAuth: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case enabled
//        case connected
//        case isCloudKey = "is_cloud_key"
//        case isUdm = "is_udm"
//        case ubicEnv = "ubic_env"
//        case hasSsoAuth = "has_sso_auth"
//    }
//}
//
//

//
//  Health.swift
//  swift-unifi-client
//
//  Created by Michael Einreinhof on 10/11/24.
//

extension UnifiClient {
    public func health(site: String) async throws -> [UnifiHealth]? {
        let path: String = "\(basePath)/\(site)/stat/health"
        do {
            let result: UnifiResponse<UnifiHealth>? = try await getData(path: path, method: .GET)
            return result?.data ?? nil
        } catch {
            unifiClientLogger.error("Failed to get health for site \(site): \(error)")
            throw error
        }
    }
}

public struct UnifiHealth: Codable {
    let subsystem: String
    let users: Int?
    let guests: Int?
    let iots: Int?
    let txBytes: Int?
    let rxBytes: Int?
    let status: String
    let aps: Int?
    let adopted: Int?
    let disabled: Int?
    let disconnected: Int?
    let pending: Int?
    let gateways: Int?
    let switches: Int?
    
    enum CodingKeys: String, CodingKey {
        case subsystem, status
        case users = "num_user"
        case guests = "num_guest"
        case iots = "num_iot"
        case txBytes = "tx_bytes-r"
        case rxBytes = "rx_bytes-r"
        case aps = "num_ap"
        case adopted = "num_adopted"
        case disabled = "num_disabled"
        case disconnected = "num_disconnected"
        case pending = "num_pending"
        case gateways = "num_gw"
        case switches = "num_sw"
    }
}

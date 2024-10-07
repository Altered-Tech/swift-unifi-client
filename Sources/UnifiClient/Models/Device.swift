//
//  Device.swift
//  Helix
//
//  Created by Michael Einreinhof on 10/1/24.
//

import Foundation

extension UnifiClient {
    public func devices(site: String) async throws -> [UnifiDevice]? {
        let path = "/proxy/network/api/s/\(site)/stat/device-basic"
        do {
            let result: UnifiResponse<UnifiDevice>? = try await getData(path: path, method: .GET)
            return result?.data ?? nil
        } catch {
            unifiClientLogger.error("Failed to get devices for site \(site): \(error)")
            throw error
        }
    }
}

public struct UnifiDevice: Codable {
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






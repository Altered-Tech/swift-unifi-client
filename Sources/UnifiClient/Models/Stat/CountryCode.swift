//
//  CountryCode.swift
//  swift-unifi-client
//
//  Created by Michael Einreinhof on 10/11/24.
//

extension UnifiClient {
    public func countryCodes(site: String) async throws -> [UnifiCCode]? {
        let path: String = "\(basePath)/\(site)/stat/ccode"
        do {
            let result: UnifiResponse<UnifiCCode>? = try await getData(path: path, method: .GET)
            return result?.data ?? nil
        } catch {
            unifiClientLogger.error("Failed to get country codes for site \(site): \(error)")
            throw error
        }
    }
}


public struct UnifiCCode: Codable {
    let code: String
    let name: String
    let key: String
}

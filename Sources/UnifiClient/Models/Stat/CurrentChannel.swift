////
////  CurrentChannel.swift
////  swift-unifi-client
////
////  Created by Michael Einreinhof on 10/11/24.
////
//
//extension UnifiClient {
//    public func apChannels(site: String) async throws -> [UnifiCurrentChannel]? {
//        let path: String = "\(basePath)/\(site)/stat/current-channel"
//        do {
//            let result: UnifiResponse<UnifiCurrentChannel>? = try await getData(path: path, method: .GET)
//            return result?.data ?? nil
//        } catch {
//            unifiClientLogger.error("Failed to get country channels for site \(site): \(error)")
//            throw error
//        }
//    }
//}
//
//public struct UnifiCurrentChannel: Codable {
//    let key: String
//    let name: String
//    let code: String
//    let channels6e: [Int]
//    let channels6e320: [Int]
//    let channels6e160: [Int]
//    let channels6e40: [Int]
//    let channels6e80: [Int]
//    let channels6eIndoor: [Int]
//    let channels6eOutdoor: [Int]
//    let channels6ePSC: [Int]
//    let channelsADOutdoor: [Int]
//    let channelsAD1080: [Int]
//    let channelsAD2160: [Int]
//    let channelsAD4320: [Int]
//    let channelsNA: [Int]
//    let channelsNA240: [Int]
//    let channelsNA160: [Int]
//    let channelsNA40: [Int]
//    let channelsNA80: [Int]
//    let channelsNADFS: [Int]
//    let channelsNAIndoor: [Int]
//    let channelsNAOutdoor: [Int]
//    let channelsNG: [Int]
//    let channelsNG40: [Int]
//    let channelsNGIndoor: [Int]
//    let channelsNGOutdoor: [Int]
//    
//    enum CodingKeys: String, CodingKey {
//        case key, name, code
//        case channels6e = "channels_6e"
//        case channels6e320 = "channels_6e_320"
//        case channels6e160 = "channels_6e_160"
//        case channels6e40 = "channels_6e_40"
//        case channels6e80 = "channels_6e_80"
//        case channels6eIndoor = "channels_6e_indoor"
//        case channels6eOutdoor = "channels_6e_outdoor"
//        case channels6ePSC = "channels_6e_psc"
//        case channelsADOutdoor = "channels_ad_outdoor"
//        case channelsAD1080 = "channels_ad_1080"
//        case channelsAD2160 = "channels_ad_2160"
//        case channelsAD4320 = "channels_ad_4320"
//        case channelsNA = "channels_na"
//        case channelsNA240 = "channels_na_240"
//        case channelsNA160 = "channels_na_160"
//        case channelsNA40 = "channels_na_40"
//        case channelsNA80 = "channels_na_80"
//        case channelsNADFS = "channels_na_dfs"
//        case channelsNAIndoor = "channels_na_indoor"
//        case channelsNAOutdoor = "channels_na_outdoor"
//        case channelsNG = "channels_ng"
//        case channelsNG40 = "channels_ng_40"
//        case channelsNGIndoor = "channels_ng_indoor"
//        case channelsNGOutdoor = "channels_ng_outdoor"
//    }
//}

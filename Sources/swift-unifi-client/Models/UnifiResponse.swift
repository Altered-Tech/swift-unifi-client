//
//  UnifiResponse.swift
//  Helix
//
//  Created by Michael Einreinhof on 10/1/24.
//

struct UnifiResponse<T: Codable>: Codable {
    let meta: UnifiMeta
    let data: [T]
}

struct UnifiMeta: Codable {
    let rc: String
}

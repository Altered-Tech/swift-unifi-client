//
//  UnifiError.swift
//  Helix
//
//  Created by Michael Einreinhof on 10/3/24.
//

import Foundation

enum UnifiError: Error {
    case unauthorized(Data)
    case notFound(String)
    case unknownStatusCode(Int)
    case unknownError(Error)
    case decodingError(DecodingError)
    case httpResponseError
    case unknown(String)
    case forbidden(Data)
}

struct UnifiLoginError: Codable {
    let code: String
    let message: String
    let level: String
}

enum UrlError: Error {
    case invalidURL(String)
}

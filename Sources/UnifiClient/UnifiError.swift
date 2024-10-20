//
//  UnifiError.swift
//  Helix
//
//  Created by Michael Einreinhof on 10/3/24.
//

import Foundation

public enum UnifiError: Error {
    case forbidden(message: String)
    case undocumented(statusCode: Int, message: String? = nil)
}
//
//public struct UnifiLoginError: Codable {
//    let code: String
//    let message: String
//    let level: String
//}
//
//enum UrlError: Error {
//    case invalidURL(String)
//}

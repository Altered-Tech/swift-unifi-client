//
//  UnifiError.swift
//  Helix
//
//  Created by Michael Einreinhof on 10/3/24.
//

import Foundation

public enum UnifiError: Error {
    /// 400
    case badRequest(message: String)
    /// 401
    case unauthorized(message: String)
    /// 404
    case notFound(message: String)
    /// 429
    case tooManyRequests(message: String, retry: String)
    /// 500
    case internalServerError(message: String)
    /// 502
    case badGateway(message: String)
    case undocumented(statusCode: Int, message: String? = nil)
}

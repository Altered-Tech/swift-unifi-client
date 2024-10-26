//
//  UnifiError.swift
//  Helix
//
//  Created by Michael Einreinhof on 10/3/24.
//

import Foundation

public enum UnifiError: Error {
    /// 401
    case unauthorized(message: String)
    /// 403
    case forbidden(message: String)
    case undocumented(statusCode: Int, message: String? = nil)
}

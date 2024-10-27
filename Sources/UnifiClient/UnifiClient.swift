//
//  UnifiClient.swift
//  Helix
//
//  Created by Michael Einreinhof on 10/3/24.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

public struct UnifiClient {
    private let underlyingClient: any APIProtocol
    
    internal init(underlyingClient: any APIProtocol) {
        self.underlyingClient = underlyingClient
    }
    
    public init(url: String, session: URLSession = URLSession(configuration: .default)) async throws {
        let transportConfig = URLSessionTransport.Configuration(session: session)
        let transport = URLSessionTransport(configuration: transportConfig)
        self.init(underlyingClient: Client(serverURL: URL(string: url)!, transport: transport))
    }
    
    public func login(username: String, password: String) async throws -> String? {
        let response = try await underlyingClient.login(
            .init(body: .json(.init(username: username, password: password)))
        )
        switch response {
                
            case .ok(let value):
                return value.headers.SetCookie
            case .forbidden(let error):
                throw UnifiError.forbidden(message: try error.body.json.message ?? "Forbidden")
            case .undocumented(statusCode: let statusCode, _):
                throw UnifiError.undocumented(statusCode: statusCode)
        }
    }
    
    public func user(site: String, cookie: String) async throws -> Components.Schemas.User {
        let response = try await underlyingClient.user(
            path: .init(site: site),
            headers: .init(SetCookie: cookie)
        )
        switch response {
                
            case .ok(let value):
                return try value.body.json
            case .unauthorized(let error):
                throw UnifiError.unauthorized(message: try error.body.json.message ?? "Unauthorized")
            case .forbidden(let error):
                throw UnifiError.forbidden(message: try error.body.json.message ?? "Forbidden")
            case .undocumented(statusCode: let statusCode, _):
                throw UnifiError.undocumented(statusCode: statusCode)
        }
    }
}

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
    
    public init(url: String, username: String, password: String, session: URLSession = URLSession(configuration: .default)) async throws {
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
                if let message = try error.body.json.message {
                    throw UnifiError.forbidden(message: message)
                } else {
                    throw UnifiError.forbidden(message: "No Error Message")
                }
            case .undocumented(statusCode: let statusCode, _):
                throw UnifiError.undocumented(statusCode: statusCode)
        }
    }
}

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
    private let apiKey: String
    
    internal init(underlyingClient: any APIProtocol, apiKey: String) {
        self.underlyingClient = underlyingClient
        self.apiKey = apiKey
    }
    
    public init(url: String = "https://api.ui.com/ea", apiKey: String, session: URLSession = URLSession(configuration: .default)) async throws {
        let transportConfig = URLSessionTransport.Configuration(session: session)
        let transport = URLSessionTransport(configuration: transportConfig)
        self.init(
            underlyingClient: Client(
                serverURL: URL(string: url)!,
                transport: transport
            ),
            apiKey: apiKey
        )
    }
    
    public func getHosts() async throws -> Components.Schemas.Hosts {
        let result = try await underlyingClient.listHosts(
            .init(headers: .init(X_hyphen_API_hyphen_KEY: self.apiKey))
        )
        switch result {
                
            
            case .ok(let value):
                return try value.body.json
            case .unauthorized(let error):
                throw UnifiError.unauthorized(message: try error.body.json.message ?? "Unauthorized")
            case .tooManyRequests(let error):
                throw UnifiError
                    .tooManyRequests(
                        message: try error.body.json.message ?? "Too Many Requests",
                        retry: error.headers.Retry_hyphen_After ?? "Retry Value Not Found"
                    )
            case .internalServerError(let error):
                throw UnifiError.internalServerError(message: try error.body.json.message ?? "Internal Server Error")
            case .badGateway(let error):
                throw UnifiError.badGateway(message: try error.body.json.message ?? "Bad Gateway")
            case .undocumented(statusCode: let statusCode, _):
                throw UnifiError.undocumented(statusCode: statusCode, message: nil)
            case .notFound(let error):
                throw UnifiError.notFound(message: try error.body.json.message ?? "Not Found")
        }
    }
    
}

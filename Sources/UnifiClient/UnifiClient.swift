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
    
    public init(url: String = "https://api.ui.com", apiKey: String, session: URLSession = URLSession(configuration: .default)) async throws {
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
    
    public func getHosts() async throws -> [Host]? {
        let result = try await underlyingClient.listHosts(
            .init(headers: .init(X_hyphen_API_hyphen_KEY: self.apiKey))
        )
        switch result {
                
            case .ok(let value):
                return Hosts(client: try value.body.json).hosts
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
        }
    }
    
    public func getHost(id: String) async throws -> Host? {
        let result = try await underlyingClient.getHost(
            .init(
                path: .init(id: id),
                headers: .init(X_hyphen_API_hyphen_KEY: self.apiKey)
            )
        )
        switch result {
                
            case .ok(let value):
                return HostId(client: try value.body.json).host
            case .unauthorized(let error):
                throw UnifiError.unauthorized(message: try error.body.json.message ?? "Unauthorized")
            case .notFound(let error):
                throw UnifiError.notFound(message: try error.body.json.message ?? "Not Found")
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
        }
    }
    // list sites
    public func getSites() async throws -> [Site]? {
        let response = try await underlyingClient.getSites(
            headers: .init(X_hyphen_API_hyphen_KEY: self.apiKey)
        )
        
        switch response {
                
            case .ok(let result):
                return Sites(response: try result.body.json).sites
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
        }
    }
    // list devices
    public func getDevices() async throws -> [SiteDevices]? {
        let response = try await underlyingClient.getDevices(
            headers: .init(X_hyphen_API_hyphen_KEY: self.apiKey)
        )
        
        switch response {
                
            case .ok(let result):
                return AllSiteDevices(
                    response: try result.body.json
                ).siteDevices
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
        }
    }
    // get isp metrics
    public func getIspMetrics(type: Operations.getISPMetrics.Input.Path._typePayload, start: String? = nil, end: String? = nil, duration: String? = nil) async throws -> Components.Schemas.ISPMetric {
        let response = try await underlyingClient.getISPMetrics(
            path: .init(_type: type),
            query: .init(beginTimeStamp: start, endTimeStamp: end, duration: duration),
            headers: .init(X_hyphen_API_hyphen_KEY: self.apiKey)
        )
        
        switch response {
                
            case .ok(let result):
                return try result.body.json
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
        }
    }
    // query isp metrics
    public func queryISPMetrics(type: Operations.queryISPMetrics.Input.Path._typePayload, sites: [QueryISPSite]) async throws -> Components.Schemas.ISPMetrics {
        var siteBody: [Components.Schemas.Properties] = []
        for site in sites {
            siteBody.append(
                .init(beginTimestamp: site.begin,
                      endTimestamp: site.end,
                      hostId: site.hostId,
                      siteId: site.siteId)
                    )
        }
        let response = try await underlyingClient.queryISPMetrics(
            path: .init(_type: type),
            headers: .init(X_hyphen_API_hyphen_KEY: self.apiKey),
            body: .json(.init(site: .some(siteBody)))
        )
        
        switch response {
                
            case .ok(let result):
                return try result.body.json
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
        }
    }
}

public struct QueryISPSite {
    let begin: String?
    let end: String?
    let hostId: String
    let siteId: String
}

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
                return value.headers.Set_hyphen_Cookie
            case .forbidden(let error):
                throw UnifiError.forbidden(message: try error.body.json.message ?? "Forbidden")
            case .undocumented(statusCode: let statusCode, _):
                throw UnifiError.undocumented(statusCode: statusCode)
        }
    }
    
    public func user(site: String, cookie: String) async throws -> Components.Schemas.User {
        let response = try await underlyingClient.user(
            path: .init(site: site),
            headers: .init(Set_hyphen_Cookie: cookie)
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
    
    public func deviceBasic(site: String, cookie: String) async throws -> Components.Schemas.DeviceBasic {
        let result = try await underlyingClient.getDeviceBasic(
            path: .init(site: site),
            headers: .init(Set_hyphen_Cookie: cookie)
        )
        switch result {
                
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
    
    public func deviceDetailed(site: String, cookie: String) async throws -> Components.Schemas.Device {
        let result = try await underlyingClient.getDeviceDetail(
            path: .init(site: site),
            headers: .init(Set_hyphen_Cookie: cookie)
        )
        switch result {
                
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
    
    public func events(site: String, cookie: String) async throws -> Components.Schemas.Event {
        let result = try await underlyingClient.getSystemEvents(
            path: .init(site: site),
            headers: .init(Set_hyphen_Cookie: cookie)
        )
        switch result {
                
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
    
    public func alarms(site: String, cookie: String) async throws -> Components.Schemas.Event {
        let result = try await underlyingClient.getSystemAlarm(
            path: .init(site: site),
            headers: .init(Set_hyphen_Cookie: cookie)
        )
        switch result {
                
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
    
    public func systemInfo(site: String, cookie: String) async throws -> Components.Schemas.SystemInfo {
        let result = try await underlyingClient.getSystemInfo(
            path: .init(site: site),
            headers: .init(Set_hyphen_Cookie: cookie)
        )
        switch result {
                
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
    
    public func currentChannel(site: String, cookie: String) async throws -> Components.Schemas.CurrentChannel {
        let result = try await underlyingClient.getCurrentChannel(
            path: .init(site: site),
            headers: .init(Set_hyphen_Cookie: cookie)
        )
        switch result {
                
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
    
    public func countryCode(site: String, cookie: String) async throws -> Components.Schemas.CountryCodes {
        let result = try await underlyingClient.getCountryCodes(
            path: .init(site: site),
            headers: .init(Set_hyphen_Cookie: cookie)
        )
        switch result {
                
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
    
    public func siteInfo(site: String, cookie: String) async throws -> Components.Schemas.SiteInfo {
        let result = try await underlyingClient.getSiteHealth(
            path: .init(site: site),
            headers: .init(Set_hyphen_Cookie: cookie)
        )
        switch result {
                
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
    
    public func siteAdminInfo(site: String, cookie: String) async throws -> Components.Schemas.AdminStats {
        let result = try await underlyingClient.getAllAdminStats(
            headers: .init(Set_hyphen_Cookie: cookie)
        )
        switch result {
                
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
    
    public func allSitesStats(site: String, cookie: String) async throws -> Components.Schemas.SiteStats {
        let result = try await underlyingClient.getAllSitesStats(
            headers: .init(Set_hyphen_Cookie: cookie)
        )
        switch result {
                
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
    
    public func allSitesInfo(site: String, cookie: String) async throws -> Components.Schemas.SiteInfo {
        let result = try await underlyingClient.getAllSitesInfo(
            headers: .init(Set_hyphen_Cookie: cookie)
        )
        switch result {
                
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

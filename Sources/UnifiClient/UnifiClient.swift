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
    private var cookie: String? = nil
    private var crsfToken: String? = nil
    
    internal init(underlyingClient: any APIProtocol) {
        self.underlyingClient = underlyingClient
    }
    
    public init(url: String, session: URLSession = URLSession(configuration: .default)) async throws {
        let transportConfig = URLSessionTransport.Configuration(session: session)
        let transport = URLSessionTransport(configuration: transportConfig)
        self.init(underlyingClient: Client(serverURL: URL(string: url)!, transport: transport))
    }
    
    public mutating func login(username: String, password: String) async throws {
        let response = try await underlyingClient.login(
            .init(body: .json(.init(username: username, password: password)))
        )
        switch response {
                
            case .ok(let value):
                self.cookie = value.headers.Set_hyphen_Cookie
                self.crsfToken = value.headers.X_hyphen_Crsf_hyphen_Token
            case .forbidden(let error):
                throw UnifiError.forbidden(message: try error.body.json.message ?? "Forbidden")
            case .undocumented(statusCode: let statusCode, _):
                throw UnifiError.undocumented(statusCode: statusCode)
        }
    }
    
    public func user(site: String) async throws -> Components.Schemas.User {
        guard let cookie, let crsfToken else {
            throw UnifiDataError.missingData(message: "Missing cookie and crsfToken")
        }
        let response = try await underlyingClient.user(
            path: .init(site: site),
            headers: .init(
                Set_hyphen_Cookie: cookie,
                X_hyphen_Crsf_hyphen_Token: crsfToken
            )
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
    
    public func deviceBasic(site: String) async throws -> Components.Schemas.DeviceBasic {
        guard let cookie, let crsfToken else {
            throw UnifiDataError.missingData(message: "Missing cookie and crsfToken")
        }
        let result = try await underlyingClient.getDeviceBasic(
            path: .init(site: site),
            headers: .init(
                Set_hyphen_Cookie: cookie,
                X_hyphen_Crsf_hyphen_Token: crsfToken
            )
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
    
    public func deviceDetailed(site: String) async throws -> Components.Schemas.Device {
        guard let cookie, let crsfToken else {
            throw UnifiDataError.missingData(message: "Missing cookie and crsfToken")
        }
        let result = try await underlyingClient.getDeviceDetail(
            path: .init(site: site),
            headers: .init(
                Set_hyphen_Cookie: cookie,
                X_hyphen_Crsf_hyphen_Token: crsfToken
            )
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
    
    public func events(site: String) async throws -> Components.Schemas.Event {
        guard let cookie, let crsfToken else {
            throw UnifiDataError.missingData(message: "Missing cookie and crsfToken")
        }
        let result = try await underlyingClient.getSystemEvents(
            path: .init(site: site),
            headers: .init(
                Set_hyphen_Cookie: cookie,
                X_hyphen_Crsf_hyphen_Token: crsfToken
            )
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
    
    public func alarms(site: String) async throws -> Components.Schemas.Event {
        guard let cookie, let crsfToken else {
            throw UnifiDataError.missingData(message: "Missing cookie and crsfToken")
        }
        let result = try await underlyingClient.getSystemAlarm(
            path: .init(site: site),
            headers: .init(
                Set_hyphen_Cookie: cookie,
                X_hyphen_Crsf_hyphen_Token: crsfToken
            )
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
    
    public func systemInfo(site: String) async throws -> Components.Schemas.SystemInfo {
        guard let cookie, let crsfToken else {
            throw UnifiDataError.missingData(message: "Missing cookie and crsfToken")
        }
        let result = try await underlyingClient.getSystemInfo(
            path: .init(site: site),
            headers: .init(
                Set_hyphen_Cookie: cookie,
                X_hyphen_Crsf_hyphen_Token: crsfToken
            )
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
    
    public func currentChannel(site: String) async throws -> Components.Schemas.CurrentChannel {
        guard let cookie, let crsfToken else {
            throw UnifiDataError.missingData(message: "Missing cookie and crsfToken")
        }
        let result = try await underlyingClient.getCurrentChannel(
            path: .init(site: site),
            headers: .init(
                Set_hyphen_Cookie: cookie,
                X_hyphen_Crsf_hyphen_Token: crsfToken
            )
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
    
    public func countryCode(site: String) async throws -> Components.Schemas.CountryCodes {
        guard let cookie, let crsfToken else {
            throw UnifiDataError.missingData(message: "Missing cookie and crsfToken")
        }
        let result = try await underlyingClient.getCountryCodes(
            path: .init(site: site),
            headers: .init(
                Set_hyphen_Cookie: cookie,
                X_hyphen_Crsf_hyphen_Token: crsfToken
            )
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
    
    public func siteInfo(site: String) async throws -> Components.Schemas.SiteInfo {
        guard let cookie, let crsfToken else {
            throw UnifiDataError.missingData(message: "Missing cookie and crsfToken")
        }
        let result = try await underlyingClient.getSiteHealth(
            path: .init(site: site),
            headers: .init(
                Set_hyphen_Cookie: cookie,
                X_hyphen_Crsf_hyphen_Token: crsfToken
            )
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
    
    public func siteAdminInfo(site: String) async throws -> Components.Schemas.AdminStats {
        guard let cookie, let crsfToken else {
            throw UnifiDataError.missingData(message: "Missing cookie and crsfToken")
        }
        let result = try await underlyingClient.getAllAdminStats(
            headers: .init(
                Set_hyphen_Cookie: cookie,
                X_hyphen_Crsf_hyphen_Token: crsfToken
            )
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
    
    public func allSitesStats(site: String) async throws -> Components.Schemas.SiteStats {
        guard let cookie, let crsfToken else {
            throw UnifiDataError.missingData(message: "Missing cookie and crsfToken")
        }
        let result = try await underlyingClient.getAllSitesStats(
            headers: .init(
                Set_hyphen_Cookie: cookie,
                X_hyphen_Crsf_hyphen_Token: crsfToken
            )
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
    
    public func allSitesInfo(site: String) async throws -> Components.Schemas.SiteInfo {
        guard let cookie, let crsfToken else {
            throw UnifiDataError.missingData(message: "Missing cookie and crsfToken")
        }
        let result = try await underlyingClient.getAllSitesInfo(
            headers: .init(
                Set_hyphen_Cookie: cookie,
                X_hyphen_Crsf_hyphen_Token: crsfToken
            )
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

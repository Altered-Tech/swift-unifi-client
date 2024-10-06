//
//  UnifiClient.swift
//  Helix
//
//  Created by Michael Einreinhof on 10/3/24.
//

import Foundation
import os

let unifiClientLogger = Logger(subsystem: "io.alteredtech.unifi", category: "UnifiClient")

class UnifiClient {
    internal let url: String
    private let basicAuth: BasicAuth
    internal var cookie: Data? = nil
    
    init(url: String, basicAuth: BasicAuth) async {
        self.url = url
        self.basicAuth = basicAuth
        do {
            self.cookie = try await login()
        } catch {
            fatalError("Error logging in: \(error)")
        }
        unifiClientLogger.info("Initialized UnifiClient for \(url)")
    }
    
    private func checkURLComponents() -> URLComponents {
        guard let components = URLComponents(string: url) else {
            fatalError("Invalid URL: \(url)")
        }
        return components
    }
    
    private func login() async throws -> Data? {
        let path = "/api/auth/login"
        var components: URLComponents = checkURLComponents()
        components.path = path
        guard let completedURL: URL = components.url else { return nil }
        var request = URLRequest(url: completedURL)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = HTTPMethod.POST.rawValue
        request.httpBody = basicAuth.serialize()
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            let format = try JSONSerialization.jsonObject(with: data, options: [])
            print(format)
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                switch httpResponse.statusCode {
                    case 200:
                        // Success, return the data
                        return data
                    case 401:
                        throw UnifiError.unauthorized(data)
                    case 403:
                        throw UnifiError.forbidden(data)
                    case 404:
                        throw UnifiError.notFound("Not found")
                    case 405:
                        throw UnifiError.unknown("")
                default:
                        throw UnifiError
                            .unknownStatusCode(httpResponse.statusCode)
                }
            } else {
                throw UnifiError.unknownStatusCode(-2)
            }
        } catch let decodeError as DecodingError {
            throw UnifiError.decodingError(decodeError)
        } catch {
            throw UnifiError.unknownError(error)
        }
    }
    
    internal func buildRequest(with path: String, queryItems: [URLQueryItem], method: HTTPMethod) throws -> URLRequest? {
        var components = checkURLComponents() // Use the helper method below
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else {
            print("Invalid URL")
            return nil
        }
    

        var request = URLRequest(url: url)
        request.addValue("application/json",forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let cookie = self.cookie else { return nil }
        let jsonCookie = try JSONSerialization.jsonObject(with: cookie, options: [])
        print(jsonCookie)
        request.addValue(String(describing: jsonCookie),forHTTPHeaderField: "Cookie")
        
        request.httpMethod = method.rawValue
        
        return request
    }
    
    private func buildQuery(_ params: [String: String]) -> [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        for (key, value) in params {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        return queryItems
    }
    
    internal func getData<T: Codable>(path: String, parameters: [String: String] = [:], method: HTTPMethod) async throws -> T? {
        let queryItems = buildQuery(parameters)
        do {
            let request = try buildRequest(with: path, queryItems: queryItems, method: method)
            print(type(of: request))
            print(request?.debugDescription ?? "Request was nil")
            let (data, response) = try await URLSession.shared.data(for: request!)

            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                    case 200:
                    // Success, decode the data
                        let result: T = try JSONDecoder().decode(T.self, from: data)
                        return result
                    case 403:
                        throw UnifiError.forbidden(data)
                    case 404:
                        throw UnifiError.notFound("Returned if the resource is not found or the user does not have permission to view the resource.")
                    default:
                        throw UnifiError.unknownStatusCode(httpResponse.statusCode)
                }
            } else {
                throw UnifiError.httpResponseError // No valid response
            }
        } catch let decodeError as DecodingError {
            throw UnifiError.decodingError(decodeError)
        } catch {
            throw error
        }
    }
}

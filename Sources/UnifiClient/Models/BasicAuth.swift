//
//  BasicAuth.swift
//  Helix
//
//  Created by Michael Einreinhof on 10/3/24.
//

import Foundation

public struct BasicAuth {
    let username: String
    let password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    func serialize() -> Data? {
        let userData: [String: String] = ["username": username, "password": password]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: userData)
            return jsonData
            // TODO: ensure robust catching and maybe better output of userData
        } catch {
            print(error)
            return nil
        }
    }
}

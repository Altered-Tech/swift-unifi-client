//
//  ISPQuery.swift
//  swift-unifi-client
//
//  Created by Michael Einreinhof on 11/2/24.
//

public struct ISPQuery {
    public let data: ISPQueryData?
    public let httpStatusCode: Int32?
    public let traceID: String?

    public init(data: ISPQueryData, httpStatusCode: Int32, traceID: String) {
        self.data = data
        self.httpStatusCode = httpStatusCode
        self.traceID = traceID
    }
    
    internal init(response: Components.Schemas.ISPMetrics?) {
        self.httpStatusCode = response?.httpStatusCode
        self.traceID = response?.traceId
        self.data = ISPQueryData(response: response?.data)
    }
}

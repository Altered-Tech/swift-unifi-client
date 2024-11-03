import Foundation

// MARK: - ISP
public struct ISP {
    public let data: [ISPData]?
    public let httpStatusCode: Int32?
    public let traceID: String?

    public init(data: [ISPData], httpStatusCode: Int32, traceID: String) {
        self.data = data
        self.httpStatusCode = httpStatusCode
        self.traceID = traceID
    }
    
    internal init(response: Components.Schemas.ISPMetric?) {
        self.httpStatusCode = response?.httpStatusCode
        self.traceID = response?.traceId
        self.data = response?.data?.map{ ISPData(response: $0) }
    }
}

public struct ISPQueryData {
    public let metrics: [ISPData]?

    public init(metrics: [ISPData]) {
        self.metrics = metrics
    }
    
    internal init(response: Components.Schemas.ISPMetrics.dataPayload?) {
        self.metrics = response?.metrics?.map{ ISPData(response: $0) }
    }
}

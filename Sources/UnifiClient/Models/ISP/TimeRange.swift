//
//  TimeRange.swift
//  swift-unifi-client
//
//  Created by Michael Einreinhof on 11/2/24.
//

public enum TimeRange: String {
    case _5m = "5m"
    case _1h = "1h"
    
    internal func convertToGet() -> Operations.getISPMetrics.Input.Path._typePayload {
        switch self {
            case ._1h: return ._1h
            case ._5m: return ._5m
        }
    }
    
    internal func convertToQuery() -> Operations.queryISPMetrics.Input.Path._typePayload {
        switch self {
            case ._1h: return ._1h
            case ._5m: return ._5m
        }
    }
}

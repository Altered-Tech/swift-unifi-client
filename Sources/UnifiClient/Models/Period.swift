import Foundation

// MARK: - Period
public struct Period {
    public let index: Int32?

    public init(index: Int32) {
        self.index = index
    }
    
    internal init(
        response: Components.Schemas.ReportedState.internetIssues5minPayload.periodsPayloadPayload?
    ) {
        self.index = response?.index
    }
}

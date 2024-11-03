import Foundation

// MARK: - InternetIssues5Min
public struct InternetIssues5Min {
    public let periods: [Periods]?

    public init(periods: [Periods]) {
        self.periods = periods
    }
    
    internal init(response: Components.Schemas.ReportedState.internetIssues5minPayload?) {
        self.periods = response?.periods?.map{ Periods(response: $0) }
    }
}

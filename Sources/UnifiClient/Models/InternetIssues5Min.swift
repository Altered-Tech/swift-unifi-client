import Foundation

// MARK: - InternetIssues5Min
public struct InternetIssues5Min {
    public let periods: [Period]?

    public init(periods: [Period]) {
        self.periods = periods
    }
    
    internal init(response: Components.Schemas.ReportedState.internetIssues5minPayload?) {
        self.periods = response?.periods?.map{ Period(response: $0) }
    }
}

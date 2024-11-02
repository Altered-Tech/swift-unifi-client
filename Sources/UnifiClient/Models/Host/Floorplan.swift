import Foundation

// MARK: - Floorplan
public struct Floorplan {
    public let canEdit: Bool?
    public let canView: Bool?

    public init(canEdit: Bool, canView: Bool) {
        self.canEdit = canEdit
        self.canView = canView
    }
    
    internal init(response: Components.Schemas.Floorplan?) {
        self.canEdit = response?.canEdit
        self.canView = response?.canView
    }
}

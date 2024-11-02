import Foundation

// MARK: - UserDataFeatures
public struct UserDataFeatures {
    public let deviceGroups: Bool?
    public let floorplan: Floorplan?
    public let manageApplications: Bool?
    public let notifications: Bool?
    public let pion: Bool?
    public let webrtc: Webrtc?

    public init(deviceGroups: Bool, floorplan: Floorplan, manageApplications: Bool, notifications: Bool, pion: Bool, webrtc: Webrtc) {
        self.deviceGroups = deviceGroups
        self.floorplan = floorplan
        self.manageApplications = manageApplications
        self.notifications = notifications
        self.pion = pion
        self.webrtc = webrtc
    }
    
    internal init(response: Components.Schemas.UserData.featuresPayload?) {
        self.deviceGroups = response?.deviceGroups
        self.floorplan = Floorplan(response: response?.floorplan)
        self.manageApplications = response?.manageApplications
        self.notifications = response?.notifications
        self.pion = response?.pion
        self.webrtc = Webrtc(response: response?.webrtc)
    }
}

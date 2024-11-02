import Foundation

// MARK: - Webrtc
public struct Webrtc {
    public let iceRestart: Bool?
    public let mediaStreams: Bool?
    public let twoWayAudio: Bool?

    public init(iceRestart: Bool, mediaStreams: Bool, twoWayAudio: Bool) {
        self.iceRestart = iceRestart
        self.mediaStreams = mediaStreams
        self.twoWayAudio = twoWayAudio
    }
    
    internal init(response: Components.Schemas.Webrtc?) {
        self.iceRestart = response?.iceRestart
        self.mediaStreams = response?.mediaStreams
        self.twoWayAudio = response?.twoWayAudio
    }
}

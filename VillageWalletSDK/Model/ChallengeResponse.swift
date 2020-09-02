import UIKit

public enum ChallengeResponseType: String {
	case STEP_UP = "STEP_UP"
	case PASSCODE = "PASSCODE"
}

public protocol ChallengeResponse {
	var instrumentId: String { get }

	var type: ChallengeResponseType { get }

	var token: String { get }

	var reference: String? { get }
}

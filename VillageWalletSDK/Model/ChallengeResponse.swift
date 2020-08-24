import UIKit

public enum ChallengeResponseType: String {
	case STEP_UP = "STEP_UP"
	case PASSCODE = "PASSCODE"
}

public protocol ChallengeResponse {
	func instrumentId() -> String

	func type() -> ChallengeResponseType

	func token() -> String

	func reference() -> String?
}

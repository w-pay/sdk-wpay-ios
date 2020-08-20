import UIKit

public enum ChallengeResponseType {
	case STEP_UP
	case PASSCODE
}

public protocol ChallengeResponse {
	func instrumentId() -> String

	func type() -> ChallengeResponseType

	func token() -> String

	func reference() -> String?
}

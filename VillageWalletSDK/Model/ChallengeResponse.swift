import UIKit

/** Possible types of challenges */
public enum ChallengeResponseType: String {
	case STEP_UP = "STEP_UP"
	case PASSCODE = "PASSCODE"
	case THREEDS = "3ds"
	case THREEDS_FRICTIONLESS = "3ds-frictionless"
}

/**
	The response to a step up challenge
 */
public protocol ChallengeResponse {
	/** The `PaymentInstrument` id related to the step up challenge. */
	var instrumentId: String { get }

	/** The type of `ChallengeResponse.token` that has been provided */
	var type: ChallengeResponseType { get }

	/** The value requested by the challenge. */
	var token: String { get }

	/** An optional reference that could be used for audit tracing */
	var reference: String? { get }
}

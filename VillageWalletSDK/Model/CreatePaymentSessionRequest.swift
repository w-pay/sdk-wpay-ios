import UIKit

/**
	Request containing the details of the `PaymentSession`
 */
public protocol CreatePaymentSessionRequest {
	/** The location of the payment session (used to group payment sessions). */
	var location: String { get }

	/** Payload used to pass merchant information to the customer. */
	var merchantInfo: DynamicPayload { get }

	/**
		Flag indicating whether a QR code should be created and returned in the response.

		- Returns: `false` by default
	*/
	var generateQR: Bool { get }

	/**
		The time in seconds that the payment request should remain valid

		Default value is 0 which indicates that the code will not expire until it is deleted

		- Returns: `0` by default
	*/
	var timeToLivePaymentSession: Int { get }

	/**
		The time in seconds that the QR code should remain valid.

		Default value is 0 which indicates that the code will not expire until it is deleted

		- Returns: `0` by default
	*/
	var timeToLiveQR: Int { get }
}

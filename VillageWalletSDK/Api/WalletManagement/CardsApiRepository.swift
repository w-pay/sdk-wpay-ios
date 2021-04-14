import UIKit

public protocol CardsApiRepository {
	/**
	 Get a credit card detials input iframe (URL) for the consumer. This API is rate limited to 10 requests per minute per shopper id.

	 - Parameter initiateCardCaptureRequest: Detail of the card capture to recieve the iframe (URL) for.
	 */
	func initCapture(
		initiateCardCaptureRequest: InitiateCardCaptureRequest,
		completion: @escaping ApiCompletion<InitiateCardCaptureResponse>
	)

	/**
	 Get a credit card detials input iframe (URL) for a guest user. This API is rate limited to 10 requests per minute per guest shopper id.

	 - Parameter initiateCardCaptureRequest: Detail of the card capture to recieve the iframe (URL) for.
	 */
	func guestInitCapture(
		initiateCardCaptureRequest: InitiateCardCaptureRequest,
		completion: @escaping ApiCompletion<InitiateCardCaptureResponse>
	)
}

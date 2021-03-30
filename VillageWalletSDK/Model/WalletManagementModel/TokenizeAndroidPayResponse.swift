import UIKit

/**
 The JSON response structure of the Tokenize Android Pay endpoint.
 */
public protocol TokenizeAndroidPayResponse {
	/** The new payment instrument id to be used for payments. */
	var paymentInstrumentId: String { get }

	/** The step-up token to be used for payments. */
	var stepUpToken: String { get }
}

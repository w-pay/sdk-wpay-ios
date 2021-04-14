import UIKit

/**
 The JSON response structure of the Tokenize Google Pay endpoint.
 */
public protocol TokenizeGooglePayResponse {
	/** The new payment token to be used for payments. The payment token is a unique identifier for the payment instrument.*/
	var paymentToken: String { get }
}

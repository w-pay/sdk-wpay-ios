import UIKit

/**
 The JSON request structure of the Tokenize PayPalApi endpoint.
 */
public protocol TokenizePaypalRequest {
	/* The PayPalApi nonce that will be used during a PayPalApi payment. */
	var nonce: String { get }

	/* A flag to indicate if this payment instrument has to be set as the primary instrument. */
	var primary: Bool? { get }
}

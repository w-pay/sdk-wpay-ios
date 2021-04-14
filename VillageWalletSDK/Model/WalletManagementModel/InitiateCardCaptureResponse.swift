import UIKit

/**
 The JSON response structure of the Initiate Card Capture endpoint.
 */
public protocol InitiateCardCaptureResponse {
	/* The URL of an iframe. This iframe is used to capture a credit card number, expiry and CVV. */
	var cardCaptureURL: String { get }

	/* Container reference in the transaction logs. This number uniquely identifies the transaction in the container. */
	var transactionRef: String { get }
}

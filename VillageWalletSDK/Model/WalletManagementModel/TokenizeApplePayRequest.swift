import UIKit

/**
 The JSON request structure of the Tokenize Apple Pay endpoint.
 */
public protocol TokenizeApplePayRequest {
	/* The "data" value from the Apple Pay wallet. */
	var data: String { get }

	/* The "ephemeralPublicKey" value from the Apple Pay wallet. */
	var ephemeralPublicKey: String { get }

	/* The "publicKeyHash" value from the Apple Pay wallet. */
	var publicKeyHash: String { get }

	/* The "transactionId" value from the Apple Pay wallet. */
	var transactionId: String { get }

	/* The "signature" value from the Apple Pay wallet. */
	var signature: String { get }

	/* The "version" value from the Apple Pay wallet. */
	var version: String { get }

	/* The type/schema value from the Apple Pay wallet. */
	var instrumentType: String { get }

	/* A flag to indicate if this payment instrument has to be set as the primary instrument. */
	var primary: Bool? { get }

	/* The display text returned by the Apple Pay wallet. */
	var comment: String { get }

	/* The "applicationData" value from the Apple Pay wallet. */
	var applicationData: String { get }
}

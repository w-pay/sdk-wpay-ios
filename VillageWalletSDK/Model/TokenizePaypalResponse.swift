import UIKit

/**
 * The JSON response structure of the Tokenize PayPalApi endpoint.
 */
public protocol TokenizePaypalResponse {
	var payPal: PaypalDetails { get }
}

public protocol PaypalDetails {
	/* The new payment instrument id to be used for payments.*/
	var paymentInstrumentId: String { get }

	/* The status of the payment instrument in the container. */
	var status: PaypalStatusEnum { get }

	/* The timestamp the payment instrument was last updated in the container. The timestamp format is ISO8601.*/
	var lastUpdated: String { get }

	/* The timestamp the payment instrument was last used in the container. The timestamp format is ISO8601. Will be null if never used. */
	var lastUsed: String { get }

	/* A flag to indicate if this payment instrument is the primary instrument in the container. */
	var primary: Bool? { get }

	/* A flag to indicate if the merchant profile in the container allows the use of this payment instrument. */
	var allowed: Bool? { get }

	/* The PayPalApi email id. */
	var payPalId: String { get }

	/* The PayPalApi customer id. */
	var customerId: String { get }
}

public enum PaypalStatusEnum: String {
	case UNVERIFIED_PERSISTENT, VERIFIED
}

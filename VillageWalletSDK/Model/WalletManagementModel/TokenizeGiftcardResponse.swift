import UIKit

/**
 The JSON response structure of the Tokenize Giftcard endpoint.
 */
public protocol TokenizeGiftcardResponse {
	/* The current available balance of the gift card. */
	var giftCard: TokenizedGiftCard { get }

	var balance: Decimal { get }

	/* The day of the expiry date of the gift card. */
	var expiryDay: String { get }

	/* The month of the expiry date of the gift card. */
	var expiryMonth: String { get }

	/* The year of the expiry date of the gift card. */
	var expiryYear: String { get }

	/* A flag to indicate if the gift card is expired. */
	var expired: Bool? { get }
}

public protocol TokenizedGiftCard {
	/* The new payment instrument id to be used for payments. */
	var paymentInstrumentId: String { get }

	/* The status of the payment instrument in the container. */
	var status: Status { get }

	/* The timestamp the payment instrument was last updated in the container. The timestamp format is ISO8601. */
	var lastUpdated: String { get }

	/* The timestamp the payment instrument was last used in the container. The timestamp format is ISO8601. Will be null if never used. */
	var lastUsed: String { get }

	/* A flag to indicate if this payment instrument is the primary instrument in the container. */
	var primary: Bool? { get }

	/* A flag to indicate if the merchant profile in the container allows the use of this payment instrument. */
	var allowed: Bool? { get }

	/* The gift card program name. */
	var programName: String { get }

	/* The suffix (last 4 digits) of the gift card number. */
	var cardSuffix: String { get }
}

public enum Status : String {
	case UNVERIFIED_PERSISTENT, VERIFIED
}
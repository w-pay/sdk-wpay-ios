import UIKit

/**
 The JSON response structure of the GiftcardsApi Balance endpoint.
 */
public protocol GiftcardsBalanceResponse {
	var giftCardBalances: [GiftCardBalance] { get }
}

public protocol GiftCardBalance {
	/* The gift card number. This property will only be returned if the endpoint was called with the "cardNumber" and "pinCode" request properties. */
	var cardNumber: String { get }

	/* The gift card payment instrument id. This property will only be returned if the endpoint was called with the "paymentInstrumentId" request property. */
	var paymentInstrumentId: String { get }

	/* The current available balance of the gift card. */
	var balance: Decimal { get }

	/*  The day of the expiry date of the gift card. */
	var expiryDay: String { get }

	/* The month of the expiry date of the gift card. */
	var expiryMonth: String { get }

	/* The year of the expiry date of the gift card. */
	var expiryYear: String { get }

	/* A flag to indicate if the gift card is expired. */
	var expired: Bool? { get }
}

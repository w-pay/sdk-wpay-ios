import UIKit

/**
 The JSON request structure of the GiftcardsApi Balance endpoint.
 */
public protocol GiftcardsBalanceRequest {
	/* Use this array if the endpoint is being called with "cardNumber" and "pinCode" request properties. */
	var giftCards: [GiftCardBalenceGiftCard] { get }

	/* Use this array if the endpoint is being called with "paymentInstrumentId" request properties. */
	var giftCardInstruments: [GiftCardInstrument] { get }
}

public protocol GiftCardBalenceGiftCard {
	/* The gift card number. */
	var cardNumber: String { get }

	/* The gift card pin code. */
	var pinCode: String { get }
}

public protocol GiftCardInstrument {
	/* The gift card payment instrument id. */
	var paymentInstrumentId: String { get }
}

import UIKit

/**
 The JSON request structure of the Tokenize Giftcard endpoint.
 */
public protocol TokenizeGiftcardRequest {
	/* The gift card number. */
	var cardNumber: String { get }

	/* The gift card pin code. */
	var pinCode: String { get }

	/* A flag to indicate if this payment instrument has to be set as the primary instrument. */
	var primary: Bool? { get }

	/* A flag to indicate if this payment instrument has to be saved in the container or tokenized for one-off use. */
	var save: Bool? { get }
}

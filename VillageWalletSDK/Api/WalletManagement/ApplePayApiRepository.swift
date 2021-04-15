import UIKit

public protocol ApplePayApiRepository {
	/**
	 Create a payment instrument id for a provided Apple Pay wallet item.

	 - Parameter tokenizeApplePayRequest: Detail of the Apple Pay wallet item to be tokenized.
	 */
	func tokenize(
		tokenizeApplePayRequest: TokenizeApplePayRequest,
		completion: @escaping ApiCompletion<TokenizeApplePayResponse>
	)

	/**
	 Create a payment instrument id for a provided Apple Pay wallet item of a guest user.

	 - Parameter tokenizeApplePayRequest: Detail of the Apple Pay wallet item to be tokenized.
	 */
	func guestTokenize(
		tokenizeApplePayRequest: TokenizeApplePayRequest,
		completion: @escaping ApiCompletion<TokenizeApplePayResponse>
	)

	/**
	 Update an Apple Pay payment instrument.

	 - Parameter paymentInstrumentId: The id of the Apple Pay payment instrument to update.
	 - Parameter tokenizeApplePayRequest: Detail of the Apple Pay wallet item to be tokenized.
	 */
	func update(
		paymentInstrumentId: String,
		tokenizeApplePayRequest: TokenizeApplePayRequest,
		completion: @escaping ApiCompletion<TokenizeApplePayResponse>
	)
}

import UIKit

public protocol GooglePayApiRepository {
	/**
	 Create a payment token for a provided Google Pay wallet item.

	 - Parameter tokenizeGooglePayRequest: Detail of the Google Pay wallet item to be tokenized.
	 */
	func tokenize(
		tokenizeGooglePayRequest: TokenizeGooglePayRequest,
		completion: @escaping ApiCompletion<TokenizeGooglePayResponse>
	)

	/**
	 Create a payment token for a provided Google Pay wallet item of a guest user.

	 - Parameter tokenizeGooglePayRequest: Detail of the Google Pay wallet item to be tokenized.
	 */
	func guestTokenize(
		tokenizeGooglePayRequest: TokenizeGooglePayRequest,
		completion: @escaping ApiCompletion<TokenizeGooglePayResponse>
	)

	/**
	 Update a Google Pay payment instrument.

	 - Parameter paymentToken: The payment token of the google pay payment instrument to update.
	 - Parameter tokenizeGooglePayRequest: Detail of the Google Pay wallet item to be tokenized.
	 */
	func update(
		paymentToken: String,
		tokenizeGooglePayRequest: TokenizeGooglePayRequest,
		completion: @escaping ApiCompletion<TokenizeGooglePayResponse>
	)
}

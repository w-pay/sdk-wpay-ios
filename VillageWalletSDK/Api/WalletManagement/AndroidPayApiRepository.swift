import UIKit

public protocol AndroidPayApiRepository {
	/**
	 Create a payment instrument id for a provided Android Pay wallet item.

	 - Parameter tokenizeAndroidPayRequest: Detail of the Android Pay wallet item to be tokenized.
	 */
	func tokenize(
		tokenizeAndroidPayRequest: TokenizeAndroidPayRequest,
		completion: @escaping ApiCompletion<TokenizeAndroidPayResponse>
	)

	/**
	 Update an Android Pay payment instrument.

	 - Parameter paymentInstrumentId: The id of the Android Pay payment instrument to update.
	 - Parameter tokenizeAndroidPayRequest: Detail of the Android Pay wallet item to be tokenized.
	 */
	func update(
		paymentInstrumentId: String,
		tokenizeAndroidPayRequest: TokenizeAndroidPayRequest,
		completion: @escaping ApiCompletion<TokenizeAndroidPayResponse>
	)
}

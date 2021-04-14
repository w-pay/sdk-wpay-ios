import UIKit

public protocol PayPalApiRepository {
	/**
	 Create a paymment intrument id for a provided paypal account.

	 - Parameter tokenizePaypalRequest: Detail of the paypal account to be tokenized.
	 */
	func tokenize(
		tokenizePaypalRequest: TokenizePaypalRequest,
		completion: @escaping ApiCompletion<TokenizePaypalResponse>
	)

	/**
	 Create a paymment intrument id for a provided paypal account of a guest user.

	 - Parameter tokenizePaypalRequest: Detail of the paypal account to be tokenized.
	 */
	func guestTokenize(
		tokenizePaypalRequest: TokenizePaypalRequest,
		completion: @escaping ApiCompletion<TokenizePaypalResponse>
	)
}

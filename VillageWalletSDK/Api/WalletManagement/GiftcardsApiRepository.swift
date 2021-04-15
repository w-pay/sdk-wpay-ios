import UIKit

public protocol GiftcardsApiRepository {
	/**
	 Create a paymment intrument id for a provided gift card.

	 - Parameter tokenizeGiftcardRequest: Detail of the Gift Card to be tokenized.
	 */
	func tokenize(
		tokenizeGiftcardRequest: TokenizeGiftcardRequest,
		completion: @escaping ApiCompletion<TokenizeGiftcardResponse>
	)

	/**
	 Create a paymment intrument id for a provided gift card of a guest user.

	 - Parameter tokenizeGiftcardRequest: Detail of the Gift Card to be tokenized.
	 */
	func guestTokenize(
		tokenizeGiftcardRequest: TokenizeGiftcardRequest,
		completion: @escaping ApiCompletion<TokenizeGiftcardResponse>
	)

	/**
	 Get the balance and expiryinfo for the provided gift cards. This API is rate limited to 5 requests per minute per shopper id.

	 - Parameter giftcardsBalanceRequest: Detail of the Gift Card to recieve balences for.
	 */
	func balance(
		giftcardsBalanceRequest: GiftcardsBalanceRequest,
	  completion: @escaping ApiCompletion<GiftcardsBalanceResponse>
	)
}

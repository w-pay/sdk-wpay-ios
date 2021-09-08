import UIKit

public protocol GiftingRepository {
	/**
	  Obtains a detail of an available gift card product that can be purchased

	  - Parameter productId: detail of payment to be made
	 */
	func getProductById(
		productId: String,
		completion: @escaping ApiCompletion<DigitalPayGiftingProductDetail>
	)

	/**
	  Obtains a list of available gift card products that can be purchased.

	  - Parameter page: The page of results to return with 1 indicating the first page
	  - Parameter pageSize: The number of records to return for this page
	  - Parameter lastUpdateDateTime: If present, only products changed since this time will be returned
	 */
	func listProducts(
		page: Int,
		pageSize: Int,
		lastUpdateDateTime: Date,
		completion: @escaping ApiCompletion<[DigitalPayGiftingProduct]>
	)

	/**
	  Validates a gift card order and verifies discount prior to an order being placed.

	  - Parameter quoteRequest: detail of gift card quote being obtained
	 */
	func getQuote(
		quoteRequest: DigitalPayGiftingQuoteRequest,
		completion: @escaping ApiCompletion<DigitalPayGiftingQuoteResponse>
	)

	/**
	  Order a gift card product.

	  - Parameter orderRequest: detail of gift card order being made
	 */
	func order(
		orderRequest: DigitalPayGiftingOrderRequest,
		completion: @escaping ApiCompletion<DigitalPayGiftingOrderResponse>
	)
}

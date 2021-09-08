import UIKit

/**
 Results of the gifting quote
 */
public protocol DigitalPayGiftingQuoteResponse {
	/** Quote reference. Can be used as a reference when placing the actual order */
	var quoteId: String { get }

	/** Face value of the gift card */
	var subTotalAmount: Decimal { get }

	/** Eligible discount amount. In case of no discounts, value will be 0 */
	var discountAmount: Decimal { get }

	/** Net amount payable */
	var totalOrderAmount: Decimal { get }

	/** Results of the gifting quote */
	var orderItems: GiftingProductQuoteResponseItem { get }
}

public protocol GiftingProductQuoteResponseItem {
	/** Unique identifier of the design selected (assumed to be DIGITAL only currently) */
	var designId: String { get }

	/** Face value of the gift card */
	var amount: Decimal { get }

	/** Sale price of the gift card */
	var unitPrice: Decimal { get }

	/** Total order price */
	var totalPrice: Decimal { get }

	/** For self use card, this can be any value between 1 and 10. For a gifting card, it must be 1 */
	var quantity: Int { get }

	/** If true its a gifting card, if false it is a self use card */
	var isGifting: Bool { get }

	/** Australian mobile number of recipient. Only SMS delivery method is supported for gifting card */
	var mobileNumber: String? { get }
}

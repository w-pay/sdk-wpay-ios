import UIKit

/**
 Request payload containing details of the order to quote on
 */
public protocol DigitalPayGiftingQuoteRequest {
	/** Gift cards to be included in the order. */
	var orderItems: [GiftingProductOrderItem]  { get }
}

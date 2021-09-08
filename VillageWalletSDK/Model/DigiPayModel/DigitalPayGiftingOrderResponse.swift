import UIKit

/**
 Results of the gifting order
 */
public protocol DigitalPayGiftingOrderResponse {
	/** Current order status */
	var status: String { get }

	/** Order reference */
	var orderId: String { get }

	/** Quote reference */
	var quoteNo: String { get }
}

import UIKit

/**
	Detailed information for a single Payment Request
 */
public protocol CustomerPaymentRequest: Payment {
	/** The ID of the merchant associated with this transaction */
	var merchantId: String { get }

	/** The `Basket` associated to this Payment Request` */
	var basket: Basket? { get }
}

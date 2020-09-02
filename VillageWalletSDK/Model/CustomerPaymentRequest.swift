import UIKit

public protocol CustomerPaymentRequest: Payment {
	var merchantId: String { get }
	var basket: Basket? { get }
}

import UIKit

public protocol CustomerPaymentRequest: Payment {
	func merchantId() -> String
	func basket() -> Basket?
}

import UIKit

public protocol Basket {
	func items() -> [BasketItem]
}

public protocol BasketItem {
	func label() -> String
	func description() -> String?
	func quantity() -> Int?
	func unitPrice() -> Decimal?
	func unitMeasure() -> String?
	func totalPrice() -> Decimal?
	func tags() -> [String: String]
}

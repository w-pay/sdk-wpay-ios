import UIKit

public protocol Basket {
	var items: [BasketItem] { get }
}

public protocol BasketItem {
	var label: String { get }
	var description: String?{ get }
	var quantity: Int? { get }
	var unitPrice: Decimal? { get }
	var unitMeasure: String? { get }
	var totalPrice: Decimal? { get }
	var tags: [String: String] { get }
}

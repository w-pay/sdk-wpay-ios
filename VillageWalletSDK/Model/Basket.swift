import UIKit

/**
	Basket of items associated with a payment request.
 */
public protocol Basket {
	/** Items in the basket */
	var items: [BasketItem] { get }
}

/**
	An item in a `Basket`
 */
public protocol BasketItem {
	/** Short label for the basket item. */
	var label: String { get }

	/** Longer description of the basket item. */
	var description: String? { get }

	/** The number of units of the item in the basket if multiple is possible. */
	var quantity: Int? { get }

	/** The unit price of the item. May be positive or negative. */
	var unitPrice: Decimal? { get }

	/** Optional display string for the measure of the unit. */
	var unitMeasure: String? { get }

	/** The total price of the item. May be positive or negative. */
	var totalPrice: Decimal? { get }

	/** Additional key/value pairs for the item defined by the merchant. */
	var tags: [String: String] { get }
}

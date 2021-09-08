import UIKit

/**
 Request payload containing details of the order
 */
public protocol DigitalPayGiftingOrderRequest {
	/** The instrumentId to be used for the order. Must not be a stored gift card */
	var instrumentId: String { get }

	/** Email of the ordering customer */
	var deliveryEmail: String { get }

	/** Unique reference for the order supplied by the client */
	var referenceId: String { get }

	/** Face value of the gift card */
	var subTotalAmount: Decimal { get }

	/** Eligible discount amount. In case of no discounts, value will be 0 */
	var discountAmount: Decimal { get }

	/** Net amount payable */
	var totalOrderAmount: Decimal { get }

	/** Billing address for the order */
	var billingContact: GiftingBillingContact { get }

	/** Gift cards to be included in the order.  Currently only supports a single entry.  Array is for future roadmap */
	var orderItems: [GiftingProductOrderItem] { get }
}

public protocol GiftingBillingContact {
	/** The customer's first name. */
	var firstName: String { get }

	/** The customer's last name. */
	var lastName: String { get }

	/** The email of the ordering customer. */
	var email: String { get }

	/** The mobile number of the ordering customer */
	var mobileNumber: String { get }

	/** The customer's street address line. */
	var streetAddress: String { get }

	/** The customer's extended address line. */
	var extendedAddress: String? { get }

	/** The customer's suburb. */
	var suburb: String { get }

	/** The customer's abbreviated state or territory. */
	var stateOrTerritory: String { get }

	/** The customer's postal code. */
	var postalCode: String { get }

	/** The customer's Alpha-2 (2-character) ISO-3166-1 country code. */
	var countryCode: String { get }
}

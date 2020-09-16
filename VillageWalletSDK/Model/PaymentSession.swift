import UIKit

/**
	A session between a customer and a merchant
 */
public protocol PaymentSession {
	/** The ID of the `PaymentSession` */
	var paymentSessionId: String { get }

	/** The ID of the associated Payment Request */
	var paymentRequestId: String? { get }

	/** The ID of the merchant initiating the `PaymentSession` */
	var merchantId: String { get }

	/** The ID of the customers wallet */
	var walletId: String? { get }

	/** The timestamp of when the payment session will expire and become unusable */
	var expiryTime: Date { get }

	/** The location of the `PaymentSession` (used to group payment sessions) */
	var location: String { get }

	/** Payload used to pass merchant information to the customer */
	var merchantInfo: DynamicPayload { get }

	/** Payload used to pass customer information back to the merchant */
	var customerInfo: DynamicPayload? { get }
}

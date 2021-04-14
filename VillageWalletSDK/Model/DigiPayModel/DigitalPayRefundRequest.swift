import UIKit

/**
 The JSON request structure of the Refunds endpoint.
 */
public protocol DigitalPayRefundRequest {
	/**
	 A merchant application specific reference number.

	 This number should uniquely identify the transaction in the merchant’s system.
	 */
	var clientReference: String { get }

	/** The merchant order number of the transaction. */
	var orderNumber: String { get }

	/** List of refunds */
	var refunds: [DigitalPayRefund] { get }
}

public protocol DigitalPayRefund {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the payment transaction in the container.
	 */
	var paymentTransactionRef: String { get }

	/** The amount you want to refund. */
	var amount: Decimal { get }
}

import UIKit

/**
 The JSON request structure of the Openpay Refunds endpoint.
 */
public protocol OpenPayRefundRequest {
	/**
	 A merchant application specific reference number.

	 This number should uniquely identify the transaction in the merchant’s system.
	 */
	var clientReference: String { get }

	/** The merchant order number of the transaction. */
	var orderNumber: String? { get }

	/** The merchants transaction date and time. The timestamp format is ISO8601. */
	var merchantTransactedAt: String? { get }

	/** List of refunds */
	var refunds: [OpenPayRefund] { get }

	var storeData: StoreData? { get }
}

public protocol StoreData {
	/** The refund transaction store id. */
	var storeId: String { get }
}

public protocol OpenPayRefund {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the payment transaction in the container.
	 */
	var paymentTransactionRef: String { get }

	/** The amount you want to refund. */
	var amount: Decimal { get }

	/** The GST amount of the amount you want to refund. */
	var gstAmount: Decimal? { get }

	/** The reason or justification for the refund. */
	var reason: String? { get }
}

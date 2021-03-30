import UIKit

/**
 The JSON success response structure of the Openpay Refunds endpoint.
 */
public protocol OpenPayRefundResponse {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the whole/grouped transaction in the container.
	 */
	var transactionReceipt: String { get }

	/** List of refund response */
	var refundResponses: [OpenPayRefundTransactionResponse] { get }
}

public protocol OpenPayRefundTransactionResponse {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the openpay transaction in the container.
	 */
	var paymentTransactionRef: String { get }

	/** Container reference in the transaction logs. This number uniquely identifies the refund transaction in the container. */
	var refundTransactionRef: String { get }

	/** The amount processed in the refund. */
	var amount: Decimal { get }

	/** This array is only included in the response if it is enabled in the consumers API configuration. */
	var extendedTransactionData: OpenPayExtendedTransactionData? { get }

	/**
	 * The external service code (from eg. Openpay).
	 *
	 * This property is only included in the response if it is enabled in the consumers API configuration.
	 */
	var externalServiceCode: String? { get }

	/**
	 * The external service message (from eg. Openpay).
	 *
	 * This property is only included in the response if it is enabled in the consumers API configuration.
	 */
	var externalServiceMessage: String? { get }
}

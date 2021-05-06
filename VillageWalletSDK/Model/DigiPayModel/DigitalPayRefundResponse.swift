import UIKit

/**
 The JSON success response structure of the Refunds endpoint.
 */
public protocol DigitalPayRefundResponse {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the whole/grouped transaction in the container.
	 */
	var transactionReceipt: String { get }

	/** A flag to indicate if a split refund was only partially successful, ie. at least 1 of the refunds had a successful result. */
	var partialSuccess: Bool? { get }

	/** List of refund response */
	var refundResponses: [DigitalPayRefundTransactionResponse] { get }
}

public protocol DigitalPayRefundTransactionResponse {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the credit card transaction in the container.
	 */
	var paymentTransactionRef: String { get }

	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the refund transaction in the container.
	 */
	var refundTransactionRef: String { get }

	/** The amount processed in the refund. */
	var amount: Decimal { get }

	/** The error code. Only present if an error occurred during payment. */
	var errorCode: String? { get }

	/** The error message. Only present if an error occurred during payment. */
	var errorMessage: String? { get }

	/** The error detail. Only present if an error occurred during payment. */
	var errorDetail: String? { get }

	/**
	 The external service code (from eg. Webpay).

	 This property is only included in the response if it is enabled in the consumers API configuration.
	 */
	var externalServiceCode: String? { get }

	/**
	 The external service message (from eg. Webpay).

	 This property is only included in the response if it is enabled in the consumers API configuration.
	 */
	var externalServiceMessage: String { get }
}

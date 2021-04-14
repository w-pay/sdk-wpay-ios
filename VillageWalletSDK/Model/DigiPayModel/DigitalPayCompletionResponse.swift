import UIKit

/**
 The JSON response structure of the Completions endpoint.
 */
public protocol DigitalPayCompletionResponse {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the whole/grouped transaction in the container.
	 */
	var transactionReceipt: String { get }

	/**
	 A flag to indicate if a split completion was only partially successful,

	 ie. at least 1 of the completions had a successful result.
	 */
	var partialSuccess: Bool? { get }

	var completionResponses: [DigitalPayTransactionCompletionResponse] { get }
}

public protocol DigitalPayTransactionCompletionResponse {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the credit card transaction in the container.
	 */
	var paymentTransactionRef: String { get }

	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the completion transaction in the container.
	 */
	var completionTransactionRef: String { get }

	/** The amount processed in the completion. */
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
	var externalServiceMessage: String? { get }
}

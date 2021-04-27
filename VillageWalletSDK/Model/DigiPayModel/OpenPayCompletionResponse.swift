import UIKit

/**
 The JSON response structure of the OpenPay Completions endpoint.
 */
public protocol OpenPayCompletionResponse {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the whole/grouped transaction in the container.
	 */
	var transactionReceipt: String { get }

	/** List of completion responses */
	var completionResponses: [OpenPayTransactionCompletionResponse] { get }
}

public protocol OpenPayTransactionCompletionResponse {
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

	/**
	 The external service code (from eg. Webpay).

	 This property is only included in the response if it is enabled in the consumers API configuration.
	 */
	var externalServiceCode: String { get }

	/**
	 The external service message (from eg. Webpay).

	 This property is only included in the response if it is enabled in the consumers API configuration.
	 */
	var externalServiceMessage: String { get }

	/** This array is only included in the response if it is enabled in the consumers API configuration. */
	var extendedTransactionData: [OpenPayExtendedTransactionData]? { get }
}

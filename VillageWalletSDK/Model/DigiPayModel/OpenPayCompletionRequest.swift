import UIKit

/**
 The JSON request structure of the OpenPay Completions endpoint.
 */
public protocol OpenPayCompletionRequest {
	/**
	 A merchant application specific reference number.

	 This number should uniquely identify the transaction in the merchant’s system.
	 */
	var clientReference: String { get }

	/** The merchant order number of the transaction. */
	var orderNumber: String { get }

	/** The merchants transaction date and time. The timestamp format is ISO8601. */
	var merchantTransactedAt: String { get }

	/** List of completions */
	var completions: [OpenPayCompletion] { get }
}

public protocol OpenPayCompletion {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the credit card transaction in the container.
	 */
	var paymentTransactionRef: String { get }

	/** The amount you want to process in the completion. */
	var amount: Decimal { get }

	/** The GST amount of the amount you want to process in the completion. */
	var gstAmount: Decimal? { get }
}

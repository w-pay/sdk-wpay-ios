import UIKit

/**
 The JSON request structure of the Completions endpoint.
 */
public protocol DigitalPayCompletionRequest {
	/**
	 A merchant application specific reference number.

	 This number should uniquely identify the transaction in the merchant’s system.
	 */
	var clientReference: String { get }

	/** The merchant order number of the transaction. */
	var orderNumber: String { get }

	/** List of completions */
	var completions: [DigitalPayCompletion] { get }
}

public protocol DigitalPayCompletion {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the credit card transaction in the container.
	 */
	var paymentTransactionRef: String { get }

	/** The amount you want to process in the completion. */
	var amount: Decimal { get }
}

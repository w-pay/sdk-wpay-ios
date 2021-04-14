import UIKit

/**
 The JSON success response structure of the Voids endpoint.
 */
public protocol DigitalPayVoidResponse {
	/** Container reference in the transaction logs. This number uniquely identifies the whole/grouped transaction in the container. */
	var transactionReceipt: String { get }

	/** A flag to indicate if a split void was only partially successful, ie. at least 1 of the voids had a successful result. */
	var partialSuccess: Bool? { get }

	/** List of void responses */
	var voidResponses: [DigitalPayVoidTransactionResponse] { get }
}

public protocol DigitalPayVoidTransactionResponse {
	/** Container reference in the transaction logs. This number uniquely identifies the credit card transaction in the container. */
	var paymentTransactionRef: String { get }

	/** Container reference in the transaction logs. This number uniquely identifies the void transaction in the container. */
	var voidTransactionRef: String { get }

	/**
	 The external service code (from eg. WebPay).

	 This property is only included in the response if it is enabled in the consumers API configuration.
	 */
	var externalServiceCode: String? { get }

	/**
	 The external service message (from eg. WebPay).

	 This property is only included in the response if it is enabled in the consumers API configuration.
	 */
	var externalServiceMessage: String? { get }

	/** The error code. Only present if an error occurred during payment. */
	var errorCode: String? { get }

	/** The error message. Only present if an error occurred during payment. */
	var errorMessage: String? { get }

	/** The error detail. Only present if an error occurred during payment. */
	var errorDetail: String? { get }
}

import UIKit

/**
 The JSON success response structure of the Openpay Voids endpoint.
 */
public protocol OpenPayVoidResponse {
	/** Container reference in the transaction logs. This number uniquely identifies the whole/grouped transaction in the container. */
	var transactionReceipt: String { get }

	/** List of void responses */
	var voidResponses: [OpenPayVoidTransactionResponse] { get }
}

public protocol OpenPayVoidTransactionResponse {
	/** Container reference in the transaction logs. This number uniquely identifies the openpay transaction in the container. */
	var paymentTransactionRef: String { get }

	/** Container reference in the transaction logs. This number uniquely identifies the void transaction in the container. */
	var voidTransactionRef: String { get }

	/** The amount processed in the void. */
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

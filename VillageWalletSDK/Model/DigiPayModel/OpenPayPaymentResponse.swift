import UIKit

/**
 The JSON success response structure of the Payments endpoint.
 */
public protocol OpenPayPaymentTransactionResponse {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the whole/grouped transaction in the container.
	 */
	var transactionReceipt: String { get }

	/** List of OpenPay payment responses */
	var paymentResponses: [OpenPayPaymentResponse] { get }
}

public protocol OpenPayPaymentResponse {
	/** The payment token. The payment token is a unique identifier for the payment instrument. */
	var paymentToken: String { get }

	/** Container reference in the transaction logs. This number uniquely identifies the openpay transaction in the container. */
	var paymentTransactionRef: String { get }

	/** This array is only included in the response if it is enabled in the consumers API configuration. */
	var extendedTransactionData: [OpenPayExtendedTransactionData]? { get }

	/**
	 The external service code (from eg. Openpay).

	 This property is only included in the response if it is enabled in the consumers API configuration.
	 */
	var externalServiceCode: String? { get }

	/**
	 The external service message (from eg. Openpay).

	 This property is only included in the response if it is enabled in the consumers API configuration.
	 */
	var externalServiceMessage: String? { get }
}

public protocol OpenPayExtendedTransactionData {
	/**
	 The name of the extended transaction data field.

	 The 'token' field is only included in the response if it is enabled in the consumers API configuration.
	 */
	var field: OpenPayExtendedTransactionDataFieldName { get }

	/** The value of the extended transaction data field. */
	var value: String { get }
}

public enum OpenPayExtendedTransactionDataFieldName: String {
	case OPEN_PAY_TRANSACTION_ID,
	     OPEN_PAY_ORDER_ID,
	     OPEN_PAY_PAYMENT_METHOD,
	     OPEN_PAY_CREATED_AT,
	     OPEN_PAY_BILLING_ACCOUNT_ID,
	     OPEN_PAY_BILLING_ACCOUNT_NAME,
	     OPEN_PAY_BILLING_ACCOUNT_ABN
}

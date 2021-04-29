import UIKit

public protocol OpenPayPaymentRequestTransactionType {
	var openPay: OpenPayTransactionType { get }
}

/**
 The JSON request structure of the Openpay Payments endpoint
 */
public protocol OpenPayPaymentRequest {
	/** The container transaction type to use for openpay instruments */
	var transactionType: OpenPayPaymentRequestTransactionType { get }

	/**
	 A merchant application specific reference number.

	 This number should uniquely identify the transaction in the merchant’s system.
	 */
	var clientReference: String { get }

	/**
	 A merchant application specific reference number.

	 This number should uniquely identify the customer in the merchant’s system.
	 */
	var customerRef: String? { get }

	/** The merchant order number of the transaction. */
	var orderNumber: String { get }

	/** The channel from which this charge is originating, eg. Online, In-Store. */
	var channel: String { get }

	/** The unique identifier for the merchants trading account. */
	var tradingAccountId: String? { get }

	/** The merchants transaction date and time. The timestamp format is ISO8601. */
	var merchantTransactedAt: String? { get }

	/** List of payments */
	var payments: [OpenPayPayments] { get }

	/** OpenPay store data */
	var storeData: OpenPayStoreData { get }
}

public enum OpenPayTransactionType: String {
	case PREAUTH, PURCHASE
}

public protocol OpenPayStoreData {
	/** The payment transaction store id. */
	var storeId: String { get }

	/** A pin for the payment method id. */
	var pin: String { get }
}

public protocol OpenPayPayments {
	/** The payment token. */
	var paymentToken: String { get }

	/** The amount you want to pay with the payment instrument. */
	var amount: Decimal { get }

	/** The GST amount of the full amount you want to pay with the payment instrument. */
	var gstAmount: Decimal? { get }
}

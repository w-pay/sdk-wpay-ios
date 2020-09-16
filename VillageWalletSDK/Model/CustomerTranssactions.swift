import UIKit

/**
 :nodoc:
*/
public protocol CustomerTransactions {

}

/**
	An instrument used for a transaction
 */
public protocol CustomerTransactionUsedPaymentInstrument {
	/** The ID of the payment instrument */
	var paymentInstrumentId: String { get }

	/** The amount charged against or refunded to this instrument */
	var amount: Decimal { get }

	/** The reference for the payment */
	var paymentTransactionRef: String? { get }
}

/**
	List of customer transactions
 */
public protocol CustomerTransactionSummaries: CustomerTransactions {
	/** The resulting list of transactions. */
	var transactions: [CustomerTransactionSummary] { get }
}

/**
	Summary information of a transaction performed by a customer
 */
public protocol CustomerTransactionSummary: TransactionSummary {
	/** The ID of the merchant associated with this transaction */
	var merchantId: String { get }

	/** The instruments used to make the payment. For refunds and cash back amounts will be negative */
	var instruments: [CustomerTransactionUsedPaymentInstrument] { get }
}

/**
	Detailed information for a single transaction
 */
public protocol CustomerTransactionDetails: CustomerTransactionSummary {
	/** The `Basket` associated to the the transaction */
	var basket: Basket? { get }
}
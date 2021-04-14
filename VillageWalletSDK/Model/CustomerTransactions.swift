import UIKit

/**
 :nodoc:
*/
public protocol CustomerTransactions {

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
}

/**
	Detailed information for a single transaction
 */
public protocol CustomerTransactionDetails: CustomerTransactionSummary {
	/** The `Basket` associated to the the transaction */
	var basket: Basket? { get }
}
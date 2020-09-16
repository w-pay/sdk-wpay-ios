import UIKit

/**
 :nodoc:
*/
public protocol MerchantTransactions {

}

/**
	List of merchant transactions.
 */
public protocol MerchantTransactionSummaries: MerchantTransactions {
	/** The resulting list of transactions. */
	var transactions: [MerchantTransactionSummary] { get }
}

public protocol MerchantTransactionSummary: TransactionSummary {
	/** The ID of the wallet associated with this transaction */
	var walletId: String { get }
}

/**
	Detailed information for a single transaction
 */
public protocol MerchantTransactionDetails: MerchantTransactionSummary {
	/** The `Basket` associated to the transaction. */
	var basket: Basket? { get }

	/** Optional extra details from the POS. */
	var posPayload: PosPayload? { get }

	/** Optional extra details from the merchant. */
	var merchantPayload: MerchantPayload? { get }
}
import UIKit

/**
  Request payload containing the void instructions
 */
public protocol TransactionVoidDetails {
	/** An order number to be associated with the transaction. */
	var orderNumber: String { get }

	/** A client reference to be associated with the transaction. */
	var clientReference: String { get }

	/**
	 * List of voids. Can be used to execute a void on multiple payment instruments.
	 *
	 * If voids is not supplied any pre-authorised sub transactions will be voided
	 */
	var voids: [VoidItem]? { get }
}

/**
  Payment reference of the pre-authorised transaction to be voided.
 */
public protocol VoidItem {
	/** The payment reference for this transaction */
	var paymentTransactionRef: String { get }
}

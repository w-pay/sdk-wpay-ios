import UIKit

/**
  Request payload containing the completion instructions
 */
public protocol TransactionCompletionDetails {
	/** An order number to be associated with the transaction. */
	var orderNumber: String { get }

	/** A client reference to be associated with the transaction. */
	var clientReference: String { get }

	/**
	  List of completions with amounts. Can be used to execute a completion on multiple payment instruments.

	  If completions is not supplied any pre-authorised sub transactions will be completed
	 */
	var completions: [CompletionItem]? { get }
}

/**
  Payment reference of the pre-authorised transaction to be completed.
 */
public protocol CompletionItem {
	/** The payment reference for this transaction */
	var paymentTransactionRef: String { get }

	/** The amount of the completed transaction */
	var amount: Decimal { get }
}

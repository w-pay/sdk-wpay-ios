import UIKit

/**
	Request payload containing the refund reason and instructions
 */
public protocol TransactionRefundDetails {
	/** The reason for the refund, or other message logged with the transaction */
	var reason: String { get }

	/**
		An optional client reference to be associated with the transaction.

		If not supplied the transactionId will be used.
	 */
	var clientReference: String? { get }
}

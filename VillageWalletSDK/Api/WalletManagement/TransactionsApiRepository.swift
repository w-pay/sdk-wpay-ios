import UIKit

public protocol TransactionsApiRepository {
	/**
	 Get the transaction history of a consumer.

	 - Parameter transactionHistoryRequest: Detail about transactions to recieve history for.
	 */
	func history(
		transactionHistoryRequest: TransactionHistoryRequest,
		completion: @escaping ApiCompletion<TransactionHistoryResponse>
	)
}

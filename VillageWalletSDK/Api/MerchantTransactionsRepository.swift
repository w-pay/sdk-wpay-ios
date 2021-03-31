import UIKit

public protocol MerchantTransactionsRepository {
	/**
	 Retrieve a list of previously executed transactions with the merchant.

	 - Parameter page: The page of results to return with 1 indicating the first page (defaults to 1).
	 - Parameter pageSize: The number of records to return for this page (current default is 25)
	 - Parameter endTime: If present, transactions newer than this time will not be returned.
	 - Parameter startTime: If present, transactions older than this time will not be returned
	 */
	func list(
		page: Int?,
		pageSize: Int?,
		endTime: Date?,
		startTime: Date?,
		completion: @escaping ApiCompletion<MerchantTransactionSummaries>
	)

	/**
	 Retrieve details about a specific transaction

	 - Parameter transactionId: The transaction id
	 */
	func getBy(
		transactionId: String,
		completion: @escaping ApiCompletion<MerchantTransactionDetails>
	)
}
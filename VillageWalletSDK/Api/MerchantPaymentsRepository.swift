import UIKit

public protocol MerchantPaymentsRepository {
	/**
	 Retrieve a list of the payments initiated by the merchant, both pending and complete

	 - Parameter type: The type of payment requests to return
	 - Parameter page: The page of results to return with 1 indicating the first page (defaults to 1).
	 - Parameter pageSize: The number of records to return for this page (current default is 25)
	 */
	func listPayments(
		type: String?,
		page: Int?,
		pageSize: Int?,
		completion: @escaping ApiCompletion<MerchantPaymentSummaries>
	)

	/**
	 Create a new payment request for a customer

	 - Parameter paymentRequest: The details of the new payment request
	 */
	func createPaymentRequest(
		paymentRequest: NewPaymentRequest,
		completion: @escaping ApiCompletion<CreatePaymentRequestResult>
	)

	/**
	 Retrieve a payment request by it's ID. The request may have been "completed" that is the customer has made a payment.

	 - Parameter paymentRequestId: The ID of the payment request to return.
	 */
	func getPaymentRequestDetailsBy(
		paymentRequestId: String,
		completion: @escaping ApiCompletion<MerchantPaymentDetails>
	)

	/**
	 Delete a payment request

	 - Parameter paymentRequestId: The payment request to delete
	 */
	func deletePaymentRequest(
		paymentRequestId: String,
		completion: @escaping ApiCompletion<Void>
	)

	/**
	 Refund a transaction to a customer

	 - Parameter transactionId: The transaction to be refunded.
	 - Parameter refundDetails: The details of the refund.
	 */
	func refundTransaction(
		transactionId: String,
		refundDetails: TransactionRefundDetails,
		completion: @escaping ApiCompletion<MerchantTransactionSummary>
	)

	/**
	 Complete a pre-authorised transaction

	 - Parameter transactionId The transaction to be completed.
	 - Parameter completionDetails The details of the completions.
	*/
	func completeTransaction(
		transactionId: String,
		completionDetails: TransactionCompletionDetails,
		completion: @escaping ApiCompletion<MerchantTransactionSummary>
	)

	/**
	 Void a pre-authorised transaction

	 - Parameter transactionId The transaction to be voided.
	 - Parameter voidDetails The details of the voids.
	 */
	func voidTransaction(
		transactionId: String,
		voidDetails: TransactionVoidDetails,
		completion: @escaping ApiCompletion<MerchantTransactionSummary>
	)
}
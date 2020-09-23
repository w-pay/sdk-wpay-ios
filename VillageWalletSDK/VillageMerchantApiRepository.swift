import UIKit

/**
	Dictionary of merchant preferences.
 */
public typealias MerchantPreferences = [String: [String: String]]

/**
	Defines the API operations that the SDK can use to call the Merchant Village API

	The SDK is technology agnostic with applications being able to choose an implementation that
	meets the needs and preexisting technology choices of the application.

	Implementations of the protocol may provide additional constraints on the user.
 */
public protocol VillageMerchantApiRepository: VillageAdministrationApiRepository {
	/**
		Retrieve a list of previously executed transactions with the merchant.

		- Parameter page: The page of results to return with 1 indicating the first page (defaults to 1).
		- Parameter pageSize: The number of records to return for this page (current default is 25)
		- Parameter endTime: If present, transactions newer than this time will not be returned.
		- Parameter startTime: If present, transactions older than this time will not be returned
	 */
	func retrieveTransactions(
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
	func retrieveTransactionDetails(
		transactionId: String,
		completion: @escaping ApiCompletion<MerchantTransactionDetails>
	)

	/**
		Create a new QR code for an existing payment request

		- Parameter details: The details for the new QR code.
	 */
	func createPaymentRequestQRCode(
		details: NewPaymentRequestQRCode,
		completion: @escaping ApiCompletion<QRCode>
	)

	/**
		Retrieve a `QRCode` that is associated to a Payment Request by its ID

		- Parameter qrCodeId: The ID to use.
	 */
	func retrievePaymentRequestQRCode(
		qrCodeId: String,
		completion: @escaping ApiCompletion<QRCode>
	)

	/**
		Cancels a QR code making it unusable

		- Parameter qrCodeId: The ID of the QR code to cancel.
	 */
	func cancelPaymentQRCode(
		qrCodeId: String,
		completion: @escaping ApiCompletion<Void>
	)

	/**
		Retrieve a list of the payments initiated by the merchant, both pending and complete

		- Parameter type: The type of payment requests to return
		- Parameter page: The page of results to return with 1 indicating the first page (defaults to 1).
		- Parameter pageSize: The number of records to return for this page (current default is 25)
	 */
	func retrievePaymentList(
		type: String?,
		page: Int?,
		pageSize: Int?,
		completion: @escaping ApiCompletion<MerchantPaymentSummaries>
	)

	/**
		Create a new payment request for a customer

		- Parameter paymentRequest: The details of the new payment request
	 */
	func createNewPaymentRequest(
		paymentRequest: NewPaymentRequest,
		completion: @escaping ApiCompletion<CreatePaymentRequestResult>
	)

	/**
		Retrieve a payment request by it's ID. The request may have been "completed" that is the customer has made a payment.

		- Parameter paymentRequestId: The ID of the payment request to return.
	 */
	func retrievePaymentRequestDetails(
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

		- Parameter transactionId: The transaction to refund.
		- Parameter refundDetails: The details of the refund.
	 */
	func refundTransaction(
		transactionId: String,
		refundDetails: TransactionRefundDetails,
		completion: @escaping ApiCompletion<MerchantTransactionSummary>
	)

	/**
	  Retrieve a merchant's preferences.
	 */
	func retrievePreferences(completion: @escaping ApiCompletion<MerchantPreferences>)

	/**
		Update a merchant's preferences

		- Parameter preferences: The preferences to use
	 */
	func setPreferences(
		preferences: MerchantPreferences,
		completion: @escaping ApiCompletion<Void>
	)

	/**
	  Retrieve the list of currently usable schemas previously added for the merchant
	 */
	func retrieveSchemas(completion: @escaping ApiCompletion<MerchantSchemaSummaries>)

	/**
		Retrieve details for a specific schema

		- Parameter schemaId: The schema to retrieve
	 */
	func retrieveSchemaDetails(
		schemaId: String,
		completion: @escaping ApiCompletion<MerchantSchema>
	)

	/**
		Create a new schema for the merchant

		- Parameter schema: The schema definition
	 */
	func createSchema(
		schema: MerchantSchema,
		completion: @escaping ApiCompletion<MerchantSchemaSummary>
	)

	/**
		Create a new `PaymentSession`

		- Parameter request: The details for the new session.
	 */
	func createPaymentSession(
		request: CreatePaymentSessionRequest,
		completion: @escaping ApiCompletion<CreatePaymentSessionResult>
	)

	/**
		Retrieve a `PaymentSession`

		- Parameter paymentSessionId: The ID of the payment session to retrieve.
	 */
	func retrievePaymentSession(
		paymentSessionId: String,
		completion: @escaping ApiCompletion<PaymentSession>
	)

	/**
		Update a `PaymentSession`

		- Parameter paymentSessionId: The payment session to update
		- Parameter session: The details to update the session with
	 */
	func updatePaymentSession(
		paymentSessionId: String,
		session: MerchantUpdatePaymentSessionRequest,
		completion: @escaping ApiCompletion<Void>
	)

	/**
		Delete a `PaymentSession`

		- Parameter paymentSessionId: The payment session to delete.
	 */
	func deletePaymentSession(
		paymentSessionId: String,
		completion: @escaping ApiCompletion<Void>
	)
}

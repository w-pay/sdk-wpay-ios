import UIKit

public typealias MerchantPreferences = [String: [String: String]]

public protocol VillageMerchantApiRepository: VillageAdministrationApiRepository {
	func retrieveTransactions(
		page: Int?,
		pageSize: Int?,
		endTime: Date?,
		startTime: Date?,
		completion: @escaping ApiCompletion<MerchantTransactionSummaries>
	)

	func retrieveTransactionDetails(
		transactionId: String,
		completion: @escaping ApiCompletion<MerchantTransactionDetails>
	)

	func createPaymentRequestQRCode(
		details: NewPaymentRequestQRCode,
		completion: @escaping ApiCompletion<QRCode>
	)

	func retrievePaymentRequestBy(
		qrCodeId: String,
		completion: @escaping ApiCompletion<QRCode>
	)

	func cancelPaymentQRCode(
		qrCodeId: String,
		completion: @escaping ApiCompletion<Void>
	)

	func retrievePaymentList(
		type: String?,
		page: Int?,
		pageSize: Int?,
		completion: @escaping ApiCompletion<MerchantPaymentSummaries>
	)

	func createNewPaymentRequest(
		paymentRequest: NewPaymentRequest,
		completion: @escaping ApiCompletion<CreatePaymentRequestResult>
	)

	func retrievePaymentRequestDetails(
		paymentRequestId: String,
		completion: @escaping ApiCompletion<MerchantPaymentDetails>
	)

	func deletePaymentRequest(
		paymentRequestId: String,
		completion: @escaping ApiCompletion<Void>
	)

	func refundTransaction(
		transactionId: String,
		refundDetails: TransactionRefundDetails,
		completion: @escaping ApiCompletion<MerchantTransactionSummary>
	)

	func retrievePreferences(completion: @escaping ApiCompletion<MerchantPreferences>)

	func setPreferences(
		preferences: MerchantPreferences,
		completion: @escaping ApiCompletion<Void>
	)

	func retrieveSchemas(completion: @escaping ApiCompletion<MerchantSchemaSummaries>)

	func retrieveSchemaDetails(
		schemaId: String,
		completion: @escaping ApiCompletion<MerchantSchema>
	)

	func createSchema(
		schema: MerchantSchema,
		completion: @escaping ApiCompletion<MerchantSchemaSummary>
	)

	func createPaymentSession(
		request: CreatePaymentSessionRequest,
		completion: @escaping ApiCompletion<CreatePaymentSessionResult>
	)

	func retrievePaymentSession(
		paymentSessionId: String,
		completion: @escaping ApiCompletion<PaymentSession>
	)

	func updatePaymentSession(
		paymentSessionId: String,
		session: MerchantUpdatePaymentSessionRequest,
		completion: @escaping ApiCompletion<Void>
	)

	func deletePaymentSession(
		paymentSessionId: String,
		completion: @escaping ApiCompletion<Void>
	)
}

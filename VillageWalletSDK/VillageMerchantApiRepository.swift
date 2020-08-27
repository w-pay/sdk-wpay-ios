import UIKit

public typealias MerchantPreferences = [String: [String: String]]

public protocol VillageMerchantApiRepository: VillageAdministrationApiRepository {
	func retrieveTransactions(
		page: Int?,
		pageSize: Int?,
		endTime: Date?,
		startTime: Date?,
		completion: @escaping ApiResult<MerchantTransactionSummaries>
	)

	func retrieveTransactionDetails(
		transactionId: String,
		completion: @escaping ApiResult<MerchantTransactionDetails>
	)

	func createPaymentRequestQRCode(
		details: NewPaymentRequestQRCode,
		completion: @escaping ApiResult<QRCode>
	)

	func retrievePaymentRequestBy(
		qrCodeId: String,
		completion: @escaping ApiResult<QRCode>
	)

	func cancelPaymentQRCode(
		qrCodeId: String,
		completion: @escaping ApiResult<Void>
	)

	func retrievePaymentList(
		type: String?,
		page: Int?,
		pageSize: Int?,
		completion: @escaping ApiResult<MerchantPaymentSummaries>
	)

	func createNewPaymentRequest(
		paymentRequest: NewPaymentRequest,
		completion: @escaping ApiResult<CreatePaymentRequestResult>
	)

	func retrievePaymentRequestDetails(
		paymentRequestId: String,
		completion: @escaping ApiResult<MerchantPaymentDetails>
	)

	func deletePaymentRequest(
		paymentRequestId: String,
		completion: @escaping ApiResult<Void>
	)

	func refundTransaction(
		transactionId: String,
		refundDetails: TransactionRefundDetails,
		completion: @escaping ApiResult<MerchantTransactionSummary>
	)

	func retrievePreferences(completion: @escaping ApiResult<MerchantPreferences>)

	func setPreferences(
		preferences: MerchantPreferences,
		completion: @escaping ApiResult<Void>
	)

	func retrieveSchemas(completion: @escaping ApiResult<MerchantSchemaSummaries>)

	func retrieveSchemaDetails(
		schemaId: String,
		completion: @escaping ApiResult<MerchantSchema>
	)

	func createSchema(
		schema: MerchantSchema,
		completion: @escaping ApiResult<MerchantSchemaSummary>
	)

	func createPaymentSession(
		request: CreatePaymentSessionRequest,
		completion: @escaping ApiResult<CreatePaymentSessionResult>
	)

	func retrievePaymentSession(
		paymentSessionId: String,
		completion: @escaping ApiResult<PaymentSession>
	)

	func updatePaymentSession(
		paymentSessionId: String,
		session: MerchantUpdatePaymentSessionRequest,
		completion: @escaping ApiResult<Void>
	)

	func deletePaymentSession(
		paymentSessionId: String,
		completion: @escaping ApiResult<Void>
	)
}

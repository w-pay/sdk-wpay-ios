import UIKit

public typealias MerchantPreferences = [String: [String: String]]

public protocol VillageMerchantApiRepository: VillageAdministrationApiRepository {
	func retrieveTransactions(
		page: Int?,
		pageSize: Int?,
		endTime: Date?,
		startTime: Date?,
		callback: @escaping ApiResult<MerchantTransactionSummaries>
	)

	func retrieveTransactionDetails(
		transactionId: String,
		callback: @escaping ApiResult<MerchantTransactionDetails>
	)

	func createPaymentRequestQRCode(
		details: NewPaymentRequestQRCode,
		callback: @escaping ApiResult<QRCode>
	)

	func retrievePaymentRequestQRCodeContent(
		qrCodeId: String,
		callback: @escaping ApiResult<QRCode>
	)

	func cancelPaymentQRCode(
		qrCodeId: String,
		callback: @escaping ApiResult<Void>
	)

	func retrievePaymentList(
		type: String?,
		page: Int?,
		pageSize: Int?,
		callback: @escaping ApiResult<MerchantPaymentSummaries>
	)

	func createNewPaymentRequest(
		paymentRequest: NewPaymentRequest,
		callback: @escaping ApiResult<CreatePaymentRequestResult>
	)

	func retrievePaymentRequestDetails(
		paymentRequestId: String,
		callback: @escaping ApiResult<MerchantPaymentDetails>
	)

	func deletePaymentRequest(
		paymentRequestId: String,
		callback: @escaping ApiResult<Void>
	)

	func refundTransaction(
		transactionId: String,
		refundDetails: TransactionRefundDetails,
		callback: @escaping ApiResult<MerchantTransactionSummary>
	)

	func retrievePreferences(callback: @escaping ApiResult<MerchantPreferences>)

	func setPreferences(
		preferences: MerchantPreferences,
		callback: @escaping ApiResult<Void>
	)

	func retrieveSchemas(callback: @escaping ApiResult<MerchantSchemaSummaries>)

	func retrieveSchemaDetails(
		schemaId: String,
		callback: @escaping ApiResult<MerchantSchema>
	)

	func createSchema(
		schema: MerchantSchema,
		callback: @escaping ApiResult<MerchantSchemaSummary>
	)

	func createPaymentSession(
		request: CreatePaymentSessionRequest,
		callback: @escaping ApiResult<CreatePaymentSessionResult>
	)

	func retrievePaymentSession(
		paymentSessionId: String,
		callback: @escaping ApiResult<PaymentSession>
	)

	func updatePaymentSession(
		paymentSessionId: String,
		session: MerchantUpdatePaymentSessionRequest,
		callback: @escaping ApiResult<Void>
	)

	func deletePaymentSession(
		paymentSessionId: String,
		callback: @escaping ApiResult<Void>
	)
}

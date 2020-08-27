import UIKit

public typealias CustomerPreferences = [String: [String: String]]

/**
 * Defines the low level API operations that the SDK can use to call the Customer Village API
 */
public protocol VillageCustomerApiRepository: VillageAdministrationApiRepository {
	func retrieveTransactions(
		paymentRequestId: String?,
		page: Int?,
		pageSize: Int?,
		endTime: Date?,
		startTime: Date?,
		completion: @escaping ApiResult<CustomerTransactionSummaries>
	)

	func retrieveTransactionDetails(
		transactionId: String,
		completion: @escaping ApiResult<CustomerTransactionDetails>
	)

	func retrievePaymentRequestDetailsBy(
		qrCodeId: String,
		completion: @escaping ApiResult<CustomerPaymentRequest>
	)

	func retrievePaymentRequestDetailsBy(
		paymentRequestId: String,
		completion: @escaping ApiResult<CustomerPaymentRequest>
	)

	/**
	 * @param wallet When set to MERCHANT retrieves only from merchant wallet. EVERYDAY_PAY retrieves both merchant and everyday pay wallet instruments.
	 */
	func retrievePaymentInstruments(
		wallet: Wallet,
		completion: @escaping ApiResult<AllPaymentInstruments>
	)

	func deletePaymentInstrument(
		instrument: PaymentInstrumentIdentifier,
		completion: @escaping ApiResult<Void>
	)

	func makePayment(
		paymentRequestId: String,
		primaryInstrument: PaymentInstrumentIdentifier,
		secondaryInstruments: [SecondaryPaymentInstrument]?,
		clientReference: String?,
		challengeResponses: [ChallengeResponse]?,
		completion: @escaping ApiResult<CustomerTransactionSummary>
	)
	
	func initiatePaymentInstrumentAddition(
		instrument: PaymentInstrumentAddition,
		completion: @escaping ApiResult<PaymentInstrumentAdditionResult>
	)

	func retrievePreferences(completion: @escaping ApiResult<CustomerPreferences>)

	func setPreferences(
		preferences: CustomerPreferences,
		completion: @escaping ApiResult<Void>
	)

	func retrievePaymentSessionBy(
		paymentSessionId: String,
		completion: @escaping ApiResult<PaymentSession>
	)

	func retrievePaymentSessionBy(
		qrCodeId: String,
		completion: @escaping ApiResult<PaymentSession>
	)

	func updatePaymentSession(
		paymentSessionId: String,
		session: CustomerUpdatePaymentSessionRequest,
		completion: @escaping ApiResult<Void>
	)
}
